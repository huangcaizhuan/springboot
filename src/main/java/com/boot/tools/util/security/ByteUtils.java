package com.boot.tools.util.security;




public class ByteUtils {
    static final char[] digits = new char[]{'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z'};

    private ByteUtils() {
    }

    public static String toString(byte[] bytes) {
        StringBuilder tmp = new StringBuilder();
        byte[] arr$ = bytes;
        int len$ = bytes.length;

        for(int i$ = 0; i$ < len$; ++i$) {
            byte b = arr$[i$];
            byte shift = 4;
            int i = 255 & b;
            char[] buf = new char[32];
            int charPos = 32;
            int radix = 1 << shift;
            int mask = radix - 1;

            do {
                --charPos;
                buf[charPos] = digits[i & mask];
                i >>>= shift;
            } while(i != 0);

            if(charPos == 31) {
                tmp.append("0");
            }

            tmp.append(buf, charPos, 32 - charPos);
        }

        return tmp.toString();
    }

    public static byte[] hex2Bytes(String hex) {
        int length = hex.length() / 2 * 2;
        byte[] result = new byte[length / 2];

        for(int i = 0; i < length; i += 2) {
            result[i / 2] = Integer.valueOf(hex.substring(i, i + 2), 16).byteValue();
        }

        return result;
    }
}
