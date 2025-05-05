package com.github.qiu121.library.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.ApplicationArguments;
import org.springframework.boot.ApplicationRunner;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.stereotype.Component;

import java.util.Set;

@Component
public class RedisCleaner implements ApplicationRunner {

    @Autowired
    private StringRedisTemplate stringRedisTemplate;

    @Override
    public void run(ApplicationArguments args) throws Exception {
        // 启动时清理所有Redis缓存
        Set<String> keys = stringRedisTemplate.keys("*");
        //        stringRedisTemplate.delete(keys);
    }

}