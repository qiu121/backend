package com.moshu.trainplatform.dto;


import lombok.Data;

@Data
public class UserInfoDTO {

    private String userId;

    private String oldPwd; // 旧密码

    private String newPwd; // 新密码

}
