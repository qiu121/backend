package com.moshu.trainplatform.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.moshu.trainplatform.controller.api.query.UserInfoQuery;
import com.moshu.trainplatform.entity.UserInfo;
import com.moshu.trainplatform.entity.UserRole;
import com.moshu.trainplatform.mapper.UserInfoMapper;
import com.moshu.trainplatform.mapper.UserRoleMapper;
import com.moshu.trainplatform.service.UserService;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.io.File;
import java.util.List;
import java.util.UUID;

@Service
@Transactional
public class UserServiceImpl extends ServiceImpl<UserInfoMapper, UserInfo> implements UserService {

	@Autowired
	UserInfoMapper userInfoMapper;

	@Autowired
	UserRoleMapper userRoleMapper;

	@Override
	public UserInfo getUserByUsername(String username) {
		LambdaQueryWrapper<UserInfo> queryWrapper = new LambdaQueryWrapper<>();
		queryWrapper.eq(UserInfo::getUserName, username);
		UserInfo user = userInfoMapper.selectOne(queryWrapper);
		if (user != null) {
			user.setRole(userRoleMapper.selectUserRole(user.getUserId()));
		}
		return user;
	}


	@Override
	public Integer updatePwd(String userId, String newPwd) {
		// 获取当前用户信息
		UserInfo userInfo = userInfoMapper.selectById(userId);

		String salt = UUID.randomUUID().toString();
		userInfo.setPassword(new SimpleHash("MD5", newPwd, userInfo.getUserName() + salt, 3).toString());
		userInfo.setSalt(salt);
		return  userInfoMapper.updateById(userInfo);
	}

	@Override
	public int updateUserInfoByUserId(String userId, String name, String gender, String phone, String email) {
		UserInfo userInfo = userInfoMapper.selectById(userId);
		userInfo.setName(name);
		userInfo.setGender(gender);
		userInfo.setPhone(phone);
		userInfo.setEmail(email);
		return userInfoMapper.updateById(userInfo);
	}

	@Override
	public UserInfo getUserInfoByUserId(String userId) {
		UserInfo userInfo = userInfoMapper.selectById(userId);
		userInfo.setUserName("");
		userInfo.setPassword("");
		userInfo.setSalt("");
		userInfo.setStatus(-1);
		return userInfo;
	}

	@Override
	@Transactional(rollbackFor = {Exception.class})
	public String registerUser(String username, String password, String name, String email, String phone)throws Exception {
		UserInfo user = new UserInfo();
		String userId = UUID.randomUUID().toString();
		user.setUserId(userId);
		user.setUserName(username);
		user.setName(name);
		String salt = UUID.randomUUID().toString();
		Object result = new SimpleHash("MD5", password, username + salt, 3);
		user.setPassword(result.toString());
		user.setSalt(salt);
		user.setStatus(1);
		user.setEmail(email);
		user.setPhone(phone);
		userInfoMapper.insert(user);



		UserRole ur = new UserRole();
		ur.setUserRoleId(UUID.randomUUID().toString());
		ur.setUserId(userId);
		ur.setRoleId(1);
        userRoleMapper.insertUserRole(ur);
//		userRoleService.save(ur);
		return userId;

	}
	@Override
	public List<UserInfo> getAllUserInfo(UserInfoQuery userInfoQuery) {
		return userInfoMapper.getAllUserInfo(userInfoQuery);
	}
	public static void main(String[] args) {
		Object pwd = new SimpleHash("MD5", "ms123ABC", "admin" + "7c19cffb-eafe-4489-a92b-bc1f2cde91de", 3);
		System.out.println(pwd.toString());

		System.out.println("File.separator = " + File.separator);
	}
}
