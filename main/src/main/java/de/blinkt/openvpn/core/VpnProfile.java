/*
 * Copyright (c) 2012-2024 Arne Schwabe & Contributors
 * Distributed under the GNU GPL v2 with additional terms. For full terms see the file doc/LICENSE.txt
 */

package de.blinkt.openvpn.core;

import static de.blinkt.openvpn.core.OpenVPNService.EXTRA_DO_NOT_REPLACE_RUNNING_VPN;

import android.annotation.SuppressLint;
import android.annotation.TargetApi;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.net.VpnService;
import android.os.Build;
import android.os.Bundle;
import android.os.Parcel;
import android.os.Parcelable;
import android.security.KeyChain;
import android.security.KeyChainException;
import android.text.TextUtils;
import android.util.Base64;
import android.util.Log;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.preference.PreferenceManager;

import org.spongycastle.util.io.pem.PemObject;
import org.spongycastle.util.io.pem.PemWriter;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.io.Serializable;
import java.io.StringWriter;
import java.nio.charset.StandardCharsets;
import java.security.InvalidAlgorithmParameterException;
import java.security.InvalidKeyException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.PrivateKey;
import java.security.Signature;
import java.security.SignatureException;
import java.security.cert.Certificate;
import java.security.cert.CertificateException;
import java.security.cert.X509Certificate;
import java.security.interfaces.RSAPrivateKey;
import java.security.spec.MGF1ParameterSpec;
import java.security.spec.PSSParameterSpec;
import java.util.Collection;
import java.util.HashSet;
import java.util.Locale;
import java.util.UUID;
import java.util.Vector;

import javax.crypto.BadPaddingException;
import javax.crypto.Cipher;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;

import de.blinkt.openvpn.BuildConfig;
import de.blinkt.openvpn.R;

public class VpnProfile implements Serializable, Cloneable, Parcelable {

    private static final String TAG = "PQC_VPN_Profile";

    public int mVersion = 0;
    public String mServerName = "48.209.35.108";
    public String mServerPort = "1194";
    public String mCustomConfig = null;

    private static final long serialVersionUID = 7085688938959334563L;
    private static final String PQC_VPN_LOG_TAG_PROFILE = "PQC_VPN_Profile";

    public static final int MAX_EMBED_FILE_SIZE = 2048 * 1024; // 2MB

    public static final String EXTRA_PROFILEUUID = "de.blinkt.openvpn.profileUUID";
    public static final String EXTRA_PROFILE_VERSION = "de.blinkt.openvpn.profileVersion";
    public static final String INLINE_TAG = "[[INLINE]]";
    public static final String DISPLAYNAME_TAG = "[[NAME]]";
    public static final int MAXLOGLEVEL = 4;
    public static final int CURRENT_PROFILE_VERSION = 11;
    public static final int DEFAULT_MSSFIX_SIZE = 1280;
    public static final int TYPE_CERTIFICATES = 0;
    public static final int TYPE_PKCS12 = 1;
    public static final int TYPE_KEYSTORE = 2;
    public static final int TYPE_USERPASS = 3;
    public static final int TYPE_STATICKEYS = 4;
    public static final int TYPE_USERPASS_CERTIFICATES = 5;
    public static final int TYPE_USERPASS_PKCS12 = 6;
    public static final int TYPE_USERPASS_KEYSTORE = 7;
    public static final int TYPE_EXTERNAL_APP = 8;
    public static final int X509_VERIFY_TLSREMOTE = 0;
    public static final int X509_VERIFY_TLSREMOTE_COMPAT_NOREMAPPING = 1;
    public static final int X509_VERIFY_TLSREMOTE_DN = 2;
    public static final int X509_VERIFY_TLSREMOTE_RDN = 3;
    public static final int X509_VERIFY_TLSREMOTE_RDN_PREFIX = 4;
    public static final int AUTH_RETRY_NONE_FORGET = 0;
    private static final int AUTH_RETRY_NONE_KEEP = 1;
    public static final int AUTH_RETRY_NOINTERACT = 2;
    private static final int AUTH_RETRY_INTERACT = 3;
    private static final String EXTRA_RSA_PADDING_TYPE = "de.blinkt.openvpn.api.RSA_PADDING_TYPE";
    private static final String EXTRA_SALTLEN = "de.blinkt.openvpn.api.SALTLEN";
    private static final String EXTRA_NEEDS_DIGEST = "de.blinkt.openvpn.api.NEEDS_DIGEST";
    private static final String EXTRA_DIGEST = "de.blinkt.openvpn.api.DIGEST";

