package com.se.util;


import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFFont;

import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.HSSFColor;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.util.CellRangeAddress;



public class ExcelUtil<T> {
	public HSSFCellStyle getCellStyle(HSSFWorkbook workbook,boolean isHeader){
        HSSFCellStyle style = workbook.createCellStyle();
        
        if (isHeader) {
            //style.setFillForegroundColor(HSSFColor.GREY_25_PERCENT.index);
            //style.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
        	//设置字体
            HSSFFont font = workbook.createFont();
            font.setFontName("宋体");
            font.setColor(HSSFColor.BLACK.index);
            font.setFontHeightInPoints((short) 20);
            font.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);//粗体显示
            style.setAlignment(HSSFCellStyle.ALIGN_CENTER); // 居中
            style.setFont(font);
            //设置边框
            style.setBorderBottom(HSSFCellStyle.BORDER_THIN);
            style.setBorderLeft(HSSFCellStyle.BORDER_THIN);
            style.setBorderRight(HSSFCellStyle.BORDER_THIN);
            style.setBorderTop(HSSFCellStyle.BORDER_THIN);
            
            //设置起始位置
            
            
        }else{
        	 //设置边框
            style.setBorderBottom(HSSFCellStyle.BORDER_THIN);
            style.setBorderLeft(HSSFCellStyle.BORDER_THIN);
            style.setBorderRight(HSSFCellStyle.BORDER_THIN);
            style.setBorderTop(HSSFCellStyle.BORDER_THIN);
            HSSFFont font = workbook.createFont();
            font.setFontName("宋体");
            font.setColor(HSSFColor.BLACK.index);
            font.setFontHeightInPoints((short) 12);
            style.setFont(font);
        }    
        return style;
    }
    
   
    public  void generateHeader(HSSFWorkbook workbook,HSSFSheet sheet,String[] headerColumns,String sheetName){
        //设置头信息样式
    	HSSFCellStyle headstyle = getCellStyle(workbook,true);
     
        
        //第1行为空行
    	 Row row0 = sheet.createRow(0);
         Cell cell0 = row0.createCell(0);
         cell0.setCellValue("");
        
         //第二行为头部信息
        CellRangeAddress cellRangeAddress = new CellRangeAddress(1, 1, 1, headerColumns.length);
        sheet.addMergedRegion(cellRangeAddress);
        
        Row row1 = sheet.createRow(1);
        Cell cell1 = row1.createCell(1);
        cell1.setCellValue("唐宫银匠--"+sheetName);
        
        for(int i=2;i<=headerColumns.length;i++){
        	
        	Cell cell = row1.createCell(i);     
            cell.setCellValue("");     
            cell.setCellStyle(headstyle);     
        }  
        
        row1.setHeightInPoints(25);
        cell1.setCellStyle(headstyle);
      
       
        
        HSSFCellStyle style = getCellStyle(workbook,false);
        Row row2 = sheet.createRow(2);
        //row.setHeightInPoints(25);
        for(int i=0;i<headerColumns.length;i++){
            Cell cell2 = row2.createCell(i+1);
            //String[] column = headerColumns[i].split("_#_");
            //sheet.setColumnWidth(i, Integer.valueOf(column[1]));
            cell2.setCellValue(headerColumns[i]);
            cell2.setCellStyle(style);
        }
    }    
    
    @SuppressWarnings({ "rawtypes", "unchecked" })
    public  HSSFSheet creatAuditSheet(HSSFWorkbook workbook,String sheetName,
            List<T> dataset,String[] headerColumns,String[] fieldColumns) throws NoSuchMethodException, IllegalAccessException, IllegalArgumentException, InvocationTargetException {
        
    	//设置sheet页名称
        HSSFSheet sheet = workbook.createSheet(sheetName);
        //sheet.protectSheet("1234");//设置Excel保护密码
        
        //设置头部信息
        generateHeader(workbook,sheet,headerColumns,sheetName);
        //设计样式
        HSSFCellStyle style = getCellStyle(workbook,false);
        SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        int rowNum = 2;
        for(T t:dataset){
            rowNum++ ;
            Row row = sheet.createRow(rowNum); 
            //row.setHeightInPoints(25);
            for(int i = 0; i < fieldColumns.length; i++){               
                String fieldName = fieldColumns[i] ;              
               
                String getMethodName = "get" + fieldName.substring(0,1).toUpperCase() + fieldName.substring(1);                   
                try {                    
                    Class clazz = t.getClass();
                    Method getMethod;
                    getMethod = clazz.getMethod(getMethodName, new Class[]{} );
                    Object value = getMethod.invoke(t, new Object[]{});
                    String cellValue = "";
                    if (value instanceof Date){
                        Date date = (Date)value;
                        cellValue = sd.format(date);
                    }else{ 
                        cellValue = null != value ? value.toString() : "";
                    }                    
                    Cell cell = row.createCell(i+1);
                    
                    cell.setCellStyle(style);
                    cell.setCellValue(cellValue);
                   
                } catch (Exception e) {
                    
                } 
            }            
        }
        return sheet;        
    }

}

	


