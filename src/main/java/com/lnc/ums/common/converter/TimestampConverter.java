package com.lnc.ums.common.converter;

import java.sql.Timestamp;

import org.springframework.core.convert.converter.Converter;
import org.springframework.util.StringUtils;

public class TimestampConverter implements Converter<String, Timestamp> {

	private static final String DATE_FORMAT = "[0123456789]{4}-[0123456789]{1,2}-[0123456789]{1,2}";

	private static final String TIME_SUFFIX = " 00:00:00";

	@Override
	public Timestamp convert(String source) {

		// 为空直接返回
		if (StringUtils.isEmpty(source)) {
			return null;
		}

		// 日期格式需要补全时间
		if (source.matches(DATE_FORMAT)) {
			source += TIME_SUFFIX;
		}

		return Timestamp.valueOf(source);
	}

	public static void main(String[] args) {
		Timestamp.valueOf("2015-1-10 12:12:12");

		String str = "2015-1-1 ";

		System.out.println(str.matches("[0123456789]{4}-[0123456789]{1,2}-[0123456789]{1,2}"));

	}

}
