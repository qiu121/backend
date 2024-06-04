package com.moshu.trainplatform.utils;

import com.baomidou.mybatisplus.core.toolkit.StringUtils;
import com.moshu.trainplatform.entity.Role;
import com.moshu.trainplatform.entity.UserInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.ValueOperations;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;

@Component
public class UserUtil {

    private static RedisTemplate redisTemplate;

    // 构造方法注入静态变量
    @Autowired
    public void setDictService(RedisTemplate redisTemplate){
        UserUtil.redisTemplate = redisTemplate;
    }

    // 根据token获取userInfo
    public static UserInfo getUserInfoByToken() {
        //获取登录用户名
        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
        String token = request.getHeader("AUTH_TOKEN");
        if (StringUtils.isBlank(token)) return new UserInfo();
        ValueOperations<String, Object> ops = redisTemplate.opsForValue();
        return  (UserInfo) ops.get("userInfo:token:" + token);
    }

    // 判断权限
    public static boolean isRole(String roleName) {
        Role userRole = getUserInfoByToken().getRole();
        if (userRole == null) return false;
        return userRole.getRole().equals(roleName);
    }
}
