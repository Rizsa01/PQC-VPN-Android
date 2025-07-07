package de.blinkt.openvpn.activities

import android.app.Activity
import android.content.Intent
import android.content.pm.PackageManager
import android.net.Uri
import android.net.VpnService
import android.os.Build
import android.os.Bundle
import android.os.Environment
import android.util.Log
import android.widget.ArrayAdapter
import android.widget.Toast
import androidx.activity.result.contract.ActivityResultContracts
import androidx.appcompat.app.AppCompatActivity
import androidx.core.app.ActivityCompat
import androidx.core.content.ContextCompat
import androidx.documentfile.provider.DocumentFile
import de.blinkt.openvpn.core.ProfileManager
import de.blinkt.openvpn.core.VpnProfile
import de.blinkt.openvpn.core.OpenVPNService
import de.blinkt.openvpn.databinding.ActivityPqcVpnBinding
import java.io.BufferedReader
import java.io.File
import java.io.IOException
import java.io.InputStreamReader
import java.util.*
import android.Manifest // Ensure this import is present

class PqcVpnActivity : AppCompatActivity() {

    private lateinit var binding: ActivityPqcVpnBinding
    private val clientCertFolders = mutableListOf<String>()
    private lateinit var spinnerAdapter: ArrayAdapter<String>
    private var certsFolderUri: Uri? = null

    // ActivityResultLauncher for the VPN permission dialog
    private val vpnPermissionLauncher = registerForActivityResult(ActivityResultContracts.StartActivityForResult()) { result ->
        if (result.resultCode == Activity.RESULT_OK) {
            Log.i(TAG, "VPN permission GRANTED by user.")
            // The user just granted permission, so we can now re-try starting the VPN.
            val selectedFolder = binding.spinnerPqcKem.selectedItem as? String
            if (selectedFolder != null) {
                startVpn(selectedFolder)
            }
        } else {
            Log.e(TAG, "VPN permission DENIED by user.")
            updateStatus("Status: VPN permission denied. Cannot connect.")
        }
    }

    // ActivityResultLauncher for the folder picker
    private val openDirectoryLauncher = registerForActivityResult(ActivityResultContracts.StartActivityForResult()) { result ->
        if (result.resultCode == Activity.RESULT_OK) {
            result.data?.data?.also { uri ->
                Log.i(TAG, "User selected directory URI: $uri")
                // Persist the permission across app restarts
                val contentResolver = applicationContext.contentResolver
                val takeFlags: Int = Intent.FLAG_GRANT_READ_URI_PERMISSION or Intent.FLAG_GRANT_WRITE_URI_PERMISSION
                contentResolver.takePersistableUriPermission(uri, takeFlags)

                certsFolderUri = uri
                findClientFolders()
            }
        }
    }

    companion object {
        private const val TAG = "PQC_VPN_DEBUG"
        private const val PERMISSIONS_REQUEST_READ_EXTERNAL_STORAGE = 101
    }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = ActivityPqcVpnBinding.inflate(layoutInflater)
        setContentView(binding.root)
        Log.d(TAG, "Activity onCreate")

        title = "PQC VPN Test Client"

