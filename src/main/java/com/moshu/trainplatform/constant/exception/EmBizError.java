package com.moshu.trainplatform.constant.exception;


public enum EmBizError implements CommonError {
    //10000 通用错误类型
    UNKNOWN_ERROR(100001,"未知错误"),
    PARAMETER_VALIDATION_ERROR(100002,"参数不合法"),
    DUPLICATE_INSERT_ERROR(100003,"重复数据"),
    FILE_UPLOAD_ERROR(10004, "文件上传错误"),
    VALID_ERROR(10005, "参数校验错误"),
    MAX_NUMBER(10006,"数量达到上限"),

    //2000 用户信息相关错误
    USER_NOT_EXIST(20001,"用户不存在"),
    USER_LOGIN_FAIL(20002,"用户手机或密码不正确"),
    USER_NOT_LOGIN(20003,"用户还未登录"),
    USER_BINDING_ORGANIZATION(20004,"用户已绑定组织机构"),
    NO_PERMISSION(20005, "权限不足"),

    ERROR_OLD_PASSWORD(20006, "旧密码错误"),

    //3000
    // course  -lesson   -section
    // 课程     -课时      -小节
    EXIST_IN_COURSE_EXCEPTION(30001, "请先删除课程下所有班级,课时,小节及资源"),
    EXIST_IN_LESSON_EXCEPTION(30002, "请先删除课时下所有班级,小节及资源"),
    //    EXIST_IN_LESSON_EXCEPTION(30003, "请先删除课时下所有小节及资源"),
    EXIST_IN_SECTION_EXCEPTION(30003, "请先删除小节下所有资源"),

    // 4
    GROUP_EXIST_QUESTION_EXCEPTION(40001, "请先删除习题组下所有资源"),

    // 5
    GROUP_ID_EXIST_EXCEPTION(50001, "学校id已存在"),
    GROUP_NAME_EXIST_EXCEPTION(50002, "学校名称已存在"),
    GROUP_SUB_EXIST_EXCEPTION(50003, "学校下还有学院未删除"),
    ROLE_EXCEPTION(50004, "当前用户访问无对应角色权限"),

    INSTITUTE_CNAME_EXIST_EXCEPTION(50010, "学院名称已存在"),
    INSTITUTE_ENAME_EXIST_EXCEPTION(50011, "学院E名称已存在"),
    INSTITUTE_SUB_EXIST_EXCEPTION(50013, "学院下还有专业未删除"),

    MAJOR_CNAME_EXIST_EXCEPTION(50020, "专业中文名称已存在"),
    MAJOR_ENAME_EXIST_EXCEPTION(50021, "专业英文名称已存在"),

    RESOURCES_IN_USE(60001, "资源使用中"),
    RESOURCES_UPLOAD_FAILED(60002, "资源上传失败"),

    // questionTag
    QUESTION_TAG_IN_USE(70001, "习题标签名称或者代码已存在"),

    // knowledgePoint
    KNOWLEDGE_POINT_EXIST_SUB(80001, "该知识点存在子项"),
    // question
    QUESTION_IN_USE(90001, "习题使用中")
    ;

    private final int errCode;
    private String errMsg;

    EmBizError(int errCode, String errMsg) {
        this.errCode = errCode;
        this.errMsg = errMsg;
    }

    @Override
    public int getErrCode() {
        return this.errCode;
    }
    @Override
    public String getErrMsg() {
        return this.errMsg;
    }
    @Override
    public CommonError setErrMsg(String errMsg) {
        this.errMsg=errMsg;
        return this;
    }
}

