package com.github.qiu121.library.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import lombok.Data;

import java.util.List;


/**
 * 功能权限
 */
@Data
public class Permission {

    @TableId
    private Integer permissionId;

    private String permissionCode;

    private String permissionName;

    private String permissionEname;

    private String actionList;

    private String dataAccess;

    private String remark;

}
