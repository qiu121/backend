package com.github.qiu121.library.aop;

import com.alibaba.fastjson.JSON;
import com.github.qiu121.library.entity.Log;
import com.github.qiu121.library.entity.UserInfo;
import com.github.qiu121.library.service.LogService;
import com.github.qiu121.library.utils.GetIpUtil;
import com.github.qiu121.library.utils.UserUtil;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.Signature;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.aspectj.lang.reflect.MethodSignature;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import java.lang.reflect.Method;

@Aspect
@Component
public class LogAopAction {
    @Autowired
    private LogService logservice;

    @Autowired
    RedisTemplate redisTemplate;

    // 配置接入点
    @Pointcut("@annotation(com.github.qiu121.library.aop.BusinessLog)")
    private void controllerAspect() {
    }

    // 定义一个切入点
    @SuppressWarnings("rawtypes")
    @Around("controllerAspect()")
    public Object around(ProceedingJoinPoint point) throws Throwable {
        UserInfo userInfo = UserUtil.getUserInfoByToken();
        if (userInfo == null) {
            userInfo = new UserInfo();
            userInfo.setUserName("非用户调用");
            userInfo.setName("非用户调用");
        }

        Log log = new Log();
        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
        log.setIp(GetIpUtil.getIpAddr(request));
        // 拦截的实体类，就是当前正在执行的controller
        Object target = point.getTarget();
        // 拦截的方法名称。当前正在执行的方法
        String methodName = point.getSignature().getName();
        // 拦截的方法参数
        Object[] params = point.getArgs();
        // 拦截的方法参数类型
        Signature sig = point.getSignature();
        if (!(sig instanceof MethodSignature)) {
            throw new IllegalArgumentException("该注解只能用于方法");
        }

        MethodSignature msig = (MethodSignature) sig;
        Class[] parameterTypes = msig.getMethod().getParameterTypes();

        Object object = null;
        // 获得被拦截的方法
        Method method = target.getClass().getMethod(methodName, parameterTypes);

        // 判断是否包含自定义的注解，说明一下这里的BussinessLog就是我自己自定义的注解
        if (method.isAnnotationPresent(BusinessLog.class)) {
            BusinessLog businessLog = method.getAnnotation(BusinessLog.class);
            log.setUserName(userInfo.getUserName());
            log.setModule("【" + userInfo.getName() + "】" + businessLog.module());
            log.setMethod(request.getRequestURL().toString());// 方法
            log.setParams(JSON.toJSON(params).toString());
            try {
                object = point.proceed();
                log.setCommit("执行成功！");
                logservice.save(log);
            } catch (Throwable e) {
                log.setCommit("执行失败！");
                logservice.save(log);
                e.printStackTrace();
            }
        } else { // 不需要拦截直接执行
            object = point.proceed();
        }
        return object;
    }

}