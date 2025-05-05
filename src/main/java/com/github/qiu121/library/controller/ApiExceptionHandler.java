package com.github.qiu121.library.controller;

import com.github.qiu121.library.constant.exception.BizException;
import com.github.qiu121.library.constant.exception.EmBizError;
import com.github.qiu121.library.template.ExceptionResponse;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;

@ControllerAdvice
public class ApiExceptionHandler {

    private static final Logger logger = LoggerFactory.getLogger(ApiExceptionHandler.class);

    @ExceptionHandler(value = BizException.class)
    @ResponseBody
    public ExceptionResponse exceptionHandler(BizException ex) {
        logger.error(ex.getMessage(), ex);
        // assert ex != null;
        return new ExceptionResponse(EmBizError.DUPLICATE_DATA_ERROR);
    }

    @ExceptionHandler(value = Exception.class)
    @ResponseBody
    public ExceptionResponse exceptionHandler(Exception ex) {
        logger.error(ex.getMessage(), ex);
        // assert ex != null;
        return new ExceptionResponse(EmBizError.UNKNOWN_ERROR);
    }

}