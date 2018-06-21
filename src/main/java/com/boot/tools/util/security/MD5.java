package com.boot.tools.util.security;


import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class MD5 {
    private MD5() {
    }

    public static String digest2Base64(String str) {
        if(str != null && str.length() != 0) {
            try {
                MessageDigest e = MessageDigest.getInstance("MD5");
                byte[] bytes = e.digest(str.getBytes("UTF-8"));
                return Base64.encodeBytes(bytes);
            } catch (NoSuchAlgorithmException var3) {
                throw new RuntimeException(var3);
            } catch (UnsupportedEncodingException var4) {
                throw new RuntimeException(var4);
            }
        } else {
            return "";
        }
    }

    public static String digest(String str) {
        if(str != null && str.length() != 0) {
            try {
                MessageDigest e = MessageDigest.getInstance("MD5");
                byte[] bytes = e.digest(str.getBytes("UTF-8"));
                return ByteUtils.toString(bytes);
            } catch (NoSuchAlgorithmException var3) {
                throw new RuntimeException(var3);
            } catch (UnsupportedEncodingException var4) {
                throw new RuntimeException(var4);
            }
        } else {
            return "";
        }
    }
}
