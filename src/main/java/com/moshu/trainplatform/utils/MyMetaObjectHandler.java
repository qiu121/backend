package com.moshu.trainplatform.utils;



import com.baomidou.mybatisplus.core.handlers.MetaObjectHandler;
import lombok.extern.slf4j.Slf4j;
import org.apache.ibatis.reflection.MetaObject;
import org.springframework.stereotype.Component;

import java.time.LocalDateTime;

@Component //一定不要忘记把处理器加到IOC容器中
@Slf4j //开启Log4j日志
public class MyMetaObjectHandler implements MetaObjectHandler {
    //插入时的填充策略
    @Override
    public void insertFill(MetaObject metaObject) {
        log.info("start insert fill..");
        boolean createTime = metaObject.hasSetter("createTime");
        if (createTime) {
            //第一个参数 字段名
            //第二个参数 值
            //第三个参数 metaObject
//            this.setFieldValByName("createTime",new Date(),metaObject);
            this.setFieldValByName("createTime", LocalDateTime.now(),metaObject);
        }

        boolean updateTime = metaObject.hasSetter("updateTime");
        if (updateTime) {
            this.setFieldValByName("updateTime",LocalDateTime.now(),metaObject);
        }
    }

    @Override
    public void updateFill(MetaObject metaObject) {
        boolean updateTime = metaObject.hasSetter("updateTime");
        if (updateTime) {
            this.setFieldValByName("updateTime",LocalDateTime.now(),metaObject);
        }
    }
/*
    更新时的填充策略  已经在数据库字段设置 `update_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
    @Override
    public void updateFill(MetaObject metaObject) {
        log.info("start update fill..");
        boolean updateTime = metaObject.hasSetter("updateTime");
        if (updateTime) {
            this.setFieldValByName("updateTime",new Date(),metaObject);
        }
    }
*/
}