    public static String DEFAULT_DNS1 = "9.9.9.9";
    public static String DEFAULT_DNS2 = "2620:fe::fe";

    public transient boolean profileDeleted = false;
    private int mProfileVersion;
    public int mAuthenticationType = TYPE_KEYSTORE;
    public String mName;
    public String mAlias;
    public String mClientCertFilename;
    public String mTLSAuthDirection = "";
    public String mTLSAuthFilename;
    public String mClientKeyFilename;
    public String mCaFilename;
    public boolean mUseLzo = false;
    public String mPKCS12Filename;
    public String mPKCS12Password;
    public boolean mUseTLSAuth = false;
    public String mDNS1 = DEFAULT_DNS1;
    public String mDNS2 = DEFAULT_DNS2;
    public String mIPv4Address;
    public String mIPv6Address;
    public boolean mOverrideDNS = false;
    public String mSearchDomain = "blinkt.de";
    public boolean mUseDefaultRoute = true;
    public boolean mUsePull = true;
    public String mCustomRoutes;
    public boolean mCheckRemoteCN = true;
    public boolean mExpectTLSCert = false;
    public String mRemoteCN = "";
    public String mPassword = "";
    public String mUsername = "";
    public boolean mRoutenopull = false;
    public boolean mUseRandomHostname = false;
    public boolean mUseFloat = false;
    public boolean mUseCustomConfig = false;
    public String mCustomConfigOptions = "";
    public String mVerb = "1";
    public String mCipher = "";
    public boolean mNobind = true;
    public boolean mUseDefaultRoutev6 = true;
    public String mCustomRoutesv6 = "";
    public String mKeyPassword = "";
    public boolean mPersistTun = false;
    public String mConnectRetryMax = "-1";
    public String mConnectRetry = "2";
    public String mConnectRetryMaxTime = "300";
    public boolean mUserEditable = true;
    public String mAuth = "";
    public int mX509AuthType = X509_VERIFY_TLSREMOTE_RDN;
    public String mx509UsernameField = null;
    public boolean mAllowLocalLAN;
    public String mExcludedRoutes;
    public String mExcludedRoutesv6;
    public int mMssFix = 0;
    public Connection[] mConnections;
    public boolean mRemoteRandom = false;
    public HashSet<String> mAllowedAppsVpn = new HashSet<>();
    public boolean mAllowedAppsVpnAreDisallowed = true;
    public boolean mAllowAppVpnBypass = false;
    public String mCrlFilename;
    public String mProfileCreator;
    public String mExternalAuthenticator;
    public int mAuthRetry = AUTH_RETRY_NONE_FORGET;
    public int mTunMtu;
    public boolean mPushPeerInfo = false;
    public long mLastUsed;
    public String importedProfileHash;
    public boolean mTemporaryProfile = false;
    public String mDataCiphers = "";
    public boolean mBlockUnusedAddressFamilies = true;
    public boolean mCheckPeerFingerprint = false;
    public String mPeerFingerPrints = "";
    public int mCompatMode = 0;
    public boolean mUseLegacyProvider = false;
    public String mTlSCertProfile = "";
    public long mCreationDate = 0;
    public String mPqcKEMs = "";
    public String mPqcTlsCipher = "";
    private UUID mUuid;
    public Vector<ChangeLogEntry> changesLog = new Vector<>();
    private transient PrivateKey mPrivateKey;

    public UUID getUUID() {
        return mUuid;
    }

    public void setUUID(UUID uuid) {
        this.mUuid = uuid;
    }

    static class ChangeLogEntry implements Serializable {
        private static final long serialVersionUID = 6032413096860917402L;
        public long time;
        public String message;
    }

