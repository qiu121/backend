package com.github.qiu121.library.controller.api;

import com.baomidou.mybatisplus.core.conditions.update.LambdaUpdateWrapper;
import com.baomidou.mybatisplus.core.toolkit.StringUtils;
import com.github.qiu121.library.aop.BusinessLog;
import com.github.qiu121.library.aop.LogType;
import com.github.qiu121.library.constant.enumConstant.EmRoleType;
import com.github.qiu121.library.constant.exception.EmBizError;
import com.github.qiu121.library.dto.UserInfoDTO;
import com.github.qiu121.library.entity.Permission;
import com.github.qiu121.library.entity.UserInfo;
import com.github.qiu121.library.entity.UserRole;
import com.github.qiu121.library.entity.query.UserInfoQuery;
import com.github.qiu121.library.mapper.UserInfoMapper;
import com.github.qiu121.library.service.PermissionService;
import com.github.qiu121.library.service.RoleService;
import com.github.qiu121.library.service.UserInfoService;
import com.github.qiu121.library.service.UserRoleService;
import com.github.qiu121.library.template.SuccessResponse;
import com.github.qiu121.library.utils.UserUtil;
import org.apache.shiro.authz.annotation.Logical;
import org.apache.shiro.authz.annotation.RequiresRoles;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/api/user")
public class ApiUserController {

    @Autowired
    private UserInfoService userInfoService;

    @Autowired
    private RoleService roleService;

    @Autowired
    private UserRoleService userRoleService;

    @Autowired
    private UserInfoMapper userInfoMapper;

    @Autowired
    PermissionService permissionService;

    /***
     * 获取登录用户信息
     */
    @GetMapping("/getInfoByReact")
    @BusinessLog(module = LogType.GET_USER_LOGIN_INFORMATION)
    @ResponseBody
    public SuccessResponse getInfoByReact() {
        UserInfo userInfo = UserUtil.getUserInfoByToken();
        // 获取用户权限、添加角色
        Integer roleId = userInfo.getRole().getRoleId();
        // 获取当前权限的授权的功能
        List<Permission> permissionInfoList = permissionService.getPermissionInfoByReact(roleId);
        userInfo.setPermissions(permissionInfoList);
        userInfo.setPassWord("");
        userInfo.setSalt("");
        SuccessResponse sr = new SuccessResponse(200);
        // 用户基本信息
        sr.put("userInfo", userInfo);
        // 用户权限信息
        return sr;
    }

    /**
     * 查询
     * 所有用户信息
     */
    @PostMapping("getAllUserInfo")
    @BusinessLog(module = LogType.QUERY_ALL_USER_INFORMATION)
    @RequiresRoles(value = {"admin", "maintain"}, logical = Logical.OR)
    @ResponseBody
    public SuccessResponse getAllUserInfo(@RequestBody UserInfoQuery userInfoQuery) {
        // 分页
        userInfoQuery.setCurrentPage((userInfoQuery.getCurrentPage() - 1) * userInfoQuery.getPageSize());
        userInfoQuery.setNowUserId(UserUtil.getUserInfoByToken().getUserId());

        List<UserInfo> userInfoList = userInfoMapper.getAllUserInfo(userInfoQuery);
        for (UserInfo userInfo : userInfoList) {
            UserRole userRole = userRoleService.getUserRoleByUserId(userInfo.getUserId());
            userInfo.setRole(userRole.getRole());
        }

        SuccessResponse sr = new SuccessResponse(200);
        sr.put("userInfoList", userInfoList);
        sr.put("total", userInfoMapper.getAllUserInfoCount(userInfoQuery));
        return sr;
    }

    /**
     * 根据用户id获取用户信息
     *
     * @return
     */
    @GetMapping("getUserInfoByUserId")
    @BusinessLog(module = LogType.GET_USER_INFORMATION_BY_USER_ID)
    @ResponseBody
    public SuccessResponse getUserInfoByUserId(@RequestParam String userId) {
        UserInfo atUserInfo = UserUtil.getUserInfoByToken();
        // 用户
        if (StringUtils.isBlank(userId)) {
            userId = atUserInfo.getUserId();
        }
        if (UserUtil.isRole(EmRoleType.USER.toString())) {
            userId = atUserInfo.getUserId();
        }

        UserInfo userInfo = userInfoService.getById(userId);
        userInfo.setRoleId(userRoleService.getUserRoleByUserId(userId).getRoleId());
        userInfo.setPassWord("");
        SuccessResponse sp = new SuccessResponse(200);
        sp.put("userInfo", userInfo);
        return sp;
    }

    /**
     * 注册
     * 用户基本信息
     */
    @PostMapping("registerUser")
    @BusinessLog(module = LogType.REGISTER_USER_INFORMATION)
    @RequiresRoles(value = {"admin", "maintain"}, logical = Logical.OR)
    @ResponseBody
    public SuccessResponse registerUser(@RequestBody UserInfo userInfo) {
        // 判断密码
        if (userInfo.getPassWord().length() < 8) {
            return new SuccessResponse(EmBizError.USER_PASSWORD_LENGTH_INSUFFICIENT);
        }
        // 判断账号是否存在
        if (userInfoService.getUserByUsername(userInfo.getUserName()) != null) {
            return new SuccessResponse(EmBizError.USER_ALREADY_EXISTS);
        }

        userInfoService.registerUser(userInfo);
        return new SuccessResponse(200);
    }

