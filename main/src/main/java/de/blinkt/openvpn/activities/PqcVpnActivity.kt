// Logs added version of PqcVpnActivity.kt

package de.blinkt.openvpn.activities

import android.app.Activity
import android.content.ComponentName
import android.content.Intent
import android.content.ServiceConnection
import android.content.pm.PackageManager
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
import de.blinkt.openvpn.core.OpenVPNService
import de.blinkt.openvpn.core.ProfileManager
import de.blinkt.openvpn.core.VpnProfile
import de.blinkt.openvpn.databinding.ActivityPqcVpnBinding
import kotlinx.coroutines.launch
import java.io.BufferedReader
import java.io.InputStreamReader

class PqcVpnActivity : AppCompatActivity() {

    private lateinit var binding: ActivityPqcVpnBinding
    private val clientCertFolders = mutableListOf<String>()
    private lateinit var spinnerAdapter: ArrayAdapter<String>
    private var certsFolderUri: Uri? = null

    private val serviceConnection = object : ServiceConnection {
        override fun onServiceConnected(name: ComponentName, service: IBinder) {
            Log.d(TAG, "Service connected: $name")
            Log.d(TAG, "onServiceConnected")
            updateStatus("Status: Connected to VPN service.")
        }

        override fun onServiceDisconnected(name: ComponentName) {
            Log.d(TAG, "Service disconnected: $name")
            updateStatus("Status: Disconnected from VPN service.")
        }
    }

    private val vpnPermissionLauncher =
        registerForActivityResult(ActivityResultContracts.StartActivityForResult()) { result ->
            Log.d(TAG, "onActivityResult(VPN_PERMISSION) → ${result.resultCode}")
            if (result.resultCode == Activity.RESULT_OK) {
                Log.d(TAG, "VPN permission granted")
                actuallyStartVpn()
            } else {
                Log.d(TAG, "VPN permission denied by user")
                updateStatus("Status: VPN permission denied.")
            }
        }

    private val openDirectoryLauncher =
        registerForActivityResult(ActivityResultContracts.StartActivityForResult()) { result ->
            Log.d(TAG, "onActivityResult(OPEN_DOC_TREE) → ${result.resultCode}")
            if (result.resultCode == Activity.RESULT_OK) {
                result.data?.data?.also { uri ->
                    Log.d(TAG, "Received URI: $uri")
                    try {
                        contentResolver.takePersistableUriPermission(
                            uri,
                            Intent.FLAG_GRANT_READ_URI_PERMISSION or Intent.FLAG_GRANT_WRITE_URI_PERMISSION
                        )
                        certsFolderUri = uri
                        findClientFolders()
                    } catch (e: Exception) {
                        Log.e(TAG, "Error taking persistable URI permission", e)
                        updateStatus("ERROR: Couldn't get folder permissions: ${e.localizedMessage}")
                    }
                }
            } else {
                Log.d(TAG, "Folder picker cancelled")
            }
        }

    companion object {
        private const val TAG = "PQC_VPN_DEBUG"
    }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        Log.d(TAG, "onCreate() called")
        binding = ActivityPqcVpnBinding.inflate(layoutInflater)
        setContentView(binding.root)

        title = "PQC VPN Test Client"

