/*
 * Copyright (c) 2012-2016 Arne Schwabe
 * Distributed under the GNU GPL v2 with additional terms. For full terms see the file doc/LICENSE.txt
 */

package de.blinkt.openvpn.core;

import java.util.Locale;

/**
 * Represents an IPv4 network in CIDR notation.
 */
class CIDRIP {
    String mIp;
    int len;

    public CIDRIP(String ip, String mask) {
        mIp = ip;
        len = calculateLenFromMask(mask);
    }

    public CIDRIP(String address, int prefix_length) {
        mIp = address;
        len = prefix_length;
    }

    /**
     * Parse a CIDR string like "192.168.1.0/24" or "192.168.1.0/255.255.255.0".
     * @param cidr the CIDR notation string
     * @return a CIDRIP object
     * @throws IllegalArgumentException if the input is invalid
     */
    public static CIDRIP parse(String cidr) {
        if (cidr == null) {
            throw new IllegalArgumentException("CIDR string is null");
        }
        String[] parts = cidr.split("/");
        if (parts.length != 2) {
            throw new IllegalArgumentException("Invalid CIDR format: " + cidr);
        }
        String ip = parts[0];
        String maskPart = parts[1];
        try {
            if (maskPart.contains(".")) {
                // Dotted netmask
                return new CIDRIP(ip, maskPart);
            } else {
                // Prefix length
                int prefix = Integer.parseInt(maskPart);
                return new CIDRIP(ip, prefix);
            }
        } catch (NumberFormatException e) {
            throw new IllegalArgumentException("Invalid prefix or mask in CIDR: " + cidr, e);
        }
    }

    @Override
    public String toString() {
        return String.format(Locale.ENGLISH, "%s/%d", mIp, len);
    }

    /**
     * Normalise the IP portion by zeroing out host bits.
     * @return true if the IP was changed
     */
    public boolean normalise() {
        long ipVal = getInt(mIp);
        long mask = 0xffffffffL << (32 - len);
        long newIp = ipVal & mask;
        if (newIp != ipVal) {
            mIp = String.format(Locale.US, "%d.%d.%d.%d",
                    (newIp >> 24) & 0xff,
                    (newIp >> 16) & 0xff,
                    (newIp >> 8) & 0xff,
                    newIp & 0xff);
            return true;
        }
        return false;
    }

    /**
     * Convert dotted IPv4 string to integer.
     */
    static long getInt(String ipaddr) {
        String[] octets = ipaddr.split("\\.");
        if (octets.length != 4) {
            throw new IllegalArgumentException("Invalid IPv4 address: " + ipaddr);
        }
        long result = 0;
        for (String octet : octets) {
            int val = Integer.parseInt(octet);
            result = (result << 8) | (val & 0xff);
        }
        return result;
    }

    /**
     * Get the integer representation of this IP.
     */
    public long getInt() {
        return getInt(mIp);
    }

    /**
     * Calculate prefix length from a dotted netmask.
     */
    public static int calculateLenFromMask(String mask) {
        long netmask = getInt(mask);
        // Add 33rd bit to ensure termination
        netmask |= 1L << 32;
        int zeroCount = 0;
        while ((netmask & 1) == 0) {
            zeroCount++;
            netmask >>= 1;
        }
        long expected = (0x1ffffffffL >> zeroCount);
        if (netmask != expected) {
            // Non-contiguous mask, default to /32
            return 32;
        }
        return 32 - zeroCount;
    }
}
