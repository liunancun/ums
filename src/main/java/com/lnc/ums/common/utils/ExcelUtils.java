package com.lnc.ums.common.utils;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.List;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.IndexedColors;

/**
 * Excel表格工具类
 * 
 * @author liunancun
 *
 */
public class ExcelUtils {

	public static List<Object[]> read(InputStream stream) throws IOException {
		// 定义需要返回的结果数据
		List<Object[]> datas = new ArrayList<Object[]>();

		// 根据输入流创建一个工作薄
		HSSFWorkbook workbook = new HSSFWorkbook(stream);
		// 得到第一个表格
		HSSFSheet sheet = workbook.getSheetAt(0);
		// 循环表格中的每一行
		for (int i = 1; i <= sheet.getLastRowNum(); i++) {
			// 得到一条记录
			HSSFRow row = sheet.getRow(i);
			// 循环一行中的每个单元格
			Object[] data = new Object[row.getLastCellNum()];
			for (int j = 0; j < row.getLastCellNum(); j++) {
				// 得到一个单元格
				HSSFCell cell = row.getCell(j);

				if (cell == null) {
					System.out.println(i + "-" + j);
				}

				// 得到单元格中的数据
				data[j] = cell.getStringCellValue();
			}
			datas.add(data);
		}

		// 关闭工作薄
		workbook.close();

		return datas;
	}

	public static void write() {

	}

	public static void imp(InputStream is) throws IOException {
		HSSFWorkbook workbook = new HSSFWorkbook(is);

		HSSFSheet sheet = workbook.getSheetAt(0);

		for (int r = 1; r <= sheet.getLastRowNum(); r++) {
			HSSFRow row = sheet.getRow(r);
			System.out.println(row.getCell(0).getStringCellValue());
		}

		workbook.close();
		is.close();
	}

	/**
	 * 导出Excel表格
	 * 
	 * @param title
	 * @param datas
	 * @param stream
	 */
	public static void export(String[] title, List<Object[]> datas, OutputStream stream) {

		// 声明一个工作薄
		HSSFWorkbook workbook = new HSSFWorkbook();
		// 创建一个表格
		HSSFSheet sheet = workbook.createSheet();

		// 创建表头
		HSSFRow row = sheet.createRow(0);
		HSSFCell cell = null;
		for (int i = 0; i < title.length; i++) {
			sheet.setColumnWidth(i, 2560);
			cell = row.createCell(i);
			cell.setCellStyle(createTitleStyle(workbook));
			cell.setCellValue(title[i]);
		}

		int count = 0;
		for (Object[] data : datas) {
			// 创建一条记录
			row = sheet.createRow(++count);
			for (int i = 0; i < data.length; i++) {
				Object obj = data[i];
				if (obj != null) {
					cell = row.createCell(i);
					cell.setCellValue(String.valueOf(obj));
				}
			}
		}

		try {
			workbook.write(stream);
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				workbook.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}

	/**
	 * 创建标题单元格样式
	 * 
	 * @param workbook
	 * @return
	 */
	public static HSSFCellStyle createTitleStyle(HSSFWorkbook workbook) {
		// 创建标题单元格样式
		HSSFCellStyle style = workbook.createCellStyle();
		// 设置居中
		style.setAlignment(HSSFCellStyle.ALIGN_CENTER);
		// 设置单元格边框
		style.setBorderTop(HSSFCellStyle.BORDER_THIN);
		style.setBorderBottom(HSSFCellStyle.BORDER_THIN);
		style.setBorderLeft(HSSFCellStyle.BORDER_THIN);
		style.setBorderRight(HSSFCellStyle.BORDER_THIN);
		// 设置单元格字体颜色
		style.setFillForegroundColor(IndexedColors.GREY_25_PERCENT.getIndex());
		// 设置单元格背景颜色
		style.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);

		// 创建标题单元格字体
		HSSFFont font = workbook.createFont();
		// 设置字体加粗
		font.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
		// 设置字体
		font.setFontName("黑体");
		// 设置字体大小
		font.setFontHeightInPoints((short) 12);
		style.setFont(font);

		return style;
	}

	/**
	 * 创建数据单元格样式
	 * 
	 * @param workbook
	 * @return
	 */
	public static HSSFCellStyle createDataStyle(HSSFWorkbook workbook) {
		// 创建数据单元格样式
		HSSFCellStyle style = workbook.createCellStyle();
		// 设置单元格边框
		style.setBorderTop(HSSFCellStyle.BORDER_THIN);
		style.setBorderBottom(HSSFCellStyle.BORDER_THIN);
		style.setBorderLeft(HSSFCellStyle.BORDER_THIN);
		style.setBorderRight(HSSFCellStyle.BORDER_THIN);

		// 创建数据单元格字体
		HSSFFont font = workbook.createFont();
		// 设置字体
		font.setFontName("仿宋_GB2312");
		style.setFont(font);

		return style;
	}

}
