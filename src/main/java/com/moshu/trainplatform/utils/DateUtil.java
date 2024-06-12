package com.moshu.trainplatform.utils;


import com.moshu.trainplatform.constant.Constant;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.TimeZone;

public class DateUtil {

    //将date转化为datetime
    public static java.sql.Timestamp date2timestamp(Date d) {
        if (null == d)
            return null;
        return new java.sql.Timestamp(d.getTime());
    }

    //将datetime转化为date
    public static Date timestamp2date(java.sql.Timestamp t) {
        if (null == t)
            return null;
        return new Date(t.getTime());
    }

    public static Date dateFromStringWithFormat(String dateString, String format) throws ParseException {
        var dateFormatter = new SimpleDateFormat(format);//注意月份是MM
        dateFormatter.setTimeZone(TimeZone.getTimeZone(Constant.serverTimezone));
        return dateFormatter.parse(dateString);
    }
      public static String stringFromDate(Date date) {
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String dateString = formatter.format(date);
        return dateString;
    }

}
