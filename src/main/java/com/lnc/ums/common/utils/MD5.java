package com.lnc.ums.common.utils;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class MD5 {

	public static String encode(String input) {

		String output = null;

		try {
			// 获得MD5摘要算法的 MessageDigest对象
			MessageDigest md = MessageDigest.getInstance("MD5");
			// 使用指定的字节更新摘要
			md.update(input.getBytes());
			// 获得密文
			byte b[] = md.digest();
			// 把密文转换成十六进制的字符串形式
			int i;
			StringBuffer buf = new StringBuffer();
			for (int offset = 0; offset < b.length; offset++) {
				i = b[offset];
				if (i < 0)
					i += 256;

				if (i < 16)
					buf.append("0");

				buf.append(Integer.toHexString(i));
			}

			output = buf.toString();
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}

		return output;
	}

}