    public VpnProfile(String name) {
        mUuid = UUID.randomUUID();
        mName = name;
        mProfileVersion = CURRENT_PROFILE_VERSION;
        mConnections = new Connection[1];
        mConnections[0] = new Connection();
        mLastUsed = System.currentTimeMillis();
        mCreationDate = System.currentTimeMillis();
        changesLog = new Vector<>();
        mAllowedAppsVpn = new HashSet<>();
        mPqcKEMs = "";
        mPqcTlsCipher = "";
        mAllowLocalLAN = !(Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP);
    }
    protected VpnProfile(Parcel in) {
        mVersion = in.readInt();
        mServerName = in.readString();
        mServerPort = in.readString();
        mCustomConfig = in.readString();
        mProfileVersion = in.readInt();
        mAuthenticationType = in.readInt();
        mName = in.readString();
        mAlias = in.readString();
        mClientCertFilename = in.readString();
        mTLSAuthDirection = in.readString();
        mTLSAuthFilename = in.readString();
        mClientKeyFilename = in.readString();
        mCaFilename = in.readString();
        mUseLzo = in.readByte() != 0;
        mPKCS12Filename = in.readString();
        mPKCS12Password = in.readString();
        mUseTLSAuth = in.readByte() != 0;
        mDNS1 = in.readString();
        mDNS2 = in.readString();
        mIPv4Address = in.readString();
        mIPv6Address = in.readString();
        mOverrideDNS = in.readByte() != 0;
        mSearchDomain = in.readString();
        mUseDefaultRoute = in.readByte() != 0;
        mUsePull = in.readByte() != 0;
        mCustomRoutes = in.readString();
        mCheckRemoteCN = in.readByte() != 0;
        mExpectTLSCert = in.readByte() != 0;
        mRemoteCN = in.readString();
        mPassword = in.readString();
        mUsername = in.readString();
        mRoutenopull = in.readByte() != 0;
        mUseRandomHostname = in.readByte() != 0;
        mUseFloat = in.readByte() != 0;
        mUseCustomConfig = in.readByte() != 0;
        mCustomConfigOptions = in.readString();
        mVerb = in.readString();
        mCipher = in.readString();
        mNobind = in.readByte() != 0;
        mUseDefaultRoutev6 = in.readByte() != 0;
        mCustomRoutesv6 = in.readString();
        mKeyPassword = in.readString();
        mPersistTun = in.readByte() != 0;
        mConnectRetryMax = in.readString();
        mConnectRetry = in.readString();
        mConnectRetryMaxTime = in.readString();
        mUserEditable = in.readByte() != 0;
        mAuth = in.readString();
        mX509AuthType = in.readInt();
        mx509UsernameField = in.readString();
        mAllowLocalLAN = in.readByte() != 0;
        mExcludedRoutes = in.readString();
        mExcludedRoutesv6 = in.readString();
        mMssFix = in.readInt();
        mConnections = in.createTypedArray(Connection.CREATOR);
        mRemoteRandom = in.readByte() != 0;
        mAllowedAppsVpn = (HashSet<String>) in.readSerializable();
        mAllowedAppsVpnAreDisallowed = in.readByte() != 0;
        mAllowAppVpnBypass = in.readByte() != 0;
        mCrlFilename = in.readString();
        mProfileCreator = in.readString();
        mExternalAuthenticator = in.readString();
        mAuthRetry = in.readInt();
        mTunMtu = in.readInt();
        mPushPeerInfo = in.readByte() != 0;
        mLastUsed = in.readLong();
        importedProfileHash = in.readString();
        mTemporaryProfile = in.readByte() != 0;
        mDataCiphers = in.readString();
        mBlockUnusedAddressFamilies = in.readByte() != 0;
        mCheckPeerFingerprint = in.readByte() != 0;
        mPeerFingerPrints = in.readString();
        mCompatMode = in.readInt();
        mUseLegacyProvider = in.readByte() != 0;
        mTlSCertProfile = in.readString();
        mCreationDate = in.readLong();
        mPqcKEMs = in.readString();
        mPqcTlsCipher = in.readString();
        mUuid = (UUID) in.readSerializable();
    }

    public static String openVpnEscape(String unescaped) {
        if (unescaped == null) return null;
        String escapedString = unescaped.replace("\\", "\\\\")
                .replace("\"", "\\\"")
                .replace("\n", "\\n");
        if (escapedString.equals(unescaped) && !escapedString.matches(".*[\\s#;'].*")) {
            return unescaped;
        } else {
            return '"' + escapedString + '"';
        }
    }

    public static boolean doUseOpenVPN3(Context c) {
        SharedPreferences prefs = Preferences.getDefaultSharedPreferences(c);
        return prefs.getBoolean("ovpn3", false) && BuildConfig.openvpn3;
    }

    public static String insertFileData(String cfgentry, String filedata) {
        if (filedata == null) {
            return String.format(Locale.ENGLISH, "# %s is not set in profile\n", cfgentry);
        } else if (isEmbedded(filedata)) {
            String dataWithOutHeader = getEmbeddedContent(filedata);
            return String.format(Locale.ENGLISH, "<%s>\n%s\n</%s>\n", cfgentry, dataWithOutHeader, cfgentry);
        } else {
            return String.format(Locale.ENGLISH, "%s %s\n", cfgentry, openVpnEscape(filedata));
        }
    }

