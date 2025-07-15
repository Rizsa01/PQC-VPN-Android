/*
 * Copyright (c) 2012-2016 Arne Schwabe
 * Distributed under the GNU GPL v2 with additional terms. For full terms see the file doc/LICENSE.txt
 */

package de.blinkt.openvpn.core;

public interface OpenVPNManagement {

    // This interface defines a callback for checking pause state.
    interface PausedStateCallback {
        boolean shouldBeRunning();
    }

    // Enum for defining the reason for a pause.
    enum pauseReason {
        noNetwork,
        userPause,
        screenOff,
    }

    // Enum for signature padding types (used in other parts of the app).
    enum SignaturePadding {
        RSA_PKCS1_PSS_PADDING,
        RSA_PKCS1_PADDING,
        NO_PADDING
    }

    // --- Methods already in your interface ---
    void reconnect();
    void pause(pauseReason reason);
    void resume();
    boolean stopVPN(boolean replaceConnection);
    void networkChange(boolean sameNetwork);
    void setPauseCallback(PausedStateCallback callback);
    void sendCRResponse(String response);

    //==================================================================
    // ### THE DEFINITIVE FIX: ADD THE MISSING METHOD DEFINITION ###
    // This makes the method available on the interface, so other classes can call it.
    void signalusr1();
    //==================================================================
}