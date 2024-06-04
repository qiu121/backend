package com.moshu.trainplatform.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import lombok.Data;

import java.util.List;


@Data
public class Permission {
    @TableId
    private Integer permissionId;
    /**
     * 权限码
     */
    private String permissionCode;
    /**
     * 权限名
     */
    private String permissionName;
    /**
     * xxx
     */
    private String permissionEname;

    private String actionList;

    private String dataAccess;
    /**
     * 备注
     */
    private String remark;

    @TableField(exist = false)
    private List<PermissionAction> actionsList;
}
