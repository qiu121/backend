package com.moshu.trainplatform.controller;

import com.moshu.trainplatform.constant.exception.EmBizError;
import com.moshu.trainplatform.template.ExceptionResponse;
import com.moshu.trainplatform.template.SuccessResponse;
import lombok.extern.slf4j.Slf4j;
import org.apache.shiro.authz.UnauthorizedException;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestControllerAdvice;

import java.util.Map;

import static com.moshu.trainplatform.constant.exception.EmBizError.ROLE_EXCEPTION;

@RestControllerAdvice
@Slf4j
public class ApiExceptionHandler {

    @ExceptionHandler(org.springframework.dao.DuplicateKeyException.class)
    public SuccessResponse handleException(DuplicateKeyException e) {
        log.error(e.getMessage(), e);
        return new SuccessResponse(EmBizError.DUPLICATE_INSERT_ERROR.getErrCode(), Map.of("message",e.getMessage()));
    }

    @ExceptionHandler(org.apache.shiro.authz.UnauthorizedException.class)
    public ExceptionResponse handleException(UnauthorizedException e) {
        log.error(e.getMessage(), e);
        return new ExceptionResponse(ROLE_EXCEPTION.getErrCode(), e);
    }


    @ExceptionHandler(value = RuntimeException.class)
    @ResponseBody
    public ExceptionResponse exceptionHandler(Exception ex) {
        log.error(ex.getMessage(), ex);
        return new ExceptionResponse(500, ex);
    }

}