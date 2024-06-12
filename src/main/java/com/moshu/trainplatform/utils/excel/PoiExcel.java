package com.moshu.trainplatform.utils.excel;

import org.apache.poi.hssf.usermodel.*;
import org.apache.poi.hssf.util.HSSFColor;
import org.apache.poi.ss.usermodel.Cell;

import java.io.OutputStream;
import java.util.LinkedList;
import java.util.List;

public class PoiExcel {

    /**
     *导出excel
     * @param sheetName
     * @param heads  excel 表头
     * @param output
     */
    @SuppressWarnings("deprecation")
    public  void  getExcel(HSSFWorkbook wb,String  sheetName,int sheetNum,String[] heads,OutputStream  output){
//        HSSFWorkbook wb=new HSSFWorkbook();
        
        HSSFSheet sheet1=wb.createSheet();
        wb.setSheetName(sheetNum, sheetName);

        HSSFRow hssfrowHead = sheet1.createRow(0);

        // 设置表格默认列宽度为20个字节
        sheet1.setDefaultColumnWidth((short) 22);
        // 生成一个样式
        HSSFCellStyle style = wb.createCellStyle();
        style.setFillForegroundColor(HSSFColor.PALE_BLUE.index);
		style.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
		style.setBorderBottom(HSSFCellStyle.BORDER_THIN);
		style.setBorderLeft(HSSFCellStyle.BORDER_THIN);
		style.setBorderRight(HSSFCellStyle.BORDER_THIN);
		style.setBorderTop(HSSFCellStyle.BORDER_THIN);
		style.setAlignment(HSSFCellStyle.ALIGN_CENTER);

		// 生成一个字体
		HSSFFont font = wb.createFont();
		font.setColor(HSSFColor.BLACK.index);
		font.setFontHeightInPoints((short) 12);
		font.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
        // 把字体应用到当前的样式
		style.setFont(font);
        // 指定当单元格内容显示不下时自动换行
        style.setWrapText(true);
        // 输出excel 表头
        if (heads != null && heads.length > 0) {
            for (int h = 0; h < heads.length; h++) {
                HSSFCell hssfcell = hssfrowHead.createCell(h, Cell.CELL_TYPE_STRING);
                hssfcell.setCellStyle(style);
                hssfcell.setCellValue(heads[h]);
            }
        }

//        try  {
//            output.flush();
//            wb.write(output);
//            output.close();
//        }  catch  (IOException  e)  {
//            e.printStackTrace();
//            System.out.println( "Output  is  closed ");
//        }
    }
    @SuppressWarnings("deprecation")
    public  void  getBodyExcel(HSSFWorkbook wb,String  sheetName,int sheetNum,String[] heads,List<List<String>> result,OutputStream  output){
        HSSFSheet sheet1=wb.createSheet();
        wb.setSheetName(sheetNum, sheetName);

        HSSFRow hssfrowHead = sheet1.createRow(0);

        // 设置表格默认列宽度为20个字节
        sheet1.setDefaultColumnWidth((short) 20);
        // 生成一个样式
        HSSFCellStyle style = wb.createCellStyle();
        style.setFillForegroundColor(HSSFColor.PALE_BLUE.index);
		style.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
		style.setBorderBottom(HSSFCellStyle.BORDER_THIN);
		style.setBorderLeft(HSSFCellStyle.BORDER_THIN);
		style.setBorderRight(HSSFCellStyle.BORDER_THIN);
		style.setBorderTop(HSSFCellStyle.BORDER_THIN);
		style.setAlignment(HSSFCellStyle.ALIGN_CENTER);

		// 生成一个字体
		HSSFFont font = wb.createFont();
		font.setColor(HSSFColor.BLACK.index);
		font.setFontHeightInPoints((short) 12);
		font.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
        // 把字体应用到当前的样式
		style.setFont(font);
        // 指定当单元格内容显示不下时自动换行
        style.setWrapText(true);
//         输出excel 表头
        if (heads != null && heads.length > 0) {
            for (int h = 0; h < heads.length; h++) {
                HSSFCell hssfcell = hssfrowHead.createCell(h, Cell.CELL_TYPE_STRING);
                hssfcell.setCellStyle(style);
                hssfcell.setCellValue(heads[h]);
            }
        }
		// 遍历集合数据，产生数据行
		if (result != null) {
			int index = 1;
			for (List<String> m : result) {
//				System.out.println("数据"+JSON.toJSONString(m)+"#长度"+m.size());
				hssfrowHead = sheet1.createRow(index);
				int cellIndex = 0;
				for (int i = 0; i < m.size(); i++) {
//					System.out.println("每一行数据"+m.get(i));

					HSSFCell cell = hssfrowHead.createCell((short) cellIndex);
					cell.setCellValue(m.get(i));
					cellIndex++;
				}
				
				index++;
			}
		}
    }
    
    
    @SuppressWarnings("deprecation")
	public void exportExcel(String sheetName, String[] heads, int[] columnHiddens, List<String> requireds, List<LinkedList<String>> result, OutputStream  output){
        HSSFWorkbook wb=new HSSFWorkbook();
        HSSFSheet sheet1=wb.createSheet(sheetName);

        // 设置表格默认列宽度为20个字节
        sheet1.setDefaultColumnWidth((short) 20);
        // 生成一个样式
        HSSFCellStyle style = wb.createCellStyle();
        style.setFillForegroundColor(HSSFColor.PALE_BLUE.index);
		style.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
		style.setBorderBottom(HSSFCellStyle.BORDER_THIN);
		style.setBorderLeft(HSSFCellStyle.BORDER_THIN);
		style.setBorderRight(HSSFCellStyle.BORDER_THIN);
		style.setBorderTop(HSSFCellStyle.BORDER_THIN);
		style.setAlignment(HSSFCellStyle.ALIGN_CENTER);

		// 生成一个字体
		HSSFFont font = wb.createFont();
		font.setColor(HSSFColor.BLACK.index);
		font.setFontHeightInPoints((short) 12);
		font.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
		style.setFont(font);
		// 指定当单元格内容显示不下时自动换行
		style.setWrapText(true);

		HSSFCellStyle reStyle = wb.createCellStyle();
		reStyle.setFillForegroundColor(HSSFColor.PALE_BLUE.index);
		reStyle.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
		reStyle.setBorderBottom(HSSFCellStyle.BORDER_THIN);
		reStyle.setBorderLeft(HSSFCellStyle.BORDER_THIN);
		reStyle.setBorderRight(HSSFCellStyle.BORDER_THIN);
		reStyle.setBorderTop(HSSFCellStyle.BORDER_THIN);
		reStyle.setAlignment(HSSFCellStyle.ALIGN_CENTER);
		HSSFFont requiredFont = wb.createFont();
		requiredFont.setColor(HSSFColor.RED.index);
		requiredFont.setFontHeightInPoints((short) 12);
		requiredFont.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
		reStyle.setFont(requiredFont);

		// 内容
		HSSFCellStyle contentStyle = wb.createCellStyle();
		contentStyle.setAlignment(HSSFCellStyle.ALIGN_CENTER);

        // 输出excel 表头
		HSSFRow hssfrowHead = sheet1.createRow(0);
        if (heads != null && heads.length > 0) {
            for (int h = 0; h < heads.length; h++) {
                HSSFCell hssfcell = hssfrowHead.createCell(h, Cell.CELL_TYPE_STRING);
				if (requireds.contains(heads[h])) {
					hssfcell.setCellStyle(reStyle);
				} else {
					hssfcell.setCellStyle(style);
				}
                hssfcell.setCellValue(heads[h]);
            }
        }
		// 遍历集合数据，产生数据行
		if (result != null) {
			int index = 1;
			for (List<String> m : result) {
				hssfrowHead = sheet1.createRow(index);
				int cellIndex = 0;
				for (int i = 0; i < m.size(); i++) {
					HSSFCell cell = hssfrowHead.createCell((short) cellIndex);
					cell.setCellStyle(contentStyle);
					cell.setCellValue(m.get(i));
					cellIndex++;
				}
				index++;
			}
		}

		// 隐藏列
		if (columnHiddens != null) {
			for (int column : columnHiddens) {
				sheet1.setColumnHidden(column, true);
			}
		}

		try {
			output.flush();
			wb.write(output);
			output.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

    }
}