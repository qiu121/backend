package com.moshu.trainplatform.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.moshu.trainplatform.controller.api.query.UserInfoQuery;
import com.moshu.trainplatform.entity.UserInfo;

import java.util.List;

public interface UserService extends IService<UserInfo> {

	UserInfo getUserByUsername(String username);

	Integer updatePwd(String userId, String newPwd);
	UserInfo getUserInfoByUserId(String userId);

	String registerUser(String username, String password, String name,String email, String phone) throws Exception;


	int updateUserInfoByUserId(String userId, String name, String gender, String phone, String email);

	List<UserInfo> getAllUserInfo(UserInfoQuery userInfoQuery);
}
