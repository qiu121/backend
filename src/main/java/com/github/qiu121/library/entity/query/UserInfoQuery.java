package com.github.qiu121.library.entity.query;


import com.github.qiu121.library.entity.bo.PageAbleBO;
import lombok.Data;

import java.util.List;

@Data
public class UserInfoQuery extends PageAbleBO {

    private String userName; // 供应商账号

    private String name; // 供应商名称

    private String phone; // 电话

    private String email; // 邮箱

    private Integer status; // 状态

    private List<Integer> roleIds; // 权限id

    private String nowUserId; // 当前账号

}
