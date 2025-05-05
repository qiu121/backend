package com.github.qiu121.library.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.github.qiu121.library.constant.enumConstant.EmRoleType;
import com.github.qiu121.library.entity.UserInfo;
import com.github.qiu121.library.entity.UserRole;
import com.github.qiu121.library.mapper.UserInfoMapper;
import com.github.qiu121.library.service.UserInfoService;
import com.github.qiu121.library.service.UserRoleService;
import com.github.qiu121.library.utils.UserUtil;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.UUID;

@Service
@Transactional
public class UserInfoServiceImpl extends ServiceImpl<UserInfoMapper, UserInfo> implements UserInfoService {

    @Autowired
    UserInfoMapper userInfoMapper;

    @Autowired
    private UserRoleService userRoleService;

    @Override
    public UserInfo getUserByUsername(String username) {
        LambdaQueryWrapper<UserInfo> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.eq(UserInfo::getUserName, username);
        UserInfo user = userInfoMapper.selectOne(queryWrapper);
        if (user != null) {
            user.setRole(userRoleService.getUserRoleByUserId(user.getUserId()).getRole());
        }
        return user;
    }

    @Override
    public void resetPassWord(UserInfo userInfo, String newPassWord) {
        // 获取需要修改的用户信息
        String salt = UUID.randomUUID().toString();
        Object pwd = new SimpleHash("MD5", newPassWord, userInfo.getUserName() + salt, 3);
        userInfo.setPassWord(pwd.toString());
        userInfo.setSalt(salt);
        userInfoMapper.updateById(userInfo);
    }

    @Override
    public void registerUser(UserInfo userInfo) {
        userInfo.setUserId(UUID.randomUUID().toString());
        String salt = UUID.randomUUID().toString();
        Object result = new SimpleHash("MD5", userInfo.getPassWord(), userInfo.getUserName() + salt, 3);   // 加盐后的密码
        userInfo.setPassWord(result.toString());
        userInfo.setSalt(salt);
        userInfo.setStatus(1);
        userInfo.setCreatedTime(new Date());
        userInfoMapper.insert(userInfo);

        UserRole ur = new UserRole();
        ur.setUserRoleId(UUID.randomUUID().toString());
        ur.setUserId(userInfo.getUserId());
        // 默认用户权限
        ur.setRoleId(EmRoleType.USER.getIndex());
        if (UserUtil.isRole(EmRoleType.ADMIN.toString())) {
            ur.setRoleId(userInfo.getRoleId());
        }
        userRoleService.save(ur);
    }

    @Override
    public void authRegisterUser(UserInfo userInfo) {
        userInfo.setUserId(UUID.randomUUID().toString());
        userInfo.setSalt(UUID.randomUUID().toString());
        userInfo.setStatus(1);
        userInfo.setCreatedTime(new Date());
        userInfoMapper.insert(userInfo);

        UserRole ur = new UserRole();
        ur.setUserRoleId(UUID.randomUUID().toString());
        ur.setUserId(userInfo.getUserId());
        // 默认用户权限
        ur.setRoleId(EmRoleType.USER.getIndex());
        userRoleService.save(ur);
    }

    @Override
    public void delUserInfoByUserId(String userId) {
        // TODO 需要加上条件
        // 删除用户权限信息
        LambdaQueryWrapper<UserRole> delQueryWrapper = new LambdaQueryWrapper<>();
        delQueryWrapper.eq(UserRole::getUserId, userId);
        userRoleService.remove(delQueryWrapper);

        // 删除用户信息
        userInfoMapper.deleteById(userId);
    }

}
