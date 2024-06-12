package com.moshu.trainplatform.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

@Data
@TableName("user_info")
public class UserInfo implements Serializable {
	private static final long serialVersionUID = -6335624718439370840L;

	@TableId
	private String userId;

	private String userName;

	private String name;

	private String passWord;

	private String salt;

	private String phone;

	private String email;

	private int status;

	@JsonFormat(pattern="yyyy-MM-dd HH:mm:ss",timezone="GMT+8")
	private Date createdTime; // 创建时间

	@TableField(exist = false)
	private Integer roleId;

	@TableField(exist = false)
	private Role role;

	@TableField(exist = false)
	private List<Permission> permissions;

	@TableField(exist = false)
	private String oldPassWord; // 旧密码

}
