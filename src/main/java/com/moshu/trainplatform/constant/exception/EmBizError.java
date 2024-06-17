package com.moshu.trainplatform.constant.exception;


public enum EmBizError implements CommonError {

    // 10000 通用错误类型
    UNKNOWN_ERROR(10001,"未知错误！"),

    INVALID_PARAMETERS_ERROR(10002, "参数不合法！"),

    DUPLICATE_DATA_ERROR(10003, "重复数据！"),

    PARAMETER_VALIDATION_ERROR(10004, "参数校验错误！"),


    // 20000 文件方面错误
    FILE_UPLOAD_ERROR(20001, "文件上传错误！"),

    FILE_TYPE_ERROR(20002, "文件类型错误！"),

    FILE_MAX_SIZE_ERROR(20003, "文件大小超出最大值！"),

    FILE_MAX_ERROR(20004, "以达到最大文件值！"),

    FILE_ALREADY_EXISTS_ERROR(20005, "文件已存在！"),

    // 30000 用户相关的错误
    USER_PASSWORD_LENGTH_INSUFFICIENT(30001, "密码长度不足！"),

    USER_ALREADY_EXISTS(30002, "用户已存在！"),

    USER_INCORRECT_PASSWORD(30003, "密码错误！"),

    USER_TOO_MANY_FAILED_LOGIN_ATTEMPTS(30004, "登录失败次数过多，请稍后再试！"),

    USER_INCORRECT_USERNAME_OR_PASSWORD(30005, "账号或者密码错误!"),

    NOT_ALLOW(30006, "数据不为空，不允许操作！"),

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