        spinnerAdapter = ArrayAdapter(this, android.R.layout.simple_spinner_item, clientCertFolders)
        spinnerAdapter.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item)
        binding.spinnerPqcKem.adapter = spinnerAdapter

        binding.buttonSelectFolder.setOnClickListener {
            Log.d(TAG, "User clicked 'Select Folder'")
            updateStatus("Opening folder picker…")
            openDirectoryPicker()
        }

        binding.buttonConnect.setOnClickListener {
            Log.d(TAG, "User clicked 'Connect'")
            val folder = binding.spinnerPqcKem.selectedItem as? String
            if (folder == null) {
                Log.d(TAG, "No folder selected, showing toast")
                Toast.makeText(this, "Select a cert folder first.", Toast.LENGTH_SHORT).show()
                return@setOnClickListener
            }
            Log.d(TAG, "Selected folder: $folder")
            requestVpnPermission()
        }

        updateStatus("Status: Please select your 'certs' folder.")
    }

    override fun onStart() {
        super.onStart()
        Log.d(TAG, "onStart() → Binding to OpenVPNService")
        bindService(Intent(this, OpenVPNService::class.java), serviceConnection, BIND_AUTO_CREATE)
    }

    override fun onResume() {
        super.onResume()
        Log.d(TAG, "onResume()")
    }

    override fun onPause() {
        super.onPause()
        Log.d(TAG, "onPause()")
    }

    override fun onStop() {
        super.onStop()
        Log.d(TAG, "onStop() → Unbinding service")
        unbindService(serviceConnection)
    }

    override fun onDestroy() {
        super.onDestroy()
        Log.d(TAG, "onDestroy()")
    }

    private fun openDirectoryPicker() {
        Log.d(TAG, "Launching directory picker")
        openDirectoryLauncher.launch(Intent(Intent.ACTION_OPEN_DOCUMENT_TREE))
    }

    private fun findClientFolders() {
        Log.d(TAG, "Scanning selected folder for cert directories")
        updateStatus("Status: Scanning for certificates…")
        lifecycleScope.launch {
            val uri = certsFolderUri ?: run {
                Log.w(TAG, "certsFolderUri is null")
                updateStatus("ERROR: No folder selected.")
                return@launch
            }
            val parent = DocumentFile.fromTreeUri(this@PqcVpnActivity, uri)
            if (parent == null || !parent.isDirectory) {
                Log.e(TAG, "Invalid folder URI or not a directory")
                updateStatus("ERROR: Bad folder URI.")
                return@launch
            }

            Log.d(TAG, "Found folder: ${parent.name}")
            val found = parent.listFiles()
                .filter {
                    val hasCert = it.findFile("client_cert.crt")?.exists() == true
                    val hasKey = it.findFile("client_key.key")?.exists() == true
                    Log.d(TAG, "Checking ${it.name} → cert: $hasCert, key: $hasKey")
                    it.isDirectory && hasCert && hasKey
                }
                .mapNotNull { it.name }

            clientCertFolders.clear()
            clientCertFolders.addAll(found)
            spinnerAdapter.notifyDataSetChanged()

            Log.d(TAG, "Found ${found.size} cert folders: $found")

            updateStatus(
                if (found.isEmpty())
                    "Status: No valid client folders found."
                else
                    "Status: Found ${found.size} folder(s)."
            )
        }
    }

    private fun requestVpnPermission() {
        Log.d(TAG, "Requesting VPN permission from system")
        updateStatus("Status: Requesting VPN permission…")
        VpnService.prepare(this)?.let {
            Log.d(TAG, "VPN permission not yet granted, launching system dialog")
            vpnPermissionLauncher.launch(it)
        } ?: run {
            Log.d(TAG, "VPN permission already granted")
            actuallyStartVpn()
        }
    }

    private fun actuallyStartVpn() {
        val folderName = binding.spinnerPqcKem.selectedItem as String
        Log.d(TAG, "Preparing to start VPN with folder: $folderName")
        updateStatus("Status: Verifying '$folderName'…")

        lifecycleScope.launch {
            val parentUri = certsFolderUri ?: run {
                Log.e(TAG, "certsFolderUri is null during VPN start")
                updateStatus("ERROR: No certs URI.")
                return@launch
            }

            val parent = DocumentFile.fromTreeUri(this@PqcVpnActivity, parentUri)!!
            Log.d(TAG, "Certs root folder: ${parent.name}")
            val clientDir = parent.findFile(folderName)!!
            val ca = parent.findFile("ca_cert.crt")!!
            val cc = clientDir.findFile("client_cert.crt")!!
            val ck = clientDir.findFile("client_key.key")!!

            fun read(uri: Uri): String {
                Log.d(TAG, "Reading file from URI: $uri")
                return try {
                    contentResolver.openInputStream(uri)!!
                        .bufferedReader().readText()
                } catch (e: Exception) {
                    Log.e(TAG, "Failed reading file", e)
                    updateStatus("ERROR reading file: ${e.localizedMessage}")
                    throw e
                }
            }

            val profile = VpnProfile("PQC Test - $folderName").apply {
                mConnections[0].apply {
                    mServerName = "48.209.35.108"
                    mServerPort = "1194"
                    mUseUdp = true
                }
                mExpectTLSCert = true
                mCaFilename = "[[INLINE]]${read(ca.uri)}"
                mClientCertFilename = "[[INLINE]]${read(cc.uri)}"
                mClientKeyFilename = "[[INLINE]]${read(ck.uri)}"
            }

            Log.d(TAG, "Profile created for $folderName")

            try {
                ProfileManager.getInstance(this@PqcVpnActivity).also { pm ->
                    Log.d(TAG, "Saving profile to ProfileManager")
                    pm.addProfile(profile)
                    ProfileManager.saveProfile(this@PqcVpnActivity, profile)
                    pm.saveProfileList(this@PqcVpnActivity)
                }

                updateStatus("Status: Starting VPN…")
                Log.d(TAG, "Starting VPN via startForegroundService()")
                ContextCompat.startForegroundService(
                    this@PqcVpnActivity,
                    profile.getStartServiceIntent(this@PqcVpnActivity, "PQC Start", true)
                )
                updateStatus("Status: VPN connection started successfully.")
            } catch (e: Exception) {
                Log.e(TAG, "Failed to start VPN", e)
                updateStatus("ERROR starting VPN: ${e.localizedMessage}")
            }
        }
    }

    private fun updateStatus(msg: String) {
        Log.d(TAG, "updateStatus() → $msg")
        binding.textStatus.text = msg
    }
}