package de.blinkt.openvpn.activities

import android.app.Activity
import android.content.*
import android.net.Uri
import android.net.VpnService
import android.os.Bundle
import android.os.IBinder
import android.util.Log
import android.widget.ArrayAdapter
import android.widget.Toast
import androidx.activity.result.contract.ActivityResultContracts
import androidx.appcompat.app.AppCompatActivity
import androidx.core.content.ContextCompat
import androidx.documentfile.provider.DocumentFile
import androidx.lifecycle.lifecycleScope
import de.blinkt.openvpn.core.*
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.launch
import kotlinx.coroutines.withContext
import java.io.BufferedReader
import java.io.IOException
import java.io.InputStreamReader
import de.blinkt.openvpn.databinding.ActivityPqcVpnBinding


class PqcVpnActivity : AppCompatActivity(), VpnStatus.StateListener {

    private lateinit var binding: ActivityPqcVpnBinding
    private val clientCertFolders = mutableListOf<String>()
    private lateinit var spinnerAdapter: ArrayAdapter<String>
    private var certsFolderUri: Uri? = null

    companion object {
        private const val TAG = "PQC_VPN_DEBUG_LOG"
    }

    // ------------------------------------------------------------------------------------------------
    // 1) SERVICE BINDING TO GET MANAGEMENT-LEVEL CALLBACKS
    // ------------------------------------------------------------------------------------------------

    private val serviceConnection = object : ServiceConnection {
        override fun onServiceConnected(name: ComponentName, service: IBinder) {
            Log.d(TAG, "✔️ Service Bound: OpenVPNService is connected.")
            updateStatus("Status: Control channel is open.")
        }
        override fun onServiceDisconnected(name: ComponentName) {
            Log.d(TAG, "❌ Service Unbound: OpenVPNService has been disconnected.")
            updateStatus("Status: Control channel is closed.")
        }
    }

    override fun onStart() {
        super.onStart()
        Log.d(TAG, "onStart(): Binding to OpenVPNService…")
        val intent = Intent(this, OpenVPNService::class.java)
        intent.action = OpenVPNService.START_SERVICE
        bindService(intent, serviceConnection, BIND_AUTO_CREATE)
        VpnStatus.addStateListener(this)
    }

    override fun onStop() {
        super.onStop()
        Log.d(TAG, "onStop(): Unbinding from OpenVPNService…")
        unbindService(serviceConnection)
        VpnStatus.removeStateListener(this)
    }

    // ------------------------------------------------------------------------------------------------
    // 2) UI & CERT FOLDER PICKING
    // ------------------------------------------------------------------------------------------------

    private val openDirectoryLauncher =
        registerForActivityResult(ActivityResultContracts.StartActivityForResult()) { result ->
            Log.d(TAG, "Directory picker result received. ResultCode: ${result.resultCode}")
            if (result.resultCode == Activity.RESULT_OK) {
                result.data?.data?.also { uri ->
                    Log.d(TAG, "Successfully picked URI: $uri")
                    try {
                        contentResolver.takePersistableUriPermission(
                            uri, Intent.FLAG_GRANT_READ_URI_PERMISSION
                        )
                        Log.d(TAG, "Successfully took persistable URI permission.")
                        certsFolderUri = uri
                        findClientFolders()
                    } catch (e: SecurityException) {
                        Log.e(TAG, "Failed to take persistable URI permission.", e)
                        updateStatus("Error: Could not get permission for folder.")
                    }
                }
            } else {
                Log.w(TAG, "User cancelled the directory picker.")
                updateStatus("Folder selection cancelled.")
            }
        }

    private fun findClientFolders() {
        updateStatus("Scanning for certificate subfolders…")
        val parentUri = certsFolderUri
        if (parentUri == null) {
            updateStatus("ERROR: Certificate folder URI is null. Please select a folder.")
            Log.e(TAG, "findClientFolders() called with a null certsFolderUri.")
            return
        }

        lifecycleScope.launch(Dispatchers.IO) {
            Log.d(TAG, "Starting search for client folders in background thread.")
            val parent = DocumentFile.fromTreeUri(this@PqcVpnActivity, parentUri)
            if (parent == null || !parent.isDirectory) {
                withContext(Dispatchers.Main) {
                    updateStatus("ERROR: Invalid certs folder. Could not create DocumentFile.")
                    Log.e(TAG, "Failed to create DocumentFile from URI: $parentUri")
                }
                return@launch
            }

            Log.d(TAG, "Scanning files in directory: ${parent.name}")
            val found = parent.listFiles().filter {
                val isDir = it.isDirectory
                val hasCert = it.findFile("client_cert.crt")?.exists() == true
                val hasKey = it.findFile("client_key.key")?.exists() == true
                // We no longer require ca.crt to be present for the folder to be listed
                Log.d(TAG, "  - Checking folder '${it.name}': isDirectory=$isDir, hasCert=$hasCert, hasKey=$hasKey")
                isDir && hasCert && hasKey
            }.mapNotNull { it.name }

            withContext(Dispatchers.Main) {
                clientCertFolders.clear()
                clientCertFolders.addAll(found)
                spinnerAdapter.notifyDataSetChanged()

                val statusMessage = if (found.isEmpty()) {
                    "No valid client folders found in the selected directory."
                } else {
                    "Found ${found.size} folder(s): ${found.joinToString()}. Ready to connect."
                }
                Log.d(TAG, "Scan complete. $statusMessage")
                updateStatus(statusMessage)
            }
        }
    }

