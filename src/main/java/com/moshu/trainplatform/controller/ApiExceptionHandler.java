package com.moshu.trainplatform.controller;

import com.moshu.trainplatform.constant.exception.EmBizError;
import com.moshu.trainplatform.service.AlarmInfoService;
import com.moshu.trainplatform.template.ExceptionResponse;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;

@ControllerAdvice
public class ApiExceptionHandler {

    @Autowired
    private AlarmInfoService alarmInfoService;
	
    private static final Logger logger = LoggerFactory.getLogger(ApiExceptionHandler.class);

    @ExceptionHandler(value = Exception.class)
    @ResponseBody
    public ExceptionResponse exceptionHandler(Exception ex) {
    	logger.error(ex.getMessage(), ex);
        return new ExceptionResponse(EmBizError.UNKNOWN_ERROR);
    }

}