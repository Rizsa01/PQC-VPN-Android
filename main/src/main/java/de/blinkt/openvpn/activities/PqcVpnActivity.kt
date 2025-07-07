package de.blinkt.openvpn.activities

import android.Manifest
import android.content.Intent
import android.content.pm.PackageManager
import android.os.Build
import android.os.Bundle
import android.os.Environment
import android.util.Log
import android.widget.ArrayAdapter
import android.widget.Toast
import androidx.appcompat.app.AppCompatActivity
import androidx.core.app.ActivityCompat
import androidx.core.content.ContextCompat
import de.blinkt.openvpn.core.ProfileManager
import de.blinkt.openvpn.core.VpnProfile
import de.blinkt.openvpn.core.OpenVPNService
import de.blinkt.openvpn.databinding.ActivityPqcVpnBinding
import java.io.File
import java.io.FileNotFoundException
import java.util.*

class PqcVpnActivity : AppCompatActivity() {

    private lateinit var binding: ActivityPqcVpnBinding
    private val clientCertFolders = mutableListOf<String>()
    private lateinit var spinnerAdapter: ArrayAdapter<String>

    companion object {
        // Use a unique tag for easy Logcat filtering
        private const val TAG = "PQC_VPN_DEBUG"
        private const val PERMISSIONS_REQUEST_READ_EXTERNAL_STORAGE = 101
    }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = ActivityPqcVpnBinding.inflate(layoutInflater)
        setContentView(binding.root)
        Log.d(TAG, "Activity onCreate: View binding complete.")

        title = "PQC VPN Test Client"