    // ------------------------------------------------------------------------------------------------
    // 3) VPN PERMISSION & LAUNCH
    // ------------------------------------------------------------------------------------------------

    private val vpnPermissionLauncher =
        registerForActivityResult(ActivityResultContracts.StartActivityForResult()) { res ->
            if (res.resultCode == Activity.RESULT_OK) {
                Log.d(TAG, "VPN permission GRANTED by user.")
                updateStatus("VPN permission granted. Trying to connect...")
                actuallyStartVpn()
            } else {
                Log.w(TAG, "VPN permission DENIED by user.")
                updateStatus("VPN permission was denied. Cannot start connection.")
            }
        }

    private fun requestVpnPermission() {
        updateStatus("Requesting VPN permission from Android system…")
        Log.d(TAG, "Checking if VPN permission is needed.")
        VpnService.prepare(this)?.let {
            Log.d(TAG, "Permission needed. Launching system dialog.")
            vpnPermissionLauncher.launch(it)
        } ?: run {
            Log.d(TAG, "Permission already granted. Proceeding to start VPN.")
            actuallyStartVpn()
        }
    }

    private fun readTextFromFileInDir(baseDirUri: Uri, subDirName: String, targetFileName: String): String? {
        Log.d(TAG, "Attempting to read file: $targetFileName from subdir: $subDirName")
        val parentDir = DocumentFile.fromTreeUri(this, baseDirUri)
        val subDir = parentDir?.findFile(subDirName)
        if (subDir == null || !subDir.isDirectory) {
            Log.e(TAG, "Subdirectory '$subDirName' not found or is not a directory.")
            return null
        }

        val targetFile = subDir.findFile(targetFileName)
        if (targetFile == null || !targetFile.canRead()) {
            Log.e(TAG, "File '$targetFileName' not found in '$subDirName' or cannot be read.")
            return null
        }

        Log.d(TAG, "File '$targetFileName' found. Reading content...")
        try {
            contentResolver.openInputStream(targetFile.uri)?.use { inputStream ->
                BufferedReader(InputStreamReader(inputStream)).use { reader ->
                    val content = reader.readText()
                    Log.d(TAG, "Successfully read ${content.length} characters from $targetFileName.")
                    return content
                }
            }
        } catch (e: IOException) {
            Log.e(TAG, "IOException while reading file ${targetFile.uri}", e)
        }
        return null
    }

    private fun actuallyStartVpn() {
        val folderName = binding.spinnerPqcKem.selectedItem as? String
        val baseUri = certsFolderUri

        if (folderName == null || baseUri == null) {
            updateStatus("Error: No certificate folder selected. Cannot start.")
            Log.e(TAG, "actuallyStartVpn failed: folderName or baseUri is null.")
            return
        }

        updateStatus("Building profile with PQC parameters for '$folderName'...")
        Log.d(TAG, "Building profile with explicit PQC parameters for KEM: $folderName")

        lifecycleScope.launch {
            try {
                val profile = withContext(Dispatchers.IO) {
                    // --- Step 1: Read the certificate files ---
                    val caCert = readTextFromFileInDir(baseUri, folderName, "ca_cert.crt")
                    val clientCert = readTextFromFileInDir(baseUri, folderName, "client_cert.crt")
                    val clientKey = readTextFromFileInDir(baseUri, folderName, "client_key.key")

                    if (caCert == null || clientCert == null || clientKey == null) {
                        withContext(Dispatchers.Main) {
                            updateStatus("ERROR: ca_cert.crt, client_cert.crt, or client_key.key is missing!")
                        }
                        return@withContext null
                    }

                    // --- Step 2: Create and configure the profile programmatically ---
                    VpnProfile("PQC-$folderName").apply {
                        // --- General Settings ---
                        mUseCustomConfig = false

                        // --- Connection Settings ---
                        if (mConnections == null || mConnections.isEmpty()) {
                            mConnections = arrayOf(Connection())
                        }
                        mConnections[0].mServerName = "48.209.35.108"
                        mConnections[0].mServerPort = "1194"
                        mConnections[0].mUseUdp = true

                        // --- Standard Client Options ---
                        mNobind = true
                        mUsePull = true

                        // --- Security Settings ---
                        mCheckRemoteCN = true
                        mExpectTLSCert = true
                        mX509AuthType = VpnProfile.X509_VERIFY_TLSREMOTE_RDN

                        //==================================================================
                        // CRITICAL PQC SETTINGS - This is the definitive fix
                        //================================----------------==================
                        // TODO: Replace this placeholder with the value from your Linux client.config
                        // It will likely be a list like "p256_falcon512:kyber512" or similar.
                        mPqcKEMs = "p256_falcon512"

                        // Set the verbosity to maximum to get all possible debug output
                        mVerb = "5"
                        //==================================================================

                        // --- Embed Certificates and Key ---
                        mCaFilename = VpnProfile.INLINE_TAG + caCert
                        mClientCertFilename = VpnProfile.INLINE_TAG + clientCert
                        mClientKeyFilename = VpnProfile.INLINE_TAG + clientKey
                    }
                }

                if (profile == null) { return@launch }

                updateStatus("Profile created programmatically. Saving and starting service...")
                Log.d(TAG, "VPN Profile successfully created: ${profile.name}")

                val pm = ProfileManager.getInstance(this@PqcVpnActivity)
                pm.addProfile(profile)
                ProfileManager.saveProfile(this@PqcVpnActivity, profile)
                pm.saveProfileList(this@PqcVpnActivity)
                Log.d(TAG, "Profile saved to ProfileManager.")

                val intent = profile.getStartServiceIntent(this@PqcVpnActivity, "PQC Start", true)
                ContextCompat.startForegroundService(this@PqcVpnActivity, intent)
                updateStatus("Waiting for tunnel response…")

            } catch (e: Exception) {
                Log.e(TAG, "A critical exception occurred during VPN start process.", e)
                updateStatus("FATAL: An unexpected error occurred: ${e.message}")
            }
        }
    }
    // ------------------------------------------------------------------------------------------------
    // 4) VpnStatus.StateListener → real tunnel events
    // ------------------------------------------------------------------------------------------------

