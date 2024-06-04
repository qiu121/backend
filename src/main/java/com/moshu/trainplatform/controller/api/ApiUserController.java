package com.moshu.trainplatform.controller.api;

import com.alibaba.fastjson.JSONObject;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.moshu.trainplatform.constant.exception.EmBizError;
import com.moshu.trainplatform.controller.api.query.UserInfoQuery;
import com.moshu.trainplatform.entity.Permission;
import com.moshu.trainplatform.entity.Register;
import com.moshu.trainplatform.entity.UserInfo;
import com.moshu.trainplatform.entity.UserRole;
import com.moshu.trainplatform.mapper.UserRoleMapper;
import com.moshu.trainplatform.service.PermissionService;
import com.moshu.trainplatform.service.UserService;
import com.moshu.trainplatform.template.SuccessResponse;
import com.moshu.trainplatform.utils.Token;
import com.moshu.trainplatform.utils.UserUtil;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.ValueOperations;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/api/user")
public class ApiUserController {

    @Autowired
    private UserService userService;
    @Autowired
    RedisTemplate redisTemplate;

    @Autowired
    PermissionService permissionService;

    @Autowired
    Token token;
    @Autowired
    UserRoleMapper userRoleMapper;


    @GetMapping("updatePwd")
    @ResponseBody
    public SuccessResponse updatePwd(@RequestParam("oldPwd") String oldPwd,
                                     @RequestParam("newPwd") String newPwd,
                                     @RequestParam("confirmPassword") String confirmPassword) {

        UserInfo userInfo = UserUtil.getUserInfoByToken();
        Object result = new SimpleHash("MD5", oldPwd, userInfo.getUserName() + userInfo.getSalt(), 3);
        if (!userInfo.getPassword().equals(result.toString())) {
            return new SuccessResponse(EmBizError.ERROR_OLD_PASSWORD.getErrCode());
        }

        userService.updatePwd(userInfo.getUserId(), newPwd);
        return new SuccessResponse(200);
    }

    /**
     * 根据用户id获取用户信息
     *
     * @return
     */
    @GetMapping("findUserInfo")
    @ResponseBody
    public SuccessResponse findUserInfo() {
        ValueOperations<String, Object> ops = redisTemplate.opsForValue();
        UserInfo userInfo = (UserInfo) ops.get("userInfo:token:" + token.getToken());
        UserInfo user = userService.getUserInfoByUserId(userInfo.getUserId());
        SuccessResponse sp = new SuccessResponse(200);
        sp.put("user", user);
        return sp;
    }

    /**
     * 修改用户基本信息
     *
     * @param name
     * @param gender
     * @param phone
     * @param email
     * @return
     */
    @PostMapping("updateUserInfo")
    @ResponseBody
    public SuccessResponse updateUserInfo(@RequestParam("name") String name,
                                          @RequestParam("gender") String gender,
                                          @RequestParam("phone") String phone,
                                          @RequestParam("email") String email) {
        ValueOperations<String, Object> ops = redisTemplate.opsForValue();
        UserInfo userInfo = (UserInfo) ops.get("userInfo:token:" + token.getToken());
        userService.updateUserInfoByUserId(userInfo.getUserId(), name, gender, phone, email);
        SuccessResponse sp = new SuccessResponse(200);
        return sp;
    }

    /***
     * 测试获取用户信息（react）
     */
    @GetMapping("/getInfoByReact")
    @ResponseBody
    public SuccessResponse getInfoByReact() {
        UserInfo userInfo = UserUtil.getUserInfoByToken();

        // 获取用户权限
        // 添加角色
        Integer roleId = userInfo.getRole().getRoleId();

        // 获取当前权限的授权的功能
        List<Permission> permissionInfoList = permissionService.getPermissionInfoByReact(roleId);
        userInfo.setPermissions(permissionInfoList);

        SuccessResponse sr = new SuccessResponse(200);
        // 用户基本信息
        sr.put("userInfo", userInfo);
        // 用户权限信息
        return sr;
    }

