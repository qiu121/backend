package com.moshu.trainplatform.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.moshu.trainplatform.entity.Permission;
import com.moshu.trainplatform.entity.PermissionAction;
import com.moshu.trainplatform.mapper.PermissionActionMapper;
import com.moshu.trainplatform.mapper.PermissionMapper;
import com.moshu.trainplatform.service.PermissionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class PermissionServiceImpl implements PermissionService{

    @Autowired
    PermissionMapper permissionMapper;

    @Autowired
    PermissionActionMapper permissionActionMapper;

    @Override
    public List<Map<String,Object>> getPermissionInfo(Integer roleId) {

        List<Map<String,Object>> permissionInfoList = permissionMapper.getPermissionInfo(roleId);
        for (Map<String,Object> thiMap : permissionInfoList){
            thiMap.put("ActionsInfo",permissionMapper.getPermissionsActionsInfo(thiMap.get("permissionId").hashCode()));
        }

        return permissionInfoList;
    }

    @Override
    public List<Permission> getPermissionInfoByReact(Integer roleId) {
        List<Permission> permissionInfoList = permissionMapper.getPermissionInfoByReact(roleId);
        for (Permission permission : permissionInfoList){
            QueryWrapper<PermissionAction> queryWrapper = new QueryWrapper<>();
            queryWrapper.eq("permission_id", permission.getPermissionId());
            permission.setActionsList(permissionActionMapper.selectList(queryWrapper));
        }

        return permissionInfoList;
    }
}
