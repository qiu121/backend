package com.github.qiu121.library.mapper;


import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.github.qiu121.library.entity.UserInfo;
import com.github.qiu121.library.entity.query.UserInfoQuery;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface UserInfoMapper extends BaseMapper<UserInfo> {

    List<UserInfo> getAllUserInfo(@Param("query") UserInfoQuery query);

    int getAllUserInfoCount(@Param("query") UserInfoQuery userInfoQuery);

}
