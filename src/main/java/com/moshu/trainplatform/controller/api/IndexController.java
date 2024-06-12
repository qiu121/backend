package com.moshu.trainplatform.controller.api;


import com.moshu.trainplatform.aop.BussinessLog;
import com.moshu.trainplatform.aop.LogType;
import com.moshu.trainplatform.constant.Constant;
import com.moshu.trainplatform.constant.exception.EmBizError;
import com.moshu.trainplatform.entity.UserInfo;
import com.moshu.trainplatform.service.UserInfoService;
import com.moshu.trainplatform.template.SuccessResponse;
import com.moshu.trainplatform.utils.JwtUtils;
import com.moshu.trainplatform.utils.TokenUtil;
import com.moshu.trainplatform.utils.UserUtil;
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
    @BussinessLog(module = LogType.LOG_OUT)
    public SuccessResponse loginOut() {
        redisTemplate.delete(TokenUtil.getToken());
        redisTemplate.delete(Constant.SYSTEM_CODE + UserUtil.getUserInfoByToken().getUserId());
        return new SuccessResponse(200);
    }

    @PostMapping("/login")
    @ResponseBody
    @BussinessLog(module = LogType.LOGIN_SUCCESSFUL)
    public SuccessResponse login(@RequestBody UserInfo user) {
        ValueOperations<String, Object> ops = redisTemplate.opsForValue();

        var failedKey = "loginfailed:" + user.getUserName();
        if (!redisTemplate.hasKey(failedKey)) ops.set(failedKey, 0, 3, TimeUnit.MINUTES);

        // 判断失败次数
        if ((int) ops.get(failedKey) >= 5) return new SuccessResponse(EmBizError.USER_TOO_MANY_FAILED_LOGIN_ATTEMPTS);

        try {
            UserInfo userInfo =  userInfoService.getUserByUsername(user.getUserName());
            if (userInfo == null) {
                ops.set(failedKey, (int) ops.get(failedKey) + 1, 3, TimeUnit.MINUTES);
                return new SuccessResponse(EmBizError.USER_INCORRECT_USERNAME_OR_PASSWORD);
            }

            Object result = new SimpleHash("MD5", user.getPassWord() , userInfo.getUserName() + userInfo.getSalt(), 3);
            if(!userInfo.getPassWord().equals(result.toString())){
                ops.set(failedKey, (int) ops.get(failedKey) + 1, 3, TimeUnit.MINUTES);
                return new SuccessResponse(EmBizError.USER_INCORRECT_USERNAME_OR_PASSWORD);
            }

            //删除登陆失败记录
            redisTemplate.delete(failedKey);

            // 保存token 对应的账号
            String token = JwtUtils.createToken(user.getUserName(), user.getPassWord());
            Map<String, String> userMap = new HashMap<>();
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
