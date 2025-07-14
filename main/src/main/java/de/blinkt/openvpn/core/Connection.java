/*
 * Copyright (c) 2012-2016 Arne Schwabe
 * Distributed under the GNU GPL v2 with additional terms. For full terms see the file doc/LICENSE.txt
 */

package de.blinkt.openvpn.core;

import android.os.Parcel;
import android.os.Parcelable;
import android.text.TextUtils;

import androidx.annotation.NonNull;

import java.io.Serializable;
import java.util.Locale;

public class Connection implements Serializable, Cloneable, Parcelable {
    public String mServerName = "openvpn.example.com";
    public String mServerPort = "1194";
    public boolean mUseUdp = true;
    public String mCustomConfiguration = "";
    public boolean mUseCustomConfig = false;
    public boolean mEnabled = true;
    public int mConnectTimeout = 0;
    public static final int CONNECTION_DEFAULT_TIMEOUT = 120;
    public ProxyType mProxyType = ProxyType.NONE;
    public String mProxyName = "proxy.example.com";
    public String mProxyPort = "8080";

    public boolean mUseProxyAuth;
    public String mProxyAuthUser = null;
    public String mProxyAuthPassword = null;

    public enum ProxyType {
        NONE,
        HTTP,
        SOCKS5,
        ORBOT
    }

    private static final long serialVersionUID = 92031902903829089L;

    public Connection() {}

    // --- Parcelable Implementation ---
    protected Connection(Parcel in) {
        mServerName = in.readString();
        mServerPort = in.readString();
        mUseUdp = in.readByte() != 0;
        mCustomConfiguration = in.readString();
        mUseCustomConfig = in.readByte() != 0;
        mEnabled = in.readByte() != 0;
        mConnectTimeout = in.readInt();
        mProxyType = ProxyType.valueOf(in.readString());
        mProxyName = in.readString();
        mProxyPort = in.readString();
        mUseProxyAuth = in.readByte() != 0;
        mProxyAuthUser = in.readString();
        mProxyAuthPassword = in.readString();
    }

    @Override
    public void writeToParcel(Parcel dest, int flags) {
        dest.writeString(mServerName);
        dest.writeString(mServerPort);
        dest.writeByte((byte) (mUseUdp ? 1 : 0));
        dest.writeString(mCustomConfiguration);
        dest.writeByte((byte) (mUseCustomConfig ? 1 : 0));
        dest.writeByte((byte) (mEnabled ? 1 : 0));
        dest.writeInt(mConnectTimeout);
        dest.writeString(mProxyType.name());
        dest.writeString(mProxyName);
        dest.writeString(mProxyPort);
        dest.writeByte((byte) (mUseProxyAuth ? 1 : 0));
        dest.writeString(mProxyAuthUser);
        dest.writeString(mProxyAuthPassword);
    }

    @Override
    public int describeContents() {
        return 0;
    }

    public static final Creator<Connection> CREATOR = new Creator<Connection>() {
        @Override
        public Connection createFromParcel(Parcel in) {
            return new Connection(in);
        }

        @Override
        public Connection[] newArray(int size) {
            return new Connection[size];
        }
    };
    // --- End of Parcelable Implementation ---


    public String getConnectionBlock(boolean isOpenVPN3) {
        String cfg = "";
        cfg += "remote ";
        cfg += mServerName;
        cfg += " ";
        cfg += mServerPort;
        if (mUseUdp)
            cfg += " udp\n";
        else
            cfg += " tcp-client\n";
        if (mConnectTimeout != 0)
            cfg += String.format(Locale.US, " connect-timeout  %d\n", mConnectTimeout);
        if ((isOpenVPN3 || usesExtraProxyOptions()) && mProxyType == ProxyType.HTTP) {
            cfg+=String.format(Locale.US,"http-proxy %s %s\n", mProxyName, mProxyPort);
            if (mUseProxyAuth)
                cfg+=String.format(Locale.US, "<http-proxy-user-pass>\n%s\n%s\n</http-proxy-user-pass>\n", mProxyAuthUser, mProxyAuthPassword);
        }
        if (usesExtraProxyOptions() && mProxyType == ProxyType.SOCKS5) {
            cfg+=String.format(Locale.US,"socks-proxy %s %s\n", mProxyName, mProxyPort);
        }
        if (!TextUtils.isEmpty(mCustomConfiguration) && mUseCustomConfig) {
            cfg += mCustomConfiguration;
            cfg += "\n";
        }
        return cfg;
    }

    public boolean usesExtraProxyOptions() {
        return (mUseCustomConfig && mCustomConfiguration.contains("http-proxy-option "));
    }

    // ### THIS IS THE FIX: The method signature is restored to its original form ###
    @Override
    public Connection clone() throws CloneNotSupportedException {
        return (Connection) super.clone();
    }

    public boolean isOnlyRemote() {
        return TextUtils.isEmpty(mCustomConfiguration) || !mUseCustomConfig;
    }

    public int getTimeout() {
        if (mConnectTimeout <= 0)
            return CONNECTION_DEFAULT_TIMEOUT;
        else
            return mConnectTimeout;
    }
}