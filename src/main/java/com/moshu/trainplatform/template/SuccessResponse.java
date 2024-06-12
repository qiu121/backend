package com.moshu.trainplatform.template;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.moshu.trainplatform.constant.exception.EmBizError;
import lombok.Data;

import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.Map;

@Data
public class SuccessResponse implements IResponse {
	
	private int code;

	private String msg;

	private Map<String, Object> data;

	@JsonFormat(pattern="yyyy-MM-dd HH:mm:ss",timezone="GMT+8")
	private LocalDateTime time;
	
	public SuccessResponse(int code) {
		this.code = code;
		this.msg = "请求成功！";
		this.data = new HashMap<>();
		this.time = LocalDateTime.now();
	}
	
	public SuccessResponse(int code, String msg) {
		this.code = code;
		this.msg = msg;
		this.data = new HashMap<>();
		this.time = LocalDateTime.now();
	}

	public SuccessResponse(EmBizError emBizError) {
		this.code = emBizError.getErrCode();
		this.msg = emBizError.getErrMsg();
		this.data = new HashMap<>();
		this.time = LocalDateTime.now();
	}

	public void put(String key, Object value) {
		this.data.put(key, value);
	}
	
}