    /***
     * 测试获取用户信息
     */
    @GetMapping("/getInfo")
    @ResponseBody
    public SuccessResponse getInfo() {
        ValueOperations<String, Object> ops = redisTemplate.opsForValue();
        System.out.println("token:" + token.getToken());
        UserInfo userInfo = (UserInfo) ops.get("userInfo:token:" + token.getToken());

        // 获取用户权限
        Integer roleId = userInfo.getRole().getRoleId();
        String roleName = userInfo.getRole().getRole();

        // 获取当前权限的授权的功能
        List<Map<String, Object>> PermissionInfoList = permissionService.getPermissionInfo(roleId);
        // 权限赋值
        JSONObject roleObj = new JSONObject();
        roleObj.put("id", userInfo.getUserId());
        roleObj.put("name", userInfo.getUserName());
        roleObj.put("describe", "");
        roleObj.put("status", 1);
        roleObj.put("creatorId", "system");
        roleObj.put("createTime", "1497160610259");
        roleObj.put("deleted", 0);

        // 开始赋予功能权限
        List<JSONObject> permissionsList = new ArrayList<>();
        for (Map<String, Object> permissionMap : PermissionInfoList) {
            JSONObject permissionsJson = new JSONObject();
            permissionsJson.put("roleId", roleName);
            permissionsJson.put("permissionId", permissionMap.get("permissionCode"));
            permissionsJson.put("permissionName", permissionMap.get("permissionName"));

            List<JSONObject> actionsList = new ArrayList<>();

            List<Map<String, Object>> permissionsActionsInfoList = (List<Map<String, Object>>) permissionMap.get("ActionsInfo");

            for (Map<String, Object> thisMap : permissionsActionsInfoList) {
                JSONObject actionsJson = new JSONObject();
                actionsJson.put("action", thisMap.get("actionCode"));
                actionsJson.put("defaultCheck", thisMap.get("defaultCheck"));
                actionsJson.put("describe", thisMap.get("describe"));
                actionsList.add(actionsJson);
            }

            permissionsJson.put("actions", actionsList);
            permissionsJson.put("actionEntitySet", actionsList);

            permissionsJson.put("actionList", (permissionMap.get("actionList") == null ? null : permissionMap.get("actionList")));
            permissionsJson.put("dataAccess", (permissionMap.get("dataAccess") == null ? null : permissionMap.get("dataAccess")));
            permissionsList.add(permissionsJson);
        }
        roleObj.put("permissions", permissionsList);

        SuccessResponse sr = new SuccessResponse(200);
        // 用户基本信息
        sr.put("userInfo", userInfo);
        // 用户权限信息
        sr.put("role", roleObj);
        return sr;
    }


    @PostMapping("register")
    @ResponseBody
    public SuccessResponse register(@RequestBody Register register) {
        UserInfo user = userService.getUserByUsername(register.getUserName());
        if (user != null) {
            return new SuccessResponse(1002);
        }
        String userId;
        try {
            userId = userService.registerUser(register.getUserName(), register.getPassword(), register.getName(), register.getEmail(), register.getPhone());
        } catch (Exception ex) {
            return new SuccessResponse(500);
        }

        SuccessResponse sp = new SuccessResponse(200);
        sp.put("userId", userId);
        return sp;
    }


    // account
    @PostMapping("getAllUserInfo")
    @ResponseBody
    public SuccessResponse getAllUserInfo(@RequestBody UserInfoQuery userInfoQuery) {
        userInfoQuery.setRoleId("1");
        List<UserInfo> result = userService.getAllUserInfo(userInfoQuery);
        SuccessResponse sp = new SuccessResponse(200);
        sp.put("result", result);
        return sp;
    }

    @PostMapping("delById")
    @ResponseBody
    public SuccessResponse delById(@RequestBody List<String> ids) {
        String id = ids.get(0);
        LambdaQueryWrapper<UserRole> wrapper = new LambdaQueryWrapper<>();
        wrapper.eq(UserRole::getUserId, id);
        userRoleMapper.delete(wrapper);
        userService.removeById(id);
        return new SuccessResponse(200);
    }
}




