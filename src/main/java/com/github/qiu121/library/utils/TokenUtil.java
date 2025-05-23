package com.github.qiu121.library.utils;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;

@Component
public class TokenUtil {
    @Autowired
    RedisTemplate redisTemplate;

    // 获取token
    public static String getToken() {
        // 获取登录用户名
        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
        String token = request.getHeader("AUTH_TOKEN");
        return (token == null ? "" : token);
    }
}
