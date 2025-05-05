package com.github.qiu121.library.config;


import com.github.qiu121.library.constant.Constant;
import com.github.qiu121.library.entity.Permission;
import com.github.qiu121.library.entity.UserInfo;
import com.github.qiu121.library.service.PermissionService;
import com.github.qiu121.library.utils.UserUtil;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.ValueOperations;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.concurrent.TimeUnit;

@Component
public class ShiroRealm extends AuthorizingRealm {

    @Autowired
    RedisTemplate redisTemplate;

    @Autowired
    private PermissionService permissionService;

    @Override
    public boolean supports(AuthenticationToken token) {
        return token instanceof JwtToken;
    }

    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principalCollection) {
        UserInfo userInfo = UserUtil.getUserInfoByToken();
        if (userInfo == null) {
            throw new AuthenticationException("Token认证失败");
        }

        // 添加角色和权限
        SimpleAuthorizationInfo simpleAuthorizationInfo = new SimpleAuthorizationInfo();
        // 添加角色
        simpleAuthorizationInfo.addRole(userInfo.getRole().getRole());

        // 获取角色权限
        List<Permission> permissions = permissionService.getPermissionInfoByReact(userInfo.getRole().getRoleId());
        for (Permission permission : permissions) {
            simpleAuthorizationInfo.addStringPermission(permission.getPermissionCode());

        }
        return simpleAuthorizationInfo;
    }

    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authenticationToken) throws AuthenticationException {
        // 加这一步的目的是在Post请求的时候会先进认证，然后在到请求
        if (authenticationToken.getPrincipal() == null) {
            return null;
        }

        String jwt = (String) authenticationToken.getCredentials();
        // 获取当前
        if (!redisTemplate.hasKey(jwt)) {
            throw new AuthenticationException("Token不一致");
        }

        // 获取当前用户信息
        ValueOperations<String, Object> ops = redisTemplate.opsForValue();
        UserInfo userInfo = UserUtil.getUserInfoByToken();
        if (userInfo == null) {
            throw new AuthenticationException("账号不存在");
        }

        // 更新时间
        redisTemplate.expire(jwt, 3, TimeUnit.HOURS);
        redisTemplate.expire(Constant.SYSTEM_CODE + userInfo.getUserId(), 3, TimeUnit.HOURS);

        return new SimpleAuthenticationInfo(jwt, jwt, "ShiroRealm");
    }

}
