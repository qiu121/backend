package com.moshu.trainplatform.utils;

import javax.net.ssl.HttpsURLConnection;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.Map;

public class HttpsResponse {
    public Map<String, List<String>> header;
    public String body;

    private HttpsResponse() {
    }

    public HttpsResponse(HttpsURLConnection conn) throws IOException {
        this.header = conn.getHeaderFields();
        this.body = getResponseBody(conn);
    }

    private static byte[] getBytesFromStream(InputStream is) throws IOException {
        ByteArrayOutputStream baos = new ByteArrayOutputStream();
        byte[] kb = new byte[1024];
        int len;
        while ((len = is.read(kb)) != -1) {
            baos.write(kb, 0, len);
        }
        byte[] bytes = baos.toByteArray();
        baos.close();
        is.close();
        return bytes;
    }

    private static String getResponseBody(HttpsURLConnection conn) throws IOException {
        return new String(getBytesFromStream(conn.getInputStream()), "utf-8");
    }

}
