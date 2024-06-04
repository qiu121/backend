package com.moshu.trainplatform.constant.exception;


public interface CommonError {
    int getErrCode();
    String getErrMsg();
    CommonError setErrMsg(String errMsg);
}