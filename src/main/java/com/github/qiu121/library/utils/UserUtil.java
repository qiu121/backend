package com.github.qiu121.library.utils;

import com.baomidou.mybatisplus.core.toolkit.StringUtils;
import com.github.qiu121.library.constant.Constant;
import com.github.qiu121.library.entity.Role;
import com.github.qiu121.library.entity.UserInfo;
import com.github.qiu121.library.service.UserInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.ValueOperations;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

;

@Component
public class UserUtil {

    private static UserInfoService userInfoService;

    @Autowired
    public void setUserInfoService(UserInfoService userInfoService) {
        UserUtil.userInfoService = userInfoService;
    }

    private static RedisTemplate redisTemplate;

    // 构造方法注入静态变量
    @Autowired
    public void setDictService(RedisTemplate redisTemplate) {
        UserUtil.redisTemplate = redisTemplate;
    }

    // 根据token获取userInfo
    public static UserInfo getUserInfoByToken() {
        // 获取登录用户名
        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
        String token = request.getHeader("AUTH_TOKEN");
        if (StringUtils.isBlank(token)) {
            return null;
        }

        // 通过token获取绑定的账号信息
        ValueOperations<String, Object> ops = redisTemplate.opsForValue();
        Map<String, String> userMap = (Map<String, String>) ops.get(token);
        if (userMap == null) {
            return null;
        }

        String userId = Constant.SYSTEM_CODE + userMap.get("userId");
        if (redisTemplate.hasKey(userId)) {
            return (UserInfo) ops.get(userId);
        } else {
            return userInfoService.getUserByUsername(userMap.get("userName"));
        }
    }

    // 判断权限
    public static boolean isRole(String roleName) {
        Role userRole = getUserInfoByToken().getRole();
        if (userRole == null) {
            return false;
        }
        return userRole.getRole().equals(roleName);
    }
}
