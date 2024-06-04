package com.moshu.trainplatform.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.ApplicationArguments;
import org.springframework.boot.ApplicationRunner;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.stereotype.Component;

import java.util.Set;

@Component
public class RedisCleaner implements ApplicationRunner {
    // 启动时清理所有Redis缓存

    @Autowired
    private StringRedisTemplate stringRedisTemplate;
    @Override
    public void run(ApplicationArguments args) throws Exception {
        Set<String> keys = stringRedisTemplate.keys("*");
//        stringRedisTemplate.delete(keys);
    }

}