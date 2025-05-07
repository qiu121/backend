package com.github.qiu121.library.controller.api;


import com.github.qiu121.library.aop.BusinessLog;
import com.github.qiu121.library.aop.LogType;
import com.github.qiu121.library.constant.Constant;
import com.github.qiu121.library.constant.exception.EmBizError;
import com.github.qiu121.library.entity.UserInfo;
import com.github.qiu121.library.service.UserInfoService;
import com.github.qiu121.library.template.SuccessResponse;
import com.github.qiu121.library.utils.JwtUtils;
import com.github.qiu121.library.utils.TokenUtil;
import com.github.qiu121.library.utils.UserUtil;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.ValueOperations;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.TimeUnit;

@Controller
public class IndexController {
    @Autowired
    private UserInfoService userInfoService;

    @Autowired
    RedisTemplate redisTemplate;

    @GetMapping("/unauth")
    @ResponseBody
    public Object unauth() {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("code", "1000000");
        map.put("msg", "未登录");
        return map;
    }

    @GetMapping("/loginOut")
    @ResponseBody
    @BusinessLog(module = LogType.LOG_OUT)
    public SuccessResponse loginOut() {
        redisTemplate.delete(Constant.SYSTEM_CODE + UserUtil.getUserInfoByToken().getUserId());
        redisTemplate.delete(TokenUtil.getToken());
        return new SuccessResponse(200);
    }

    @PostMapping("/login")
    @ResponseBody
    @BusinessLog(module = LogType.LOGIN_SUCCESSFUL)
    public SuccessResponse login(@RequestBody UserInfo user) {
        ValueOperations<String, Object> ops = redisTemplate.opsForValue();

        var failedKey = "loginfailed:" + user.getUserName();
        if (!redisTemplate.hasKey(failedKey)) ops.set(failedKey, 0, 3, TimeUnit.MINUTES);

        // 判断失败次数
        if ((int) ops.get(failedKey) >= 5) return new SuccessResponse(EmBizError.USER_TOO_MANY_FAILED_LOGIN_ATTEMPTS);

        try {
            UserInfo userInfo = userInfoService.getUserByUsername(user.getUserName());
            if (userInfo == null) {
                ops.set(failedKey, (int) ops.get(failedKey) + 1, 3, TimeUnit.MINUTES);
                return new SuccessResponse(EmBizError.USER_INCORRECT_USERNAME_OR_PASSWORD);
            }

            Object result = new SimpleHash("MD5", user.getPassWord(), userInfo.getUserName() + userInfo.getSalt(), 3);
            if (!userInfo.getPassWord().equals(result.toString())) {
                ops.set(failedKey, (int) ops.get(failedKey) + 1, 3, TimeUnit.MINUTES);
                return new SuccessResponse(EmBizError.USER_INCORRECT_USERNAME_OR_PASSWORD);
            }

            // 删除登陆失败记录
            redisTemplate.delete(failedKey);

            // 保存token 对应的账号
            String token = JwtUtils.createToken(user.getUserName(), user.getPassWord());
            Map<String, String> userMap = new HashMap<>();

            // TODO:这里不能简单直接将返回的用户信息中的密码置空，会影响数据写入redis,从而影响修改密码等操作 ！！！
            // userInfo.setPassWord("");
            // userInfo.setSalt("");

            userMap.put("userId", userInfo.getUserId());
            userMap.put("userName", userInfo.getUserName());
            ops.set(token, userMap, 3, TimeUnit.HOURS);
            // 保存用户的基本信息
            ops.set(Constant.SYSTEM_CODE + userInfo.getUserId(), userInfo, 3, TimeUnit.HOURS);

            SuccessResponse sr = new SuccessResponse(200);
            sr.put("token", token);
            sr.put("userInfo", userInfo);
            return sr;
        } catch (Exception e) {
            e.printStackTrace();
            return new SuccessResponse(EmBizError.UNKNOWN_ERROR);
        }
    }

}
