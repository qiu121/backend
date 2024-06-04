package com.moshu.trainplatform.mapper;

import java.util.Set;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.*;

import com.moshu.trainplatform.entity.Role;
import com.moshu.trainplatform.entity.UserRole;

@Mapper
public interface UserRoleMapper extends BaseMapper<UserRole> {

	@Select("select r.* from user_role ur join role r on r.role_id = ur.role_id where ur.user_id = #{userId}")
	public Role selectUserRole(@Param("userId")String userId);



	@Insert("insert into user_role (user_role_id, user_id, role_id) values (#{ur.userRoleId}, #{ur.userId}, #{ur.roleId})")
	public void insertUserRole(@Param("ur")UserRole ur);


}
