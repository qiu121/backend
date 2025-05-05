package com.github.qiu121.library.service.impl;

import com.github.qiu121.library.entity.Permission;
import com.github.qiu121.library.mapper.PermissionMapper;
import com.github.qiu121.library.service.PermissionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class PermissionServiceImpl implements PermissionService {

    @Autowired
    PermissionMapper permissionMapper;

    @Override
    public List<Map<String, Object>> getPermissionInfo(Integer roleId) {

        List<Map<String, Object>> permissionInfoList = permissionMapper.getPermissionInfo(roleId);
        for (Map<String, Object> thiMap : permissionInfoList) {
            thiMap.put("ActionsInfo", permissionMapper.getPermissionsActionsInfo(thiMap.get("permissionId").hashCode()));
        }

        return permissionInfoList;
    }

    @Override
    public List<Permission> getPermissionInfoByReact(Integer roleId) {
        List<Permission> permissionInfoList = permissionMapper.getPermissionInfoByReact(roleId);

        return permissionInfoList;
    }
}
