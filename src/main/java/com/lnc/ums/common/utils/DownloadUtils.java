package com.lnc.ums.common.utils;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletResponse;

public class DownloadUtils {

	/**
	 * 将文件名设置到响应头中
	 * 
	 * @param response
	 * @param fileName
	 */
	public static void fileNameToResponse(HttpServletResponse response, String fileName) {
		try {
			// 解决中文乱码
			fileName = new String(fileName.getBytes("GBK"), "ISO-8859-1");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}

		response.setCharacterEncoding("UTF-8");
		response.setContentType("multipart/form-data");
		response.setHeader("Content-Disposition", "attachment;fileName=" + fileName);
	}

}
