package com.github.qiu121.library.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.github.qiu121.library.entity.UserRole;
import com.github.qiu121.library.mapper.RoleMapper;
import com.github.qiu121.library.mapper.UserRoleMapper;
import com.github.qiu121.library.service.UserRoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserRoleServiceImpl extends ServiceImpl<UserRoleMapper, UserRole> implements UserRoleService {

    @Autowired
    private UserRoleMapper userRoleMapper;

    @Autowired
    private RoleMapper roleMapper;

    @Override
    public UserRole getUserRoleByUserId(String userId) {
        LambdaQueryWrapper<UserRole> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.eq(UserRole::getUserId, userId);
        UserRole userRole = userRoleMapper.selectOne(queryWrapper);
        userRole.setRole(roleMapper.selectById(userRole.getRoleId()));
        return userRole;
    }
}