    /**
     * 修改
     * 用户基本信息
     */
    @PostMapping("modifyUserInfo")
    @BusinessLog(module = LogType.UPDATE_USER_BASIC_INFORMATION)
    @Transactional(rollbackFor = Exception.class)
    @ResponseBody
    public SuccessResponse modifyUserInfo(@RequestBody UserInfo userInfo) {
        // 管理员直接改
        if (UserUtil.isRole(EmRoleType.ADMIN.toString()) && StringUtils.isNotBlank(userInfo.getUserId())) {
            // 更新基本信息
            UserInfo modifyUserInfo = userInfoService.getById(userInfo.getUserId());
            modifyUserInfo.setName(userInfo.getName());
            modifyUserInfo.setStatus(userInfo.getStatus());
            modifyUserInfo.setPhone(userInfo.getPhone());
            modifyUserInfo.setEmail(userInfo.getEmail());
            userInfoService.updateById(modifyUserInfo);

            // 判断是否修改用户账号
            if (StringUtils.isNotBlank(userInfo.getPassWord())) {
                if (userInfo.getPassWord().length() < 8) {
                    return new SuccessResponse(EmBizError.USER_PASSWORD_LENGTH_INSUFFICIENT);
                }
                if (!userInfo.getUserName().equals(modifyUserInfo.getUserName())) {
                    // 判断账号是否存在
                    if (userInfoService.getUserByUsername(userInfo.getUserName()) != null) {
                        return new SuccessResponse(EmBizError.USER_ALREADY_EXISTS);
                    }
                }
                modifyUserInfo.setUserName(userInfo.getUserName());
                userInfoService.resetPassWord(modifyUserInfo, userInfo.getPassWord());
            }

            if (userInfo.getRoleId() != null && UserUtil.isRole(EmRoleType.ADMIN.toString())) {
                LambdaUpdateWrapper<UserRole> updateWrapper = new LambdaUpdateWrapper<>();
                updateWrapper.set(UserRole::getRoleId, userInfo.getRoleId());
                updateWrapper.eq(UserRole::getUserId, userInfo.getUserId());
                userRoleService.update(updateWrapper);
            }
        } else {
            UserInfo modifyUserInfo = UserUtil.getUserInfoByToken();
            modifyUserInfo.setName(userInfo.getName());
            modifyUserInfo.setPhone(userInfo.getPhone());
            modifyUserInfo.setEmail(userInfo.getEmail());
            userInfoMapper.updateById(modifyUserInfo);
            // 不为空就更新密码
            if (StringUtils.isNotBlank(userInfo.getPassWord())) {
                // 判断密码
                if (userInfo.getPassWord().length() < 8) {
                    return new SuccessResponse(EmBizError.USER_PASSWORD_LENGTH_INSUFFICIENT);
                }

                // 判断旧密码是否正确
                Object pwd = new SimpleHash("MD5", userInfo.getOldPassWord(), modifyUserInfo.getUserName() + modifyUserInfo.getSalt(), 3);
                if (!pwd.toString().equals(modifyUserInfo.getPassWord())) {
                    return new SuccessResponse(EmBizError.USER_INCORRECT_PASSWORD);
                }

                userInfoService.resetPassWord(modifyUserInfo, userInfo.getPassWord());
            }
        }
        return new SuccessResponse(200);
    }

    /**
     * 用户、管理员
     * 修改密码
     */
    @PostMapping("resetPassWord")
    @BusinessLog(module = LogType.CHANGE_ACCOUNT_PASSWORD)
    @ResponseBody
    public SuccessResponse resetPassWord(@RequestBody UserInfoDTO userInfoDTO) {
        // 当前登录用户信息
        UserInfo userInfo = UserUtil.getUserInfoByToken();
        if (UserUtil.isRole(EmRoleType.USER.toString())) {
            Object result = new SimpleHash("MD5", userInfoDTO.getOldPwd(), userInfo.getUserName() + userInfo.getSalt(), 3);
            if (!userInfo.getPassWord().equals(result.toString())) {
                return new SuccessResponse(EmBizError.USER_INCORRECT_PASSWORD);
            }
        }

        // 管理员直接改
        if (UserUtil.isRole(EmRoleType.ADMIN.toString())) {
            userInfo = userInfoMapper.selectById(userInfoDTO.getUserId());
        }

        userInfoService.resetPassWord(userInfo, userInfoDTO.getNewPwd());
        return new SuccessResponse(200);
    }

    /**
     * 管理员
     * 删除用户信息
     */
    @GetMapping("delUserInfoByUserId")
    @RequiresRoles(value = {"admin", "maintain"}, logical = Logical.OR)
    @BusinessLog(module = LogType.DELETE_USER_INFORMATION)
    @ResponseBody
    public SuccessResponse delUserInfoByUserId(@RequestParam String userId) {
        // TODO 需要判断是否有数据
        userInfoService.delUserInfoByUserId(userId);
        return new SuccessResponse(200);
    }

}
