package com.moshu.trainplatform.utils;


import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;

import javax.net.ssl.*;
import java.io.*;
import java.net.URL;
import java.security.KeyManagementException;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.security.cert.CertificateException;
import java.security.cert.X509Certificate;
import java.util.*;

public final class HttpsRequest {
	
	private HttpsRequest() { }

    private static final class DefaultTrustManager implements X509TrustManager {
        @Override
        public void checkClientTrusted(X509Certificate[] chain, String authType) throws CertificateException {
        }

        @Override
        public void checkServerTrusted(X509Certificate[] chain, String authType) throws CertificateException {
        }

        @Override
        public X509Certificate[] getAcceptedIssuers() {
            return null;
        }
    }

    private static HttpsURLConnection getHttpsURLConnection(String uri,  Map<String, String> requestHeader, String method) throws IOException {
        SSLContext ctx = null;
        try {
            ctx = SSLContext.getInstance("TLS");
            ctx.init(new KeyManager[0], new TrustManager[]{new DefaultTrustManager()}, new SecureRandom());
        } catch (KeyManagementException e) {
            e.printStackTrace();
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }
        SSLSocketFactory ssf = ctx.getSocketFactory();

        URL url = new URL(uri);
        HttpsURLConnection httpsConn = (HttpsURLConnection) url.openConnection();
        httpsConn.setSSLSocketFactory(ssf);
        httpsConn.setHostnameVerifier(new HostnameVerifier() {
            @Override
            public boolean verify(String arg0, SSLSession arg1) {
                return true;
            }
        });
        httpsConn.setRequestMethod(method);
        httpsConn.setDoInput(true);
        httpsConn.setDoOutput(true);
        if (requestHeader != null) {
            for (String key : requestHeader.keySet()) {
                httpsConn.setRequestProperty(key, requestHeader.get(key));
            }
        }
        return httpsConn;
    }

    private static void setBytesToStream(OutputStream os, byte[] bytes) throws IOException {
        ByteArrayInputStream bais = new ByteArrayInputStream(bytes);
        byte[] kb = new byte[1024];
        int len;
        while ((len = bais.read(kb)) != -1) {
            os.write(kb, 0, len);
        }
        os.flush();
        os.close();
        bais.close();
    }

    public static HttpsResponse post(String uri, Map<String, String> requestHeader, Map requestBody) throws IOException {
        String data = JSON.toJSONString(requestBody);
        HttpsURLConnection conn = getHttpsURLConnection(uri, requestHeader, "POST");
        
        setBytesToStream(conn.getOutputStream(), data.getBytes());
        return new HttpsResponse(conn);
    }

    public static HttpsResponse get(String uri, Map<String, String> requestHeader) throws IOException {
        HttpsURLConnection conn = getHttpsURLConnection(uri, requestHeader, "GET");
        
        return new HttpsResponse(conn);
    }

    public static HttpsResponse delete(String uri, Map<String, String> requestHeader) throws IOException {
        HttpsURLConnection conn = getHttpsURLConnection(uri, requestHeader, "DELETE");

        return new HttpsResponse(conn);
    }

    public static void main(String[] args) throws IOException {
    }

}
