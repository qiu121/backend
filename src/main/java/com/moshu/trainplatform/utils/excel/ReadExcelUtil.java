package com.moshu.trainplatform.utils.excel;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFDateUtil;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

public class ReadExcelUtil {

	 //总行数
    private int totalRows = 0;  
    //总条数
    private int totalCells = 0; 
    //错误信息接收器
    private static String errorMsg;
    //构造方法
    public ReadExcelUtil(){}
    //获取总行数
    public int getTotalRows()  { return totalRows;} 
    //获取总列数
    public int getTotalCells() {  return totalCells;} 
    //获取错误信息
    public String getErrorInfo() { return errorMsg; }  
    
  /**
   * 验证EXCEL文件
   * @param filePath
   * @return
   */
  public static boolean validateExcel(String filePath){
        if (filePath == null || !(isExcel2003(filePath) ||isExcel2007(filePath))){  
            errorMsg = "文件名不是excel格式";  
            return false;  
        }  
        return true;
  }
    
  /**
   * 读EXCEL文件
   * @param fielName
   * @return
   */
  @SuppressWarnings("rawtypes")
public  List<Map<String,Object>> importExcel(String fileName,MultipartFile file,List keyList){
       //初始化   
      List<Map<String,Object>> customerList= new ArrayList<>();
       //初始化输入流
       InputStream is = null;  
       try{
          //验证文件名是否合格
          if(!validateExcel(fileName)){
              return null;
          }
          //根据文件名判断文件是2003版本还是2007版本
          boolean isExcel2003 = true; 
          if(isExcel2007(fileName)){
              isExcel2003 = false;  
          }
          //实例化输入流
          is = file.getInputStream();
          //根据excel里面的内容读取信息
          customerList = getExcelInfo(is, isExcel2003,keyList);
          is.close();
      }catch(Exception e){
          e.printStackTrace();
      } finally{
          if(is !=null)
          {
              try{
                  is.close();
              }catch(IOException e){
                  is = null;    
                  e.printStackTrace();  
              }
          }
      }
      return customerList;
  }
  
  /**
   * 根据excel里面的内容读取信息
   * @param is 输入流
   * @param isExcel2003 excel是2003还是2007版本
   * @return
   * @throws IOException
   */
  @SuppressWarnings("rawtypes")
public List<Map<String,Object>> getExcelInfo(InputStream is,boolean isExcel2003,List keyList){
      List<Map<String,Object>> customerList = new ArrayList<>();
       try{
           /** 根据版本选择创建Workbook的方式 */
           Workbook wb = null;
           //当excel是2003时
           if(isExcel2003){
               wb = new HSSFWorkbook(is); 
           }
           else{//当excel是2007时
               wb = new XSSFWorkbook(is);
           }
           //读取Excel里面的信息
//           if(wb.getNumberOfSheets()>1){
//        	   map.put("map1", readExcelValue(wb,0));
//        	   map.put("map2", readExcelValue(wb,1));
//           }else{
//        	   map.put("map1", readExcelValue(wb,0));
//           }
           customerList=readExcelValue(wb,0,keyList);
       }
       catch (IOException e)  {  
           e.printStackTrace();  
       }  
       return customerList;
  }
  
  /**
   * 读取Excel的信息
   * @param wb
   * @param 数据存放的key
   * @return
   */
  @SuppressWarnings("rawtypes")
private List<Map<String,Object>> readExcelValue(Workbook wb,int sheetNum,List keyList){
      //得到第一个shell
       Sheet sheet=wb.getSheetAt(sheetNum);
      //得到Excel的行数
       this.totalRows=sheet.getPhysicalNumberOfRows();
      //得到Excel的列数(前提是有行数)
       if(totalRows>=1 && sheet.getRow(0) != null){
           this.totalCells=sheet.getRow(0).getPhysicalNumberOfCells();
       }
       List<Map<String,Object>> mapList=new ArrayList<Map<String,Object>>();
       Map<String, Object> map;
      //循环Excel行数,从第二行开始。标题不入库
       for(int r=1;r<totalRows;r++){
           Row row = sheet.getRow(r);
           if (row == null) continue;
           map = new LinkedHashMap<>();
           //循环Excel的列
           SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
           for(int c = 0; c <this.totalCells; c++){    
               Cell cell = row.getCell(c);
               if (null != cell){
                   if (HSSFCell.CELL_TYPE_NUMERIC == cell.getCellType()) {//如果是时间格式
                       if (HSSFDateUtil.isCellDateFormatted(cell)) {
                           map.put(keyList.get(c).toString(),sdf.format(cell.getDateCellValue()));
                       }else{
                           row.getCell(c).setCellType(Cell.CELL_TYPE_STRING);//设置单元格的类型
                           map.put(keyList.get(c).toString(),cell.getStringCellValue());
                       }
                   }else{
                       row.getCell(c).setCellType(Cell.CELL_TYPE_STRING);//设置单元格的类型
                       map.put(keyList.get(c).toString(),cell.getStringCellValue());                	   
                   }
               } else {
                   map.put(keyList.get(c).toString(), "");
               }
           }
           mapList.add(map);
       }
       return mapList;
  }

	  // @描述：是否是2003的excel，返回true是2003 
	  public static boolean isExcel2003(String filePath)  {  
	       return filePath.matches("^.+\\.(?i)(xls)$");  
	   }  
	 
	  //@描述：是否是2007的excel，返回true是2007 
	  public static boolean isExcel2007(String filePath)  {  
	       return filePath.matches("^.+\\.(?i)(xlsx)$");  
	   } 
  
}