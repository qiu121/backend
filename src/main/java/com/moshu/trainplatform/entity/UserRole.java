package com.moshu.trainplatform.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import lombok.Data;

@Data
public class UserRole {

	private String userRoleId;

	private String userId;

	private Integer roleId;

	@TableField(exist = false)
	private Role role;

}
