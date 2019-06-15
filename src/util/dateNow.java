package util;

import org.junit.Test;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Collections;
import java.util.Date;
import java.util.List;

public class dateNow {
    public static String getDateNow() {
        long l = System.currentTimeMillis();
        Date date = new Date(l);
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String formatdate = simpleDateFormat.format(date);
        return formatdate;
    }
    public static String getYearNow() {
        long l = System.currentTimeMillis();
        Date date = new Date(l);
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-DD HH");
        String formatdate = simpleDateFormat.format(date);
        return formatdate;
    }
    public static String getDiffTime(String time) {
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        long nd = 1000*24*60*60;//一天的毫秒数
        long nh = 1000*60*60;//一小时的毫秒数
        long nm = 1000*60;//一分钟的毫秒数
        long ns = 1000;//一秒钟的毫秒数
        long diff=0;
        //获得两个时间的毫秒时间差异
        try {
            diff = simpleDateFormat.parse(dateNow.getDateNow()).getTime() - simpleDateFormat.parse("2017-06-01 22:11:22").getTime();
        } catch (ParseException e) {
            e.printStackTrace();
        }
        long day = diff/nd;//计算差多少天
        long hour = diff%nd/nh;//计算差多少小时
        long min = diff%nd%nh/nm;//计算差多少分钟
        long sec = diff%nd%nh%nm/ns;//计算差多少秒//输出结果
        if (day != 0) {
            return Long.toString(day)+"天前回复";
        }
        if (hour != 0) {
            return Long.toString(hour)+"小时前回复";
        }
        if (min != 0) {
            return Long.toString(min)+"分前回复";
        }
        if (sec != 0) {
            return Long.toString(sec)+"秒前回复";
        }
        return null;
    }
}
