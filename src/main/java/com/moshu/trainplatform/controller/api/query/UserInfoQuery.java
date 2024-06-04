package com.moshu.trainplatform.controller.api.query;


import lombok.Data;

@Data
public class UserInfoQuery {
    private String userName;

    private String name;

    private Integer status;

    private String roleId;

    private String groupId;

    private String instituteId;

    private String majorId;
}
