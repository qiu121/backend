package com.github.qiu121.library.constant.exception;


public interface CommonError {
    int getErrCode();

    String getErrMsg();

    CommonError setErrMsg(String errMsg);
}