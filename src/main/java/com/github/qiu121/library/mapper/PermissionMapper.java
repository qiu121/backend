package com.github.qiu121.library.mapper;

import com.github.qiu121.library.entity.Permission;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;
import java.util.Map;

@Mapper
public interface PermissionMapper {

    @Select("SELECT p.* FROM role_permission rp " +
            "INNER JOIN permission p ON rp.permissionid = p.permissionid " +
            "WHERE rp.roleid = #{roleId}")
    List<Map<String, Object>> getPermissionInfo(@Param("roleId") Integer roleId);

    @Select("SELECT pa.* FROM permission p " +
            "INNER JOIN permission_action pa ON p.permissionid = pa.permissionid " +
            " WHERE p.permissionid = #{permissionId}")
    List<Map<String, Object>> getPermissionsActionsInfo(@Param("permissionId") Integer permissionId);


    @Select("SELECT p.* FROM role_permission rp " +
            "INNER JOIN permission p ON rp.permission_id = p.permission_id " +
            "WHERE rp.role_id = #{roleId}")
    List<Permission> getPermissionInfoByReact(@Param("roleId") Integer roleId);
}