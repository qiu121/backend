package com.moshu.trainplatform.controller.api;

import com.moshu.trainplatform.aop.BussinessLog;
import com.moshu.trainplatform.aop.LogType;
import com.moshu.trainplatform.entity.UserInfo;
import com.moshu.trainplatform.template.SuccessResponse;
import com.moshu.trainplatform.utils.Token;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
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
    RedisTemplate redisTemplate;
    @Autowired
    private Token token;

    @GetMapping("/unauth")
    @ResponseBody
    public Object unAuth() {
        Map<String, Object> map = new HashMap<>();
        map.put("code", "1000000");
        map.put("msg", "未登录");
        return map;
    }

    @GetMapping("/UnauthorizedUrl")
    @ResponseBody
    public Object unauthorizedUrl() {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("code", "1000001");
        map.put("msg", "未授权");
        return map;
    }


    @GetMapping("/loginOut")
    @ResponseBody
    public SuccessResponse loginOut() {
        // 删除token
        redisTemplate.delete("shiro:session:" + new Token().getToken());

        // 删除用户信息
        redisTemplate.delete("userInfo:token:" + new Token().getToken());
        SuccessResponse sr = new SuccessResponse(200);
        return sr;
    }

    @PostMapping("/login")
    @ResponseBody
    @BussinessLog(module = LogType.LOGIN_SUCCESSFUL)
    public SuccessResponse login(@RequestBody UserInfo user) {
        user.setUserName(user.getUserName().trim());
        user.setPassword(user.getPassword().trim());
        ValueOperations<String, Object> ops = redisTemplate.opsForValue();

        var failedKey = "loginfailed:" + user.getUserName();
        if (redisTemplate.hasKey(failedKey)) {
            if ((int) ops.get(failedKey) >= 5) {
                SuccessResponse sr = new SuccessResponse(402);
                sr.put("message", "登录失败次数过多，请稍后再试");
                return sr;
            }
        }

        // 添加用户认证信息
        Subject subject = SecurityUtils.getSubject();
        UsernamePasswordToken usernamePasswordToken = new UsernamePasswordToken(user.getUserName(), user.getPassword());

        UserInfo userInfo;
        try {
            // 进行验证，这里可以捕获异常，然后返回对应信息
            subject.login(usernamePasswordToken);
            userInfo = (UserInfo) subject.getPrincipals().getPrimaryPrincipal();

        } catch (Exception e) {
            e.printStackTrace();
            SuccessResponse sr = new SuccessResponse(401);
            sr.put("message", "账号或密码错误");
            if (redisTemplate.hasKey(failedKey)) {
                ops.set(failedKey, (int) ops.get(failedKey) + 1, 3, TimeUnit.MINUTES);
            } else {
                ops.set(failedKey, 1, 3, TimeUnit.MINUTES);
            }
            return sr;
        }
        // 删除登陆失败记录
        redisTemplate.delete(failedKey);
        ((UserInfo) subject.getPrincipals().getPrimaryPrincipal()).getUserName();

        // 将用户信息存入redis
        ops.set("userInfo:token:" + subject.getSession().getId().toString(), userInfo);

        SuccessResponse sr = new SuccessResponse(200);
        sr.put("userInfo", userInfo);
        sr.put("token", subject.getSession().getId().toString());
        return sr;
    }


}
