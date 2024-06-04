package com.moshu.trainplatform.mapper;

import com.baomidou.mybatisplus.core.conditions.update.LambdaUpdateWrapper;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.moshu.trainplatform.controller.api.query.UserInfoQuery;
import org.apache.ibatis.annotations.*;

import com.moshu.trainplatform.entity.UserInfo;

import java.util.List;

@Mapper
public interface UserInfoMapper extends BaseMapper<UserInfo> {


    @Select("SELECT * " +
            "FROM user_info ui " +
            "INNER JOIN user_role ur on ur.user_id = ui.user_id " +
            "where ur.role_id = #{roleId}")
    List<UserInfo> getAllUserInfo(UserInfoQuery userInfoQuery);

}
