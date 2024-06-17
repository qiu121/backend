package com.moshu.trainplatform.aop;

/**
 * 日志类型
 *
 * @author admin
 */
public class LogType {

    public static final String LOGIN_SUCCESSFUL = "用户登录";

    public static final String LOG_OUT = "退出登录";

    public static final String GET_USER_LOGIN_INFORMATION = "获取登录用户信息";

    public static final String QUERY_ALL_USER_INFORMATION = "查询所有用户信息";

    public static final String GET_USER_INFORMATION_BY_USER_ID = "根据用户ID获取用户信息";

    public static final String REGISTER_USER_INFORMATION = "注册用户信息";

    public static final String UPDATE_USER_BASIC_INFORMATION = "更新用户基本信息";

    public static final String CHANGE_ACCOUNT_PASSWORD = "修改账号密码";

    public static final String DELETE_USER_INFORMATION = "删除用户信息";

    public static final String FILE_UPLOAD = "文件上传";

    public static final String FILE_DELETION = "文件删除";

    public static final String GET_FILE_LIST = "获取文件列表";

    public static final String DOWNLOAD_FILE = "文件下载";

    //////////////////////////////////////////////////////实验记录
    public static final String LIST_RECORD = "查询所有用户的实验记录";
    public static final String GET_RECORD_USER_ID = "查询个人的实验记录";
    public static final String LIST_RECORD_DETAIL_USER_ID = "查询用户的的实验记录详情";
    public static final String ADD_RECORD = "新增实验记录";
    public static final String REMOVE_RECORD = "删除实验记录";
    public static final String UPDATE_RECORD = "修改实验记录";
    /////////////////////////////////////////////////////样本记录
    public static final String LIST_SAMPLE_RECORD_ID = "获取实验记录下的所有样本记录";
    public static final String ADD_SAMPLE = "新增样本记录";
    public static final String REMOVE_SAMPLE = "删除样本记录";
    public static final String UPDATE_SAMPLE = "修改样本记录";


    //////////////////////////////////////////////////////样本类型
    public static final String ADD_SAMPLE_TYPE = "新增样本类型";
    public static final String REMOVE_SAMPLE_TYPE = "删除样本类型";
    public static final String UPDATE_SAMPLE_TYPE = "修改样本类型";
    public static final String LIST_SAMPLE_TYPE = "获取所有样本类型";


}