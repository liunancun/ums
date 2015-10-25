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

	/**
	 * 从Excel中读取数据
	 * 
	 * @param stream
	 * @return
	 * @throws IOException
	 */
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
				// 得到单元格中的数据
				data[j] = cell.getStringCellValue();
			}
			datas.add(data);
		}

		// 关闭工作薄
		workbook.close();

		return datas;
	}

	/**
	 * 将数据写入Excel中
	 * 
	 * @param title
	 * @param datas
	 * @param stream
	 * @throws IOException
	 */
	public static void write(String[] title, List<Object[]> datas, OutputStream stream) throws IOException {
		// 创建一个工作薄
		HSSFWorkbook workbook = new HSSFWorkbook();
		// 创建一个表格
		HSSFSheet sheet = workbook.createSheet();

		// 创建第一条表头记录
		HSSFRow row = sheet.createRow(0);
		HSSFCell cell = null;
		// 循环写入表头
		if (title != null) {
			HSSFCellStyle titleStyle = createTitleStyle(workbook);
			for (int i = 0; i < title.length; i++) {
				// 设置列宽
				sheet.setColumnWidth(i, 2560);
				// 创建表头中的每个单元格
				cell = row.createCell(i);
				// 为表头单元格设置样式
				cell.setCellStyle(titleStyle);
				// 把数据写入单元格
				cell.setCellValue(title[i]);
			}
		}

		// 循环往表格中写入数据
		if (datas != null) {
			int count = 0;
			HSSFCellStyle dataStyle = createDataStyle(workbook);
			for (Object[] data : datas) {
				// 循环创建每一条记录保存数据
				row = sheet.createRow(++count);
				// 循环创建单元格
				for (int i = 0; i < data.length; i++) {
					Object obj = data[i];
					if (obj != null) {
						cell = row.createCell(i);
						// 为数据单元格设置样式
						cell.setCellStyle(dataStyle);
						// 把数据写入单元格
						cell.setCellValue(String.valueOf(obj));
					}
				}
			}
		}

		// 将Excel数据写入到输出流
		workbook.write(stream);
		// 关闭工作薄
		workbook.close();
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
