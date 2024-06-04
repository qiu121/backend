package com.moshu.trainplatform.template;

import java.util.HashMap;
import java.util.Map;

public class SuccessResponse implements IResponse {
	
	private Integer code = 200;
	private Map<String, Object> data;
	
	private SuccessResponse() { }
	
	public SuccessResponse(int code) {
		this.code = code;
		this.data = new HashMap<>();
	}
	
	public SuccessResponse(int code, Map<String, Object> data) {
		this.code = code;
		this.data = data;
	}
	
	public void put(String key, Object value) {
		this.data.put(key, value);
	}
	
	public void remove(String key) {
		this.data.remove(key);
	}

	public Integer getCode() {
		return code;
	}
	
	public Map<String, Object> getData() {
		return data;
	}
	
}