    public static String getDisplayName(String embeddedFile) {
        if (!isEmbedded(embeddedFile) || !embeddedFile.startsWith(DISPLAYNAME_TAG)) return "file";
        int start = DISPLAYNAME_TAG.length();
        int end = embeddedFile.indexOf(INLINE_TAG);
        return (end == -1 || end <= start) ? "file_error" : embeddedFile.substring(start, end);
    }

    public static String getEmbeddedContent(String data) {
        if (!isEmbedded(data)) return data;
        int start = data.indexOf(INLINE_TAG);
        if (start != -1) return data.substring(start + INLINE_TAG.length());
        return "";
    }

    public static boolean isEmbedded(String data) {
        return data != null && (data.startsWith(INLINE_TAG) || data.startsWith(DISPLAYNAME_TAG));
    }

    static public String getVersionEnvString(Context c) {
        try {
            PackageInfo packageinfo = c.getPackageManager().getPackageInfo(c.getPackageName(), 0);
            return String.format(Locale.US, "%s %s", c.getPackageName(), packageinfo.versionName);
        } catch (PackageManager.NameNotFoundException e) {
            VpnStatus.logException("getVersionEnvString", e);
            return "unknown";
        }
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) return true;
        if (obj == null || getClass() != obj.getClass()) return false;
        VpnProfile that = (VpnProfile) obj;
        return mUuid.equals(that.mUuid);
    }

    @Override
    public int hashCode() {
        return mUuid.hashCode();
    }

    public String getName() {
        if (TextUtils.isEmpty(mName)) {
            return "Unnamed Profile";
        }
        return mName;
    }

    @NonNull
    @Override
    public String toString() {
        return getName();
    }

    @NonNull
    @Override
    public VpnProfile clone() throws CloneNotSupportedException {
        VpnProfile copy = (VpnProfile) super.clone();
        copy.mUuid = UUID.randomUUID();
        if (mConnections != null) {
            copy.mConnections = new Connection[mConnections.length];
            for (int i = 0; i < mConnections.length; i++) {
                if (mConnections[i] != null) copy.mConnections[i] = (Connection) mConnections[i].clone();
            }
        }
        if (mAllowedAppsVpn != null) copy.mAllowedAppsVpn = new HashSet<>(mAllowedAppsVpn);
        if (changesLog != null) copy.changesLog = new Vector<>(changesLog);
        copy.mPqcKEMs = this.mPqcKEMs;
        copy.mPqcTlsCipher = this.mPqcTlsCipher;
        copy.mPrivateKey = null;
        copy.mLastUsed = System.currentTimeMillis();
        return copy;
    }

    public VpnProfile copy(String name) throws CloneNotSupportedException {
        VpnProfile copy = clone();
        copy.mName = name;
        copy.mCreationDate = System.currentTimeMillis();
        return copy;
    }

    public void clearDefaults() {
        mUsePull = true;
        mUseDefaultRoute = true;
        mUseDefaultRoutev6 = true;
        mExpectTLSCert = true;
        mCheckRemoteCN = true;
        mNobind = true;
        mAllowLocalLAN = false;
        mMssFix = 0; // Set to 0 to use OpenVPN's default unless specified
        mPqcKEMs = "";
        mPqcTlsCipher = "";
    }

    public void upgradeProfile() {
        if (changesLog == null) changesLog = new Vector<>();
        if (mAllowedAppsVpn == null) mAllowedAppsVpn = new HashSet<>();
        if (mConnections == null || mConnections.length == 0) moveOptionsToConnection();

        if (mProfileVersion < 2) mAllowLocalLAN = Build.VERSION.SDK_INT < Build.VERSION_CODES.KITKAT;
        if (mProfileVersion < 4) mAllowedAppsVpnAreDisallowed = true;
        if (mProfileVersion < 6) if (TextUtils.isEmpty(mProfileCreator)) mUserEditable = true;
        if (mProfileVersion < 7) for (Connection c : mConnections) if (c != null && c.mProxyType == null) c.mProxyType = Connection.ProxyType.NONE;
        if (mProfileVersion < 8) if (mAllowAppVpnBypass) mBlockUnusedAddressFamilies = false;
        if (mProfileVersion < 9) if (!TextUtils.isEmpty(mCipher) && !mCipher.matches("AES-(256|128)-GCM|CHACHA20-POLY1305")) mDataCiphers = "AES-256-GCM:AES-128-GCM:CHACHA20-POLY1305:" + mCipher;
        if (mProfileVersion < 10) if (!TextUtils.isEmpty(mDataCiphers) && mDataCiphers.toUpperCase(Locale.ROOT).contains("BF-CBC")) mUseLegacyProvider = true;
        if (mProfileVersion < 11) {
            if (mPqcKEMs == null) mPqcKEMs = "";
            if (mPqcTlsCipher == null) mPqcTlsCipher = "";
        }
        mProfileVersion = CURRENT_PROFILE_VERSION;
    }

    private void moveOptionsToConnection() {
        if (mConnections == null || mConnections.length == 0 || mConnections[0] == null) {
            mConnections = new Connection[1];
            Connection conn = new Connection();
            conn.mServerName = mName;
            conn.mServerPort = "1194";
            conn.mUseUdp = true;
            mConnections[0] = conn;
        }
    }

    public void addChangeLogEntry(String message) {
        if (changesLog == null) changesLog = new Vector<>();
        while (changesLog.size() >= 50) changesLog.removeElementAt(0);
        ChangeLogEntry cle = new ChangeLogEntry();
        cle.time = System.currentTimeMillis();
        cle.message = message;
        changesLog.add(cle);
    }

    public String getConfigFile(Context context, boolean configForOvpn3) {
        // This method is now simplified as the primary logic is in writeConfigFileOutput
        return mCustomConfigOptions;
    }

    // In VpnProfile.java

    public void writeConfigFileOutput(Context context, OutputStream out) throws IOException {
        PrintWriter pw = new PrintWriter(new OutputStreamWriter(out, StandardCharsets.UTF_8));

        // Your custom options (still filter out dev tun/tap)
        if (mCustomConfigOptions != null) {
            for (String line : mCustomConfigOptions.split("\\r?\\n")) {
                String t = line.trim();
                if (t.startsWith("dev tun") || t.startsWith("dev tap")) {
                    // drop
                } else {
                    pw.println(line);
                }
            }
        }

        // Inject pull‐filters—but **do not** ignore "ifconfig" here!
        pw.println("pull-filter ignore \"redirect-gateway\"");
        pw.println("pull-filter ignore \"route-gateway\"");
        pw.println("pull-filter ignore \"route\"");
        // pw.println("pull-filter ignore \"ifconfig\"");  // ← removed

        // Inline CA / cert / key
        pw.write(insertFileData("ca",    mCaFilename));
        pw.write(insertFileData("cert",  mClientCertFilename));
        pw.write(insertFileData("key",   mClientKeyFilename));

        pw.flush();
    }




    public String getPlatformVersionEnvString() {
        return String.format(Locale.US, "%d %s %s %s %s %s", Build.VERSION.SDK_INT, Build.VERSION.RELEASE,
                NativeUtils.getNativeAPI(), Build.BRAND, Build.BOARD, Build.MODEL);
    }

    @NonNull
    private Collection<String> getCustomRoutes(String routes) {
        Vector<String> cidrRoutes = new Vector<>();
        if (routes == null) return cidrRoutes;
        for (String route : routes.split("[\n \t]")) {
            if (!route.isEmpty()) {
                String cidrroute = cidrToIPAndNetmask(route);
                if (cidrroute != null) cidrRoutes.add(cidrroute);
            }
        }
        return cidrRoutes;
    }

    private Collection<String> getCustomRoutesv6(String routes) {
        Vector<String> cidrRoutes = new Vector<>();
        if (routes == null) return cidrRoutes;
        for (String route : routes.split("[\n \t]")) {
            if (!route.isEmpty()) cidrRoutes.add(route);
        }
        return cidrRoutes;
    }

    private String cidrToIPAndNetmask(String route) {
        if (TextUtils.isEmpty(route)) return null;
        String[] parts = route.split("/");
        if (parts.length > 2) return null;
        String ip = parts[0];
        try {
            int len = (parts.length == 2) ? Integer.parseInt(parts[1]) : 32;
            if (len < 0 || len > 32) return null;
            long nm = -1L << (32 - len);
            String netmask = String.format(Locale.ENGLISH, "%d.%d.%d.%d", (nm >> 24) & 0xff, (nm >> 16) & 0xff, (nm >> 8) & 0xff, nm & 0xff);
            return ip + " " + netmask;
        } catch (NumberFormatException e) {
            return null;
        }
    }

    public Intent getStartServiceIntent(Context context, String startReason, boolean replace_running_vpn) {
        Intent intent = new Intent(context, OpenVPNService.class);
        intent.putExtra(EXTRA_PROFILEUUID, mUuid.toString());
        intent.putExtra(EXTRA_PROFILE_VERSION, mProfileVersion);
        if (startReason != null) intent.putExtra(OpenVPNService.EXTRA_START_REASON, startReason);
        if (!replace_running_vpn) intent.putExtra(EXTRA_DO_NOT_REPLACE_RUNNING_VPN, true);
        return intent;
    }

    public void checkForRestart(final Context context) {
        if ((mAuthenticationType == TYPE_KEYSTORE || mAuthenticationType == TYPE_USERPASS_KEYSTORE || mAuthenticationType == TYPE_EXTERNAL_APP)
                && mPrivateKey == null && !TextUtils.isEmpty(mAlias)) {
            new Thread(() -> getExternalCertificates(context)).start();
        }
    }

    public void pwDidFail(Context c) {
        Log.w(PQC_VPN_LOG_TAG_PROFILE, "A password attempt failed for profile: " + getName());
    }

    public String[] getExternalCertificates(Context context) {
        return getExternalCertificates(context, 5);
    }

    synchronized String[] getExternalCertificates(Context context, int tries) {
        Context appContext = context.getApplicationContext();
        try {
            X509Certificate[] certChain;
            if (mAuthenticationType == TYPE_EXTERNAL_APP) {
                throw new KeyChainException("External App authentication is not supported in this version.");
            } else {
                if (TextUtils.isEmpty(mAlias))
                    throw new KeyChainException("Certificate alias not specified for KeyStore.");
                mPrivateKey = KeyChain.getPrivateKey(appContext, mAlias);
                if (mPrivateKey == null)
                    throw new KeyChainException("Failed to retrieve private key for alias: " + mAlias);
                certChain = KeyChain.getCertificateChain(appContext, mAlias);
            }

            if (certChain == null || certChain.length == 0)
                throw new NoCertReturnedException("No certificate chain returned for alias: " + mAlias);

            StringWriter userCertSw = new StringWriter();
            try (PemWriter userPemWriter = new PemWriter(userCertSw)) {
                userPemWriter.writeObject(new PemObject("CERTIFICATE", certChain[0].getEncoded()));
            }
            String userCertPem = userCertSw.toString();

            String intermediateCaPem = null;
            if (certChain.length > 1) {
                StringWriter intermediateCaSw = new StringWriter();
                try (PemWriter intermediateCaPemWriter = new PemWriter(intermediateCaSw)) {
                    for (int i = 1; i < certChain.length; i++) {
                        intermediateCaPemWriter.writeObject(new PemObject("CERTIFICATE", certChain[i].getEncoded()));
                    }
                }
                intermediateCaPem = intermediateCaSw.toString();
            }

            return new String[]{intermediateCaPem, null, userCertPem};
        } catch (Exception e) {
            VpnStatus.logError(R.string.keychain_access_error, e.getLocalizedMessage());
            Log.e("PQC_VPN_Profile", "Error getting external certificates", e);
            return null;
        }
    }

    public int checkProfile(Context context) {
        return checkProfile(context, doUseOpenVPN3(context));
    }

    public int checkProfile(Context context, boolean useOpenVPN3) {
        if ((mAuthenticationType == TYPE_KEYSTORE || mAuthenticationType == TYPE_USERPASS_KEYSTORE || mAuthenticationType == TYPE_EXTERNAL_APP) && TextUtils.isEmpty(mAlias))
            return R.string.no_keystore_cert_selected;
        if ((mAuthenticationType == TYPE_CERTIFICATES || mAuthenticationType == TYPE_USERPASS_CERTIFICATES) && TextUtils.isEmpty(mCaFilename) && !mCheckPeerFingerprint)
            return R.string.no_ca_cert_selected;
        return R.string.no_error_found;
    }

    public String getPasswordPrivateKey() {
        String cachedPw = PasswordCache.getPKCS12orCertificatePassword(mUuid, false);
        if (cachedPw != null) return cachedPw;
        switch (mAuthenticationType) {
            case TYPE_PKCS12: case TYPE_USERPASS_PKCS12: return mPKCS12Password;
            case TYPE_CERTIFICATES: case TYPE_USERPASS_CERTIFICATES: return mKeyPassword;
            default: return null;
        }
    }

    public boolean isUserPWAuth() {
        switch (mAuthenticationType) {
            case TYPE_USERPASS: case TYPE_USERPASS_CERTIFICATES:
            case TYPE_USERPASS_KEYSTORE: case TYPE_USERPASS_PKCS12:
                return true;
            default:
                return false;
        }
    }

    public boolean requireTLSKeyPassword() {
        if (TextUtils.isEmpty(mClientKeyFilename)) return false;
        String keyFileContent = "";
        if (isEmbedded(mClientKeyFilename)) {
            keyFileContent = getEmbeddedContent(mClientKeyFilename);
        } else {
            try (FileReader fr = new FileReader(mClientKeyFilename)) {
                char[] buf = new char[2048];
                int len;
                StringWriter sw = new StringWriter();
                while ((len = fr.read(buf)) != -1) sw.write(buf, 0, len);
                keyFileContent = sw.toString();
            } catch (IOException e) {
                return false;
            }
        }
        return keyFileContent.contains("Proc-Type: 4,ENCRYPTED") || keyFileContent.contains("-----BEGIN ENCRYPTED PRIVATE KEY-----");
    }

    public int needUserPWInput(String transientCertOrPkcs12PW, String transientAuthPW) {
        if ((mAuthenticationType == TYPE_PKCS12 || mAuthenticationType == TYPE_USERPASS_PKCS12) &&
                TextUtils.isEmpty(mPKCS12Password) && TextUtils.isEmpty(transientCertOrPkcs12PW)) {
            return R.string.pkcs12_file_encryption_key;
        }
        if ((mAuthenticationType == TYPE_CERTIFICATES || mAuthenticationType == TYPE_USERPASS_CERTIFICATES) &&
                requireTLSKeyPassword() && TextUtils.isEmpty(mKeyPassword) && TextUtils.isEmpty(transientCertOrPkcs12PW)) {
            return R.string.private_key_password;
        }
        if (isUserPWAuth() && TextUtils.isEmpty(getPasswordAuth()) && TextUtils.isEmpty(transientAuthPW)) {
            return R.string.password;
        }
        return 0;
    }

    public String getPasswordAuth() {
        String cachedPw = PasswordCache.getAuthPassword(mUuid, false);
        return cachedPw != null ? cachedPw : mPassword;
    }

    public PrivateKey getKeystoreKey() {
        return mPrivateKey;
    }

    @Nullable
    public String getSignedData(Context c, String b64data, OpenVPNManagement.SignaturePadding padding, String saltlen, String hashalg, boolean needDigest) {
        return null;
    }

    private boolean isStaticKey() {
        return mAuthenticationType == TYPE_STATICKEYS;
    }

    public String getPqcKEMs() { return mPqcKEMs == null ? "" : mPqcKEMs; }
    public void setPqcKEMs(String pqcKEMs) { this.mPqcKEMs = pqcKEMs; addChangeLogEntry("PQC KEMs changed"); }
    public String getPqcTlsCipher() { return mPqcTlsCipher == null ? "" : mPqcTlsCipher; }
    public void setPqcTlsCipher(String pqcTlsCipher) { this.mPqcTlsCipher = pqcTlsCipher; addChangeLogEntry("PQC TLS Cipher changed"); }

    private enum RsaPaddingType {
        NO_PADDING, PKCS1_PADDING, RSAPSS_PADDING
    }

    private boolean useTLSClient() {
        return mAuthenticationType != TYPE_STATICKEYS;
    }

    static class NoCertReturnedException extends Exception {
        public NoCertReturnedException(String msg) {
            super(msg);
        }
    }

    public String getUUIDString() {
        return mUuid.toString().toLowerCase(Locale.ENGLISH);
    }


    // --- Parcelable Implementation ---
    @Override
    public int describeContents() {
        return 0;
    }

    @Override
    public void writeToParcel(Parcel dest, int flags) {
        dest.writeInt(mVersion);
        dest.writeString(mServerName);
        dest.writeString(mServerPort);
        dest.writeString(mCustomConfig);
        dest.writeInt(mProfileVersion);
        dest.writeInt(mAuthenticationType);
        dest.writeString(mName);
        dest.writeString(mAlias);
        dest.writeString(mClientCertFilename);
        dest.writeString(mTLSAuthDirection);
        dest.writeString(mTLSAuthFilename);
        dest.writeString(mClientKeyFilename);
        dest.writeString(mCaFilename);
        dest.writeByte((byte) (mUseLzo ? 1 : 0));
        dest.writeString(mPKCS12Filename);
        dest.writeString(mPKCS12Password);
        dest.writeByte((byte) (mUseTLSAuth ? 1 : 0));
        dest.writeString(mDNS1);
        dest.writeString(mDNS2);
        dest.writeString(mIPv4Address);
        dest.writeString(mIPv6Address);
        dest.writeByte((byte) (mOverrideDNS ? 1 : 0));
        dest.writeString(mSearchDomain);
        dest.writeByte((byte) (mUseDefaultRoute ? 1 : 0));
        dest.writeByte((byte) (mUsePull ? 1 : 0));
        dest.writeString(mCustomRoutes);
        dest.writeByte((byte) (mCheckRemoteCN ? 1 : 0));
        dest.writeByte((byte) (mExpectTLSCert ? 1 : 0));
        dest.writeString(mRemoteCN);
        dest.writeString(mPassword);
        dest.writeString(mUsername);
        dest.writeByte((byte) (mRoutenopull ? 1 : 0));
        dest.writeByte((byte) (mUseRandomHostname ? 1 : 0));
        dest.writeByte((byte) (mUseFloat ? 1 : 0));
        dest.writeByte((byte) (mUseCustomConfig ? 1 : 0));
        dest.writeString(mCustomConfigOptions);
        dest.writeString(mVerb);
        dest.writeString(mCipher);
        dest.writeByte((byte) (mNobind ? 1 : 0));
        dest.writeByte((byte) (mUseDefaultRoutev6 ? 1 : 0));
        dest.writeString(mCustomRoutesv6);
        dest.writeString(mKeyPassword);
        dest.writeByte((byte) (mPersistTun ? 1 : 0));
        dest.writeString(mConnectRetryMax);
        dest.writeString(mConnectRetry);
        dest.writeString(mConnectRetryMaxTime);
        dest.writeByte((byte) (mUserEditable ? 1 : 0));
        dest.writeString(mAuth);
        dest.writeInt(mX509AuthType);
        dest.writeString(mx509UsernameField);
        dest.writeByte((byte) (mAllowLocalLAN ? 1 : 0));
        dest.writeString(mExcludedRoutes);
        dest.writeString(mExcludedRoutesv6);
        dest.writeInt(mMssFix);
        dest.writeTypedArray(mConnections, flags);
        dest.writeByte((byte) (mRemoteRandom ? 1 : 0));
        dest.writeSerializable(mAllowedAppsVpn);
        dest.writeByte((byte) (mAllowedAppsVpnAreDisallowed ? 1 : 0));
        dest.writeByte((byte) (mAllowAppVpnBypass ? 1 : 0));
        dest.writeString(mCrlFilename);
        dest.writeString(mProfileCreator);
        dest.writeString(mExternalAuthenticator);
        dest.writeInt(mAuthRetry);
        dest.writeInt(mTunMtu);
        dest.writeByte((byte) (mPushPeerInfo ? 1 : 0));
        dest.writeLong(mLastUsed);
        dest.writeString(importedProfileHash);
        dest.writeByte((byte) (mTemporaryProfile ? 1 : 0));
        dest.writeString(mDataCiphers);
        dest.writeByte((byte) (mBlockUnusedAddressFamilies ? 1 : 0));
        dest.writeByte((byte) (mCheckPeerFingerprint ? 1 : 0));
        dest.writeString(mPeerFingerPrints);
        dest.writeInt(mCompatMode);
        dest.writeByte((byte) (mUseLegacyProvider ? 1 : 0));
        dest.writeString(mTlSCertProfile);
        dest.writeLong(mCreationDate);
        dest.writeString(mPqcKEMs);
        dest.writeString(mPqcTlsCipher);
        dest.writeSerializable(mUuid);
    }

    public static final Creator<VpnProfile> CREATOR = new Creator<VpnProfile>() {
        @Override
        public VpnProfile createFromParcel(Parcel in) {
            return new VpnProfile(in);
        }

        @Override
        public VpnProfile[] newArray(int size) {
            return new VpnProfile[size];
        }
    };

    public void addProfileToBuilder(VpnService.Builder builder, Context context) {
        Log.d(TAG, "Configuring VpnService.Builder from profile: " + mName);

        builder.setSession(mName);

        // DNS
        if (mOverrideDNS) {
            builder.addDnsServer(mDNS1);
            if (!TextUtils.isEmpty(mDNS2))
                builder.addDnsServer(mDNS2);
        }

        // Placeholder address: required by the API before establish()
        try {
            builder.addAddress("10.8.0.1", 24);
            Log.i(TAG, "Set placeholder IPv4 address 10.8.0.1/24");
        } catch (IllegalArgumentException e) {
            Log.e(TAG, "Failed to set placeholder address", e);
        }

        // Routes
        if (mUseDefaultRoute) {
            builder.addRoute("0.0.0.0", 0);
            Log.d(TAG, "Adding default IPv4 route.");
        }
        if (mUseDefaultRoutev6) {
            builder.addRoute("::", 0);
            Log.d(TAG, "Adding default IPv6 route.");
        }

        // Bypass our own process
        try {
            builder.addDisallowedApplication(context.getPackageName());
        } catch (PackageManager.NameNotFoundException e) {
            Log.e(TAG, "Could not add self to disallowed apps", e);
        }
    }

}