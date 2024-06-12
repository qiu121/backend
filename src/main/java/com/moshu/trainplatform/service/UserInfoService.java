package com.moshu.trainplatform.service;


import com.baomidou.mybatisplus.extension.service.IService;
import com.moshu.trainplatform.entity.UserInfo;

public interface UserInfoService extends IService<UserInfo> {

	UserInfo getUserByUsername(String username);

	void resetPassWord(UserInfo userInfo, String newPassWord);

	void registerUser(UserInfo userInfo);

	void authRegisterUser(UserInfo userInfo);

	void delUserInfoByUserId(String userId);

}