        spinnerAdapter = ArrayAdapter(this, android.R.layout.simple_spinner_item, clientCertFolders)
        spinnerAdapter.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item)
        binding.spinnerPqcKem.adapter = spinnerAdapter

        binding.buttonSelectFolder.setOnClickListener {
            openDirectoryPicker()
        }

        binding.buttonConnect.setOnClickListener {
            val selectedFolder = binding.spinnerPqcKem.selectedItem as? String
            if (selectedFolder != null) {
                startVpn(selectedFolder)
            } else {
                Toast.makeText(this, "Please select a certificate folder first.", Toast.LENGTH_SHORT).show()
            }
        }

        updateStatus("Status: Please select the 'certs' folder.")
        // Instead of calling directly, we wait for the user to grant permission.
        // The permission check will trigger the folder scan.
        checkAndRequestStoragePermission()
    }

    private fun openDirectoryPicker() {
        val intent = Intent(Intent.ACTION_OPEN_DOCUMENT_TREE)
        openDirectoryLauncher.launch(intent)
    }

    private fun updateStatus(message: String) {
        Log.d(TAG, message)
        binding.textStatus.text = message
    }

    private fun checkAndRequestStoragePermission() {
        Log.d(TAG, "Checking for READ_EXTERNAL_STORAGE permission...")
        if (ContextCompat.checkSelfPermission(this, Manifest.permission.READ_EXTERNAL_STORAGE) != PackageManager.PERMISSION_GRANTED) {
            updateStatus("Status: Permission not found. Requesting from user...")
            ActivityCompat.requestPermissions(this, arrayOf(Manifest.permission.READ_EXTERNAL_STORAGE), PERMISSIONS_REQUEST_READ_EXTERNAL_STORAGE)
        } else {
            Log.d(TAG, "Storage permission already granted.")
            // If we already have permission, we can try to check for previously selected folders.
            // For simplicity in this test app, we just prompt the user to select again.
            updateStatus("Status: Please use 'Select Certs Folder' button.")
        }
    }

    override fun onRequestPermissionsResult(requestCode: Int, permissions: Array<out String>, grantResults: IntArray) {
        super.onRequestPermissionsResult(requestCode, permissions, grantResults)
        if (requestCode == PERMISSIONS_REQUEST_READ_EXTERNAL_STORAGE) {
            if (grantResults.isNotEmpty() && grantResults[0] == PackageManager.PERMISSION_GRANTED) {
                Log.i(TAG, "READ_EXTERNAL_STORAGE permission granted by user.")
                updateStatus("Status: Storage permission granted. Please select the 'certs' folder.")
            } else {
                Log.e(TAG, "READ_EXTERNAL_STORAGE permission denied by user.")
                updateStatus("Status: Permission to read files denied.")
            }
        }
    }

    private fun findClientFolders() {
        val folderUri = certsFolderUri ?: return
        updateStatus("Status: Scanning selected folder for certificates...")

        val parentDocFile = DocumentFile.fromTreeUri(this, folderUri)
        if (parentDocFile == null || !parentDocFile.exists() || !parentDocFile.isDirectory) {
            updateStatus("ERROR: Could not access the selected folder.")
            return
        }

        val foundFolders = parentDocFile.listFiles().filter { docFile ->
            docFile.isDirectory &&
                    docFile.findFile("client_cert.crt")?.exists() == true &&
                    docFile.findFile("client_key.key")?.exists() == true
        }.mapNotNull { it.name }

        Log.i(TAG, "Scan complete. Found folders: $foundFolders")

        clientCertFolders.clear()
        clientCertFolders.addAll(foundFolders)
        spinnerAdapter.notifyDataSetChanged()

        if (clientCertFolders.isEmpty()) {
            updateStatus("Status: No valid client folders found in the selected directory.")
        } else {
            updateStatus("Status: Found ${clientCertFolders.size} folder(s). Please select one.")
        }
    }

    private fun startVpn(folderName: String) {
        // Step 1: Check for VPN Permission before doing anything else.
        val vpnIntent = VpnService.prepare(this)
        if (vpnIntent != null) {
            updateStatus("Status: Awaiting user permission for VPN connection...")
            Log.w(TAG, "VPN permission not yet granted. Launching system dialog.")
            vpnPermissionLauncher.launch(vpnIntent)
            return // Exit the function and wait for the user's response from the launcher.
        }

        // Step 2: If we get here, permission is already granted. Proceed with building the profile.
        Log.i(TAG, "VPN permission already granted. Proceeding with connection.")
        updateStatus("Status: Verifying files for '$folderName'...")

        val parentFolderUri = certsFolderUri ?: run {
            updateStatus("ERROR: Certs folder permission lost. Please re-select.")
            return
        }
        val parentFolder = DocumentFile.fromTreeUri(this, parentFolderUri)!!

        val clientFolder = parentFolder.findFile(folderName)
        if (clientFolder == null || !clientFolder.isDirectory) {
            updateStatus("ERROR: Could not find client subfolder '$folderName'.")
            return
        }

        val caCertDoc = parentFolder.findFile("ca_cert.crt")
        if (caCertDoc == null || !caCertDoc.exists()) {
            updateStatus("ERROR: ca_cert.crt not found in selected folder.")
            return
        }

        val clientCertDoc = clientFolder.findFile("client_cert.crt")
        if (clientCertDoc == null || !clientCertDoc.exists()) {
            updateStatus("ERROR: client_cert.crt not found inside '$folderName'.")
            return
        }

        val clientKeyDoc = clientFolder.findFile("client_key.key")
        if (clientKeyDoc == null || !clientKeyDoc.exists()) {
            updateStatus("ERROR: client_key.key not found inside '$folderName'.")
            return
        }

        updateStatus("Status: All files found. Reading contents...")

        try {
            val caCert = readTextFromUri(caCertDoc.uri)
            val clientCert = readTextFromUri(clientCertDoc.uri)
            val clientKey = readTextFromUri(clientKeyDoc.uri)
            Log.i(TAG, "All certificate files read successfully.")

            val profileName = "PQC Test - $folderName"
            val profile = VpnProfile(profileName)

            profile.mConnections[0].mServerName = "48.209.35.108"
            profile.mConnections[0].mServerPort = "1194"
            profile.mConnections[0].mUseUdp = true
            profile.mExpectTLSCert = true

            profile.mCaFilename = "[[INLINE]]$caCert"
            profile.mClientCertFilename = "[[INLINE]]$clientCert"
            profile.mClientKeyFilename = "[[INLINE]]$clientKey"

            Log.d(TAG, "Profile created. Embedding certs.")

            val pm = ProfileManager.getInstance(this)
            pm.addProfile(profile)
            ProfileManager.saveProfile(this, profile)
            pm.saveProfileList(this)
            Log.i(TAG, "Profile '$profileName' saved.")

            val serviceIntent = profile.getStartServiceIntent(this, "PQC Test Manual Start", true)
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
                startForegroundService(serviceIntent)
            } else {
                startService(serviceIntent)
            }
            updateStatus("Status: Connecting... Check notification & Logcat for OpenVPN logs.")

        } catch (e: Exception) {
            updateStatus("ERROR: Failed to read file contents or start VPN.")
            Log.e(TAG, "Error during file read or VPN start", e)
        }
    }

    @Throws(IOException::class)
    private fun readTextFromUri(uri: Uri): String {
        val stringBuilder = StringBuilder()
        contentResolver.openInputStream(uri)?.use { inputStream ->
            BufferedReader(InputStreamReader(inputStream)).use { reader ->
                var line: String? = reader.readLine()
                while (line != null) {
                    stringBuilder.append(line).append('\n')
                    line = reader.readLine()
                }
            }
        }
        return stringBuilder.toString()
    }
}