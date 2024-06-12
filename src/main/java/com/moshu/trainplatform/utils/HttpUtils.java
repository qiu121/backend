package com.moshu.trainplatform.utils;
import org.springframework.http.HttpMethod;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

/**
 * 文件名：  ${file_name}
 * 版权：    Copyright by ljm
 * 描述：
 * 修改人：  HuamingChen
 * 修改时间：2018/10/24
 * 跟踪单号：
 * 修改单号：
 * 修改内容：
 */
public class HttpUtils {

    public static String httpGet(String url){
        RestTemplate restTemplate=new RestTemplate();
        String result=restTemplate.exchange(url, HttpMethod.GET,null,String.class).getBody();
        return result;
    }

    public static String httpPost(String url, MultiValueMap<String,Object> name){
        RestTemplate restTemplate=new RestTemplate();
        return restTemplate.postForEntity(url,name,String.class).getBody();
    }

}