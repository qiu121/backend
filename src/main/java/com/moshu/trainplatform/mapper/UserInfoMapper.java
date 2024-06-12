package com.moshu.trainplatform.mapper;


import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.moshu.trainplatform.entity.query.UserInfoQuery;
import com.moshu.trainplatform.entity.UserInfo;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface UserInfoMapper extends BaseMapper<UserInfo> {

    List<UserInfo> getAllUserInfo(@Param("query") UserInfoQuery query);

    int getAllUserInfoCount(@Param("query") UserInfoQuery userInfoQuery);

}
