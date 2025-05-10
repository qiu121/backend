package com.github.qiu121.library.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import lombok.Data;

@Data
public class UserRole {
    @TableId
    private String userRoleId;

    private String userId;

    private Integer roleId;

    @TableField(exist = false)
    private Role role;

}
