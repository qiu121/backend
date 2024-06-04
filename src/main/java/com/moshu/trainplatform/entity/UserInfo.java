package com.moshu.trainplatform.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.io.Serializable;
import java.util.List;

@Data
@TableName("user_info")
public class UserInfo implements Serializable {
	private static final long serialVersionUID = -6335624718439370840L;

	@TableId
	private String userId;
	/**
	 * 用户名
	 */
	private String userName;
	/**
	 * 昵称
	 */
	private String name;
	/**
	 * 加密密码
	 */
	private String password;
	/**
	 * 加密随机盐值
	 */
	private String salt;
	/**
	 * 手机号
	 */
	private String phone;
	/**
	 * 邮箱
	 */
	private String email;
	/**
	 * 状态
	 */
	private int status;
	/**
	 * 性别
	 */
	private String gender;

	@TableField(exist = false)
	private Role role;

	@TableField(exist = false)
	private List<Permission> permissions;

}
