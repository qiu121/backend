package com.github.qiu121.library.utils;

import com.baomidou.mybatisplus.core.toolkit.StringUtils;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.*;


public class SignUtil {

    private static String api_id = "rms2021101810300306ws4aid";

    private static String key = "zfd2hyvxrzp5kujq1e7zwrgwxj9bufcs";

    public static String createSign(String timestamp) {
        SortedMap<String, Object> params = new TreeMap<>();
        params.put("api_id", api_id);
        params.put("method", "loginSign");
        params.put("timestamp", timestamp);

        StringBuffer stringBuffer = new StringBuffer();
        Set set = params.entrySet();
        Iterator iterator = set.iterator();
        while (iterator.hasNext()) {
            Map.Entry entry = (Map.Entry) iterator.next();
            String entryKey = (String) entry.getKey();
            Object value = entry.getValue();
            if (StringUtils.isNotBlank(value.toString())) {
                stringBuffer.append(entryKey + "=" + value + "&");
            }
        }

        stringBuffer = stringBuffer.append("key=" + key);
        return MD5(stringBuffer.toString());
    }

    public static String MD5(String str) {
        String result = "";
        try {
            MessageDigest md = MessageDigest.getInstance("MD5");
            md.update(str.getBytes());
            byte b[] = md.digest();
            int i;
            StringBuffer buf = new StringBuffer("");
            for (int offset = 0; offset < b.length; offset++) {
                i = b[offset];
                if (i < 0)
                    i += 256;
                if (i < 16)
                    buf.append("0");
                buf.append(Integer.toHexString(i));
            }
            result = buf.toString().toUpperCase(); // 32位的加密
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }
        return result;
    }

}
