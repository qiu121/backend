package com.github.qiu121.library.template;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.github.qiu121.library.constant.exception.EmBizError;
import lombok.Data;

import java.time.LocalDateTime;

@Data
public class ExceptionResponse implements IResponse {

    private Integer code;

    private String msg;

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    private LocalDateTime time;

    private ExceptionResponse(int code) {
        this.code = code;
        this.msg = "请求失败！";
        this.time = LocalDateTime.now();
    }

    public ExceptionResponse(int code, String msg) {
        this.code = code;
        this.msg = msg;
        this.time = LocalDateTime.now();
    }

    public ExceptionResponse(EmBizError emBizError) {
        this.code = emBizError.getErrCode();
        this.msg = emBizError.getErrMsg();
        this.time = LocalDateTime.now();
    }

}
