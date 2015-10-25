package com.lnc.ums.common.utils;

import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;

public class DateUtils {

	/**
	 * 获取当前时间
	 * 
	 * @return
	 */
	public static Timestamp currentTime() {

		long millis = System.currentTimeMillis();

		return new Timestamp(millis);
	}

	/**
	 * 时间类型转换成字符串[yyyy-MM-dd HH:mm:ss]
	 * 
	 * @param time
	 * @return
	 */
	public static String toString(Timestamp time) {

		DateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

		return sdf.format(time);
	}

}
