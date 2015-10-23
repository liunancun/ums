package com.lnc.ums.common.utils;

import java.sql.Timestamp;

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

}
