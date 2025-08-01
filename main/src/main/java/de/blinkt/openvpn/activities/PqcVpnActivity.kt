package de.blinkt.openvpn.activities

import android.app.Activity
import android.content.ComponentName
import android.content.Intent
import android.content.ServiceConnection
import android.net.VpnService
import android.os.Bundle
import android.os.IBinder
import android.os.Parcelable
import android.widget.Toast
import androidx.activity.result.contract.ActivityResultContracts
import androidx.appcompat.app.AppCompatActivity
import androidx.core.content.ContextCompat
import de.blinkt.openvpn.core.ConnectionStatus
import de.blinkt.openvpn.core.OpenVPNService
import de.blinkt.openvpn.core.OvpnProfileParser
import de.blinkt.openvpn.core.ProfileManager
import de.blinkt.openvpn.core.VpnProfile
import de.blinkt.openvpn.core.VpnStatus
import de.blinkt.openvpn.databinding.ActivityPqcVpnBinding
import de.blinkt.openvpn.core.*

class PqcVpnActivity : AppCompatActivity(), VpnStatus.StateListener {

    private lateinit var binding: ActivityPqcVpnBinding
    private var currentProfile: VpnProfile? = null

    private val serviceConnection = object : ServiceConnection {
        override fun onServiceConnected(name: ComponentName, service: IBinder) {}
        override fun onServiceDisconnected(name: ComponentName) {}
    }

    private val openFileLauncher = registerForActivityResult(ActivityResultContracts.StartActivityForResult()) { result ->
        PqcVpnLog.i("ActivityResult: Received result from file picker.")
        if (result.resultCode == Activity.RESULT_OK) {
            result.data?.data?.also { uri ->
                PqcVpnLog.i("File URI selected: $uri")
                val profile = OvpnProfileParser.parse(this, uri)
                if (profile == null) {
                    PqcVpnLog.e("Profile parsing FAILED.")
                    Toast.makeText(this, "Failed to parse profile.", Toast.LENGTH_LONG).show()
                    updateStatus("Error: Could not parse .ovpn file.")
                } else {
                    currentProfile = profile
                    PqcVpnLog.i("Profile parsing SUCCESS. Profile name: '${profile.name}'")
                    updateStatus("Imported '${profile.name}'.\nReady to connect.")
                    binding.buttonConnect.isEnabled = true
                }
            }
        } else {
            PqcVpnLog.w("ActivityResult: No file selected or operation cancelled.")
            Toast.makeText(this, "No file selected.", Toast.LENGTH_SHORT).show()
            updateStatus("No file selected.")
        }
    }

    private val vpnPermissionLauncher = registerForActivityResult(ActivityResultContracts.StartActivityForResult()) { res ->
        PqcVpnLog.i("ActivityResult: Received result from VPN permission dialog.")
        if (res.resultCode == Activity.RESULT_OK) {
            PqcVpnLog.i("VPN permission GRANTED.")
            startVpn()
        } else {
            PqcVpnLog.e("VPN permission DENIED.")
            updateStatus("VPN permission was denied.")
        }
    }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = ActivityPqcVpnBinding.inflate(layoutInflater)
        setContentView(binding.root)
        PqcVpnLog.i("PqcVpnActivity: onCreate")

        binding.buttonImportProfile.setOnClickListener {
            PqcVpnLog.i("User Action: Tapped 'Import Profile' button.")
            val intent = Intent(Intent.ACTION_OPEN_DOCUMENT).apply {
                addCategory(Intent.CATEGORY_OPENABLE)
                type = "*/*" // Allow selection of any file type
            }
            openFileLauncher.launch(intent)
        }

        binding.buttonConnect.setOnClickListener {
            PqcVpnLog.i("User Action: Tapped 'Connect' button.")
            if (currentProfile != null) {
                requestVpnPermission()
            } else {
                PqcVpnLog.w("Connect tapped but no profile is loaded.")
                Toast.makeText(this, "Please import a profile first.", Toast.LENGTH_SHORT).show()
            }
        }

        binding.buttonDisconnect.setOnClickListener {
            // --- BEGIN DEFINITIVE FIX ---
            // Create an explicit Intent to command the service to stop.
            val disconnectVpnIntent = Intent(this, OpenVPNService::class.java).apply {
                action = OpenVPNService.DISCONNECT_VPN
            }
            // Send the command to the service.
            startService(disconnectVpnIntent)
            PqcVpnLog.i("User Action: Tapped 'Disconnect' button. Sent DISCONNECT_VPN intent to service.")
            // --- END DEFINITIVE FIX ---
        }
    }

    private fun requestVpnPermission() {
        PqcVpnLog.d("Requesting VPN permission...")
        val vpnIntent = VpnService.prepare(this)
        if (vpnIntent != null) {
            // --- DEFINITIVE FIX ---
            // The system needs to ask the user for permission. Launch the dialog.
            // The result will be handled by the vpnPermissionLauncher callback.
            PqcVpnLog.i("VpnService not prepared. Launching system permission dialog.")
            vpnPermissionLauncher.launch(vpnIntent)
        } else {
            // Permission has already been granted. We can start the VPN immediately.
            PqcVpnLog.i("VpnService is already prepared. Starting VPN now.")
            startVpn()
        }
    }

    private fun startVpn() {
        val profile = currentProfile ?: run {
            PqcVpnLog.e("startVpn() called, but currentProfile is null!")
            return
        }
        PqcVpnLog.i("Executing startVpn() for profile: '${profile.name}'")

        val pm = ProfileManager.getInstance(this)
        pm.addProfile(profile)
        pm.saveProfileList(this)

        val startVpnIntent = Intent(this, OpenVPNService::class.java).apply {
            action = OpenVPNService.START_SERVICE
            putExtra(OpenVPNService.EXTRA_VPN_PROFILE_OBJECT, profile as Parcelable)
        }
        ContextCompat.startForegroundService(this, startVpnIntent)
        updateStatus("Starting VPN service...")
        PqcVpnLog.d("Creating service intent: $startVpnIntent")
        PqcVpnLog.i("startForegroundService() called.")
        updateStatus("Starting VPN service...")
    }

    override fun onStart() {
        super.onStart()
        VpnStatus.addStateListener(this)
        bindService(Intent(this, OpenVPNService::class.java), serviceConnection, BIND_AUTO_CREATE)
    }

    override fun onStop() {
        super.onStop()
        VpnStatus.removeStateListener(this)
        unbindService(serviceConnection)
    }

    override fun updateState(state: String, log: String, resId: Int, level: ConnectionStatus, intent: Intent?) {
        runOnUiThread {
            updateStatus("Status: ${level.name}\n\n${VpnStatus.getLastCleanLogMessage(this)}")
        }
    }

    override fun setConnectedVPN(uuid: String?) {}

    private fun updateStatus(msg: String) {
        binding.textStatus.text = msg
    }
}