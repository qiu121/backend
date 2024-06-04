package com.moshu.trainplatform.config;

import com.moshu.trainplatform.entity.UserInfo;
import com.moshu.trainplatform.service.UserService;
import com.moshu.trainplatform.utils.Token;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.util.ByteSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.ValueOperations;

public class ShiroRealm extends AuthorizingRealm {

    @Autowired
    private UserService loginService;

    @Autowired
    RedisTemplate redisTemplate;

    /**
     * 鉴权
     *
     * @param principalCollection
     * @return
     */
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principalCollection) {
        ValueOperations<String, Object> ops = redisTemplate.opsForValue();
        UserInfo userInfo = (UserInfo) ops.get("userInfo:token:" + new Token().getToken());

        // 添加角色和权限
        SimpleAuthorizationInfo simpleAuthorizationInfo = new SimpleAuthorizationInfo();

        // 添加角色
        assert userInfo != null;
        simpleAuthorizationInfo.addRole(userInfo.getRole().getRole());

        // 添加权限
        // for (Permissions permissions : role.getPermissions()) {
        //     simpleAuthorizationInfo.addStringPermission(permissions.getPermissionsName());
        // }
        return simpleAuthorizationInfo;
    }

    /**
     * 身份认证
     *
     * @param authenticationToken
     * @return
     * @throws AuthenticationException
     */
    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authenticationToken) throws AuthenticationException {
        // 加这一步的目的是在Post请求的时候会先进认证，然后在到请求
        if (authenticationToken.getPrincipal() == null) {
            return null;
        }

        // 获取用户信息
        String username = authenticationToken.getPrincipal().toString();
        UserInfo user = loginService.getUserByUsername(username);
        if (user == null || user.getStatus() == 0) {
            // 这里返回后会报出对应异常
            return null;
        } else {
            // 这里验证authenticationToken和simpleAuthenticationInfo的信息
            SimpleAuthenticationInfo simpleAuthenticationInfo = new SimpleAuthenticationInfo(user, user.getPassword(), ByteSource.Util.bytes(username + user.getSalt()), getName());
            return simpleAuthenticationInfo;
        }
    }

}
