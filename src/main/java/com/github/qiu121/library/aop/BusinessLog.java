package com.github.qiu121.library.aop;

import java.lang.annotation.*;


/**
 * 业务日志
 *
 * @author admin
 */
@Inherited
@Retention(RetentionPolicy.RUNTIME)
@Target({ElementType.METHOD})
public @interface BusinessLog {

    /**
     * 执行的模块
     *
     * @return
     */
    String module();

}
