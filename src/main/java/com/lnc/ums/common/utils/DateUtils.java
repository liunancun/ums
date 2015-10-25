package com.lnc.ums.common.utils;

import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;

public class DateUtils {

	/**
	 * 获得当前时间
	 * 
	 * @return
	 */
	public static Timestamp currentTime() {

		long millis = System.currentTimeMillis();

		return new Timestamp(millis);
	}

	/**
	 * 时间类型转换成字符串
	 * 
	 * @param time
	 * @param format
	 * @return
	 */
	public static String toString(Timestamp time, String format) {

		DateFormat sdf = new SimpleDateFormat(format);

		return sdf.format(time);
	}

	/**
	 * 时间类型转换成字符串[yyyy-MM-dd HH:mm:ss]
	 * 
	 * @param time
	 * @return
	 */
	public static String toString(Timestamp time) {

		return toString(time, "yyyy-MM-dd HH:mm:ss");
	}

}
