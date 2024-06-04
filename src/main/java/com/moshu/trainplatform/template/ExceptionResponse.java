package com.moshu.trainplatform.template;

public class ExceptionResponse implements IResponse {

	private Integer code;
	private Exception exception;
	
	private ExceptionResponse() { }
	
	public ExceptionResponse(int code, Exception exception) {
		this.code = code;
		this.exception = exception;
	}
	
	public Integer getCode() {
		return code;
	}
	
	public String getMessage() {
		return exception.getMessage();
	}
	
}