    override fun setConnectedVPN(uuid: String?) {
        Log.d(TAG, "StateListener: Service reports new connected VPN with UUID: $uuid")
        // This is called when the service acknowledges the profile.
    }

    override fun updateState(
        state: String,
        logmessage: String,
        resId: Int,
        level: ConnectionStatus,
        intent: Intent?
    ) {
        val fullLogMessage = VpnStatus.getLastCleanLogMessage(this)
        Log.d(TAG, "VPN State Changed: level=$level, state=$state, message='$fullLogMessage'")

        val statusText = when (level) {
            ConnectionStatus.LEVEL_START -> "Connection starting..."
            ConnectionStatus.LEVEL_CONNECTING_NO_SERVER_REPLY_YET -> "Connecting, no server reply yet..."
            ConnectionStatus.LEVEL_CONNECTING_SERVER_REPLIED -> "Connecting, server has replied..."
            ConnectionStatus.LEVEL_WAITING_FOR_USER_INPUT -> "Waiting for user credentials..."
            ConnectionStatus.LEVEL_AUTH_FAILED -> "❌ Authentication failed!"
            ConnectionStatus.LEVEL_CONNECTED -> "✅ Connected!"
            ConnectionStatus.LEVEL_NOTCONNECTED -> "Not connected."
            ConnectionStatus.LEVEL_NONETWORK -> "No network connection."
            ConnectionStatus.LEVEL_VPNPAUSED -> "Connection Paused"
            else -> state
        }
        updateStatus("$statusText\n(Detail: $fullLogMessage)")
    }


    // ------------------------------------------------------------------------------------------------
    // 5) Boilerplate
    // ------------------------------------------------------------------------------------------------

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = ActivityPqcVpnBinding.inflate(layoutInflater)
        setContentView(binding.root)
        title = "PQC VPN Test (Debug Mode)"

        spinnerAdapter = ArrayAdapter(this, android.R.layout.simple_spinner_item, clientCertFolders)
        spinnerAdapter.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item)
        binding.spinnerPqcKem.adapter = spinnerAdapter

        binding.buttonSelectFolder.setOnClickListener {
            Log.d(TAG, "Select Folder button clicked.")
            openDirectoryLauncher.launch(Intent(Intent.ACTION_OPEN_DOCUMENT_TREE))
        }

        binding.buttonConnect.setOnClickListener {
            Log.d(TAG, "Connect button clicked.")
            if (binding.spinnerPqcKem.selectedItem == null) {
                Toast.makeText(this, "Pick a certificate folder first", Toast.LENGTH_SHORT).show()
                Log.w(TAG, "Connect clicked but no cert folder was selected in spinner.")
            } else {
                requestVpnPermission()
            }
        }

        binding.buttonDisconnect.setOnClickListener {
            Log.d(TAG, "Disconnect button clicked.")
            updateStatus("Sending disconnect signal...")
            ProfileManager.setConntectedVpnProfileDisconnected(this)
        }

        updateStatus("Ready. Select your certificates folder.")
        Log.d(TAG, "onCreate finished. App is ready.")
    }

    private fun updateStatus(msg: String) {
        binding.textStatus.text = msg
    }
}