        spinnerAdapter = ArrayAdapter(this, android.R.layout.simple_spinner_item, clientCertFolders)
        spinnerAdapter.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item)
        binding.spinnerPqcKem.adapter = spinnerAdapter

        binding.buttonConnect.setOnClickListener {
            val selectedFolder = binding.spinnerPqcKem.selectedItem as? String
            if (selectedFolder != null) {
                Log.d(TAG, "Connect button clicked for folder: $selectedFolder")
                startVpn(selectedFolder)
            } else {
                Log.w(TAG, "Connect button clicked, but no folder was selected.")
                Toast.makeText(this, "No client certificate folder selected.", Toast.LENGTH_SHORT).show()
            }
        }

        updateStatus("Status: Initializing and checking permissions...")
        checkAndRequestPermissions()
    }

    // A helper function to update both the screen and the logcat at the same time
    private fun updateStatus(message: String) {
        Log.d(TAG, message)
        binding.textStatus.text = message
    }

    private fun checkAndRequestPermissions() {
        Log.d(TAG, "Checking for READ_EXTERNAL_STORAGE permission...")
        if (ContextCompat.checkSelfPermission(this, Manifest.permission.READ_EXTERNAL_STORAGE) != PackageManager.PERMISSION_GRANTED) {
            updateStatus("Status: Permission not found. Requesting from user...")
            ActivityCompat.requestPermissions(this, arrayOf(Manifest.permission.READ_EXTERNAL_STORAGE), PERMISSIONS_REQUEST_READ_EXTERNAL_STORAGE)
        } else {
            Log.d(TAG, "Permission already granted.")
            findClientFolders()
        }
    }

    override fun onRequestPermissionsResult(requestCode: Int, permissions: Array<out String>, grantResults: IntArray) {
        super.onRequestPermissionsResult(requestCode, permissions, grantResults)
        if (requestCode == PERMISSIONS_REQUEST_READ_EXTERNAL_STORAGE) {
            if ((grantResults.isNotEmpty() && grantResults[0] == PackageManager.PERMISSION_GRANTED)) {
                Log.i(TAG, "READ_EXTERNAL_STORAGE permission granted by user.")
                findClientFolders()
            } else {
                Log.e(TAG, "READ_EXTERNAL_STORAGE permission denied by user.")
                updateStatus("Status: Permission to read files denied.")
            }
        }
    }

    private fun findClientFolders() {
        updateStatus("Status: Scanning for client folders...")
        val downloadsDir = Environment.getExternalStoragePublicDirectory(Environment.DIRECTORY_DOWNLOADS)
        val certsDir = File(downloadsDir, "certs")

        if (!certsDir.exists() || !certsDir.isDirectory) {
            updateStatus("ERROR: Directory 'Downloads/certs' not found!")
            Log.e(TAG, "The directory ${certsDir.absolutePath} does not exist.")
            return
        }

        Log.d(TAG, "Scanning directory: ${certsDir.absolutePath}")
        val foundFolders = certsDir.listFiles { file ->
            file.isDirectory &&
                    File(file, "client_cert.crt").exists() &&
                    File(file, "client_key.key").exists()
        }?.map { it.name } ?: emptyList()

        Log.i(TAG, "Scan complete. Found folders: $foundFolders")

        clientCertFolders.clear()
        clientCertFolders.addAll(foundFolders)
        spinnerAdapter.notifyDataSetChanged()

        if (clientCertFolders.isEmpty()) {
            updateStatus("Status: No valid client folders found in Downloads/certs.")
        } else {
            updateStatus("Status: Found ${clientCertFolders.size} folder(s). Please select one.")
        }
    }

    private fun startVpn(folderName: String) {
        updateStatus("Status: Reading files for '$folderName'...")

        val clientFolder = File(Environment.getExternalStoragePublicDirectory(Environment.DIRECTORY_DOWNLOADS), "certs/$folderName")

        val caCert: String
        val clientCert: String
        val clientKey: String
        try {
            val caCertFile = File(clientFolder.parentFile, "ca_cert.crt")
            Log.d(TAG, "Reading CA cert from: ${caCertFile.absolutePath}")
            caCert = caCertFile.readText()

            val clientCertFile = File(clientFolder, "client_cert.crt")
            Log.d(TAG, "Reading client cert from: ${clientCertFile.absolutePath}")
            clientCert = clientCertFile.readText()

            val clientKeyFile = File(clientFolder, "client_key.key")
            Log.d(TAG, "Reading client key from: ${clientKeyFile.absolutePath}")
            clientKey = clientKeyFile.readText()

            Log.i(TAG, "All certificate files read successfully.")
        } catch (e: FileNotFoundException) {
            updateStatus("ERROR: A required certificate file was not found.")
            Log.e(TAG, "FileNotFoundException while reading certs", e)
            Toast.makeText(this, "Error: ${e.message}", Toast.LENGTH_LONG).show()
            return
        } catch (e: Exception) {
            updateStatus("ERROR: Could not read certificate files.")
            Log.e(TAG, "Generic file reading error", e)
            return
        }

        updateStatus("Status: Creating VPN profile...")
        val profileName = "PQC Test - $folderName"
        val profile = VpnProfile(profileName)

        profile.mConnections[0].mServerName = "48.209.35.108"
        profile.mConnections[0].mServerPort = "1194"
        profile.mConnections[0].mUseUdp = true
        profile.mExpectTLSCert = true

        profile.mCaFilename = "[[INLINE]]" + caCert
        profile.mClientCertFilename = "[[INLINE]]" + clientCert
        profile.mClientKeyFilename = "[[INLINE]]" + clientKey

        Log.d(TAG, "Profile created. CA, Cert, and Key have been embedded.")
        Log.d(TAG, "Profile Details: ${profile.getConfigFile(this, false)}")

        val pm = ProfileManager.getInstance(this)
        pm.addProfile(profile)
        ProfileManager.saveProfile(this, profile)
        pm.saveProfileList(this)
        Log.i(TAG, "Profile '$profileName' saved.")

        updateStatus("Status: Starting VPN service...")
        val intent = profile.getStartServiceIntent(this, "PQC Test Manual Start", true)

        try {
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
                startForegroundService(intent)
            } else {
                startService(intent)
            }
            Log.i(TAG, "VPN Service started successfully.")
            updateStatus("Status: Connecting... Check notification & Logcat for details.")
        } catch (e: Exception) {
            Log.e(TAG, "Failed to start OpenVPNService!", e)
            updateStatus("ERROR: Failed to start VPN service. Check Logcat.")
        }
    }
}