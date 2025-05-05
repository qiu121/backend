package com.github.qiu121.library.constant.exception;


// 包装器业务异常实现
public class BizException extends Exception implements CommonError {

    private CommonError commonError;

    // 直接接受EmBusinessError的传参用于构造业务异常
    public BizException(CommonError commonError) {
        super();
        this.commonError = commonError;
    }

    // 接收自定义errMsg的方式构造业务异常
    public BizException(CommonError commonError, String errMsg) {
        super();
        this.commonError = commonError;
        this.commonError.setErrMsg(errMsg);
    }

    @Override
    public int getErrCode() {
        return this.commonError.getErrCode();
    }

    @Override
    public String getErrMsg() {
        return this.commonError.getErrMsg();
    }

    @Override
    public CommonError setErrMsg(String errMsg) {
        this.commonError.setErrMsg(errMsg);
        return this;
    }
}