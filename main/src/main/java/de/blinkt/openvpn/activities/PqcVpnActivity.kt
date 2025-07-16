package de.blinkt.openvpn.activities

import android.app.Activity
import android.content.*
import android.net.Uri
import android.net.VpnService
import android.os.Bundle
import android.os.IBinder
import android.os.Parcelable
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

    companion object { private const val TAG = "PQC_VPN_DEBUG_LOG" }

    private val serviceConnection = object : ServiceConnection {
        override fun onServiceConnected(name: ComponentName, service: IBinder) {}
        override fun onServiceDisconnected(name: ComponentName) {}
    }

    override fun onStart() {
        super.onStart()
        val intent = Intent(this, OpenVPNService::class.java).setAction(OpenVPNService.START_SERVICE)
        bindService(intent, serviceConnection, BIND_AUTO_CREATE)
        VpnStatus.addStateListener(this)
    }

    override fun onStop() {
        super.onStop()
        unbindService(serviceConnection)
        VpnStatus.removeStateListener(this)
    }

    private val openDirectoryLauncher = registerForActivityResult(ActivityResultContracts.StartActivityForResult()) { result ->
        if (result.resultCode == Activity.RESULT_OK) {
            result.data?.data?.also { uri ->
                contentResolver.takePersistableUriPermission(uri, Intent.FLAG_GRANT_READ_URI_PERMISSION)
                certsFolderUri = uri
                findClientFolders()
            }
        }
    }

    private fun findClientFolders() {
        val parentUri = certsFolderUri ?: return
        lifecycleScope.launch(Dispatchers.IO) {
            val parent = DocumentFile.fromTreeUri(this@PqcVpnActivity, parentUri) ?: return@launch
            val found = parent.listFiles().filter {
                it.isDirectory &&
                        it.findFile("android_client.config")?.exists() == true &&
                        it.findFile("client_cert.crt")?.exists() == true &&
                        it.findFile("client_key.key")?.exists() == true
            }.mapNotNull { it.name }
            withContext(Dispatchers.Main) {
                clientCertFolders.clear(); clientCertFolders.addAll(found)
                spinnerAdapter.notifyDataSetChanged()
                updateStatus("Found ${found.size} folder(s). Ready to connect.")
            }
        }
    }

    private val vpnPermissionLauncher = registerForActivityResult(ActivityResultContracts.StartActivityForResult()) { res ->
        if (res.resultCode == Activity.RESULT_OK) { actuallyStartVpn() }
        else { updateStatus("VPN permission was denied.") }
    }

    private fun requestVpnPermission() {
        VpnService.prepare(this)?.let { vpnPermissionLauncher.launch(it) } ?: actuallyStartVpn()
    }

    private fun readTextFromFileInDir(baseDirUri: Uri, subDirName: String, targetFileName: String): String? {
        val subDir = DocumentFile.fromTreeUri(this, baseDirUri)?.findFile(subDirName)
        try {
            subDir?.findFile(targetFileName)?.uri?.let {
                contentResolver.openInputStream(it)?.use { stream ->
                    return BufferedReader(InputStreamReader(stream)).readText()
                }
            }
        } catch (e: IOException) { Log.e(TAG, "Read error", e) }
        return null
    }

    private fun actuallyStartVpn() {
        val folderName = binding.spinnerPqcKem.selectedItem as? String ?: return
        val baseUri = certsFolderUri ?: return
        lifecycleScope.launch {
            VpnConfigManager.copyAndGetConfigFile(this@PqcVpnActivity) ?: run {
                updateStatus("FATAL: Could not create OpenSSL config file.")
                return@launch
            }
            val profile = withContext(Dispatchers.IO) {
                val customConfig = readTextFromFileInDir(baseUri, folderName, "android_client.config")
                val caCert = readTextFromFileInDir(baseUri, folderName, "ca_cert.crt")
                val clientCert = readTextFromFileInDir(baseUri, folderName, "client_cert.crt")
                val clientKey = readTextFromFileInDir(baseUri, folderName, "client_key.key")
                if (customConfig == null || caCert == null || clientCert == null || clientKey == null) return@withContext null
                VpnProfile("PQC-$folderName").apply {
                    mUseCustomConfig = true; mCustomConfigOptions = customConfig
                    mCaFilename = VpnProfile.INLINE_TAG + caCert
                    mClientCertFilename = VpnProfile.INLINE_TAG + clientCert
                    mClientKeyFilename = VpnProfile.INLINE_TAG + clientKey
                    mPqcKEMs = "p256_mlkem512"
                }
            } ?: run { updateStatus("ERROR: Missing required files!"); return@launch }
            val pm = ProfileManager.getInstance(this@PqcVpnActivity)
            pm.addProfile(profile); pm.saveProfileList(this@PqcVpnActivity)
            val startVpnIntent = Intent(this@PqcVpnActivity, OpenVPNService::class.java).apply {
                action = OpenVPNService.START_SERVICE
                putExtra(OpenVPNService.EXTRA_VPN_PROFILE_OBJECT, profile as Parcelable)
            }
            ContextCompat.startForegroundService(this@PqcVpnActivity, startVpnIntent)
            updateStatus("Starting service...")
        }
    }

    override fun setConnectedVPN(uuid: String?) {}
    override fun updateState(state: String, log: String, resId: Int, level: ConnectionStatus, intent: Intent?) {
        updateStatus("${level.name}\n${VpnStatus.getLastCleanLogMessage(this)}")
    }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = ActivityPqcVpnBinding.inflate(layoutInflater)
        setContentView(binding.root)
        spinnerAdapter = ArrayAdapter(this, android.R.layout.simple_spinner_item, clientCertFolders)
        spinnerAdapter.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item)
        binding.spinnerPqcKem.adapter = spinnerAdapter
        binding.buttonSelectFolder.setOnClickListener { openDirectoryLauncher.launch(Intent(Intent.ACTION_OPEN_DOCUMENT_TREE)) }
        binding.buttonConnect.setOnClickListener { if (binding.spinnerPqcKem.selectedItem == null) Toast.makeText(this, "Select folder", Toast.LENGTH_SHORT).show() else requestVpnPermission() }
        binding.buttonDisconnect.setOnClickListener { ProfileManager.setConntectedVpnProfileDisconnected(this) }
        updateStatus("Ready.")
    }

    private fun updateStatus(msg: String) { binding.textStatus.text = msg }
}