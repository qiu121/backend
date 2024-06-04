package com.moshu.trainplatform.mapper;


import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.moshu.trainplatform.entity.Notification;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;
import java.util.Map;

@Mapper
public interface NotificationMapper extends BaseMapper<Notification> {

    @Select("SELECT n.*, ui1.`name` as fromName ,ui2.`name` as toName " +
            "from notification n " +
            "left join user_info ui1 on n.from_id = ui1.user_id " +
            "left join user_info ui2 on n.to_id = ui2.user_id " +
            "left join project p on n.project_id = p.id "
    )
    List<Notification> getAll();


    @Select("SELECT n.*, " +
            "p.name as projectName, p.code as projectCode, " +
            "ui1.`name` as fromName ,ui2.`name` as toName " +
            "from notification n " +
            "left join user_info ui1 on n.from_id = ui1.user_id " +
            "left join user_info ui2 on n.to_id = ui2.user_id " +
            "left join project p on n.project_id = p.id " +
            "where to_id = #{toId} " +
            "order by create_time desc"
    )
    List<Notification> getOwn(@Param("toId") String toId);

}
