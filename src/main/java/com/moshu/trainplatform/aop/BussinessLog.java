package com.moshu.trainplatform.aop;

import java.lang.annotation.*;


/**
 * 业务日志
 * @author admin
 *
 */
@Inherited
@Retention(RetentionPolicy.RUNTIME)
@Target({ElementType.METHOD})
public @interface BussinessLog {

	/**
	 * 执行的模块
	 * @return
	 */
    String module();
}
