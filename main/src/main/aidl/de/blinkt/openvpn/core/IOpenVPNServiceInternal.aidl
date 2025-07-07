

/*
 * Copyright (c) 2012-2016 Arne Schwabe
 * Distributed under the GNU GPL v2 with additional terms. For full terms see the file doc/LICENSE.txt
 */



package de.blinkt.openvpn.core;

interface IOpenVPNServiceInternal {
    boolean protect(int fd);
    void userPause(boolean b);
    boolean stopVPN(boolean replaceConnection);
    void addAllowedExternalApp(String packagename);
    boolean isAllowedExternalApp(String packagename);
    void challengeResponse(String response); // Fixed spelling
}