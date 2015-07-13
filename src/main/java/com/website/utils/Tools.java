package com.website.utils;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Random;

public class Tools {
	/**
	 * 检测字符串是否不为空(null,"","null")
	 * @param s
	 * @return 不为空则返回true，否则返回false
	 */
	public static boolean notEmpty(String s){
		return s!=null && !"".equals(s) && !"null".equals(s);
	}
	
	/**
	 * 检测字符串是否为空(null,"","null")
	 * @param s
	 * @return 为空则返回true，不否则返回false
	 */
	public static boolean isEmpty(String s){
		return s==null || "".equals(s) || "null".equals(s);
	}
	
	/**
	 * 如果为null则返回空
	 * @param s
	 * @return
	 */
	public static String isNull(String s){
		return (s==null || "null".equals(s)) ? "" : s;
	}
	
	/**
	 * 字符串转换为字符串数组
	 * @param str 字符串
	 * @param splitRegex 分隔符
	 * @return
	 */
	public static String[] str2StrArray(String str,String splitRegex){
		if(isEmpty(str)){
			return null;
		}
		return str.split(splitRegex);
	}
	
	/**
	 * 用默认的分隔符(,)将字符串转换为字符串数组
	 * @param str	字符串
	 * @return
	 */
	public static String[] str2StrArray(String str){
		return str2StrArray(str,",\\s*");
	}
	
	/**
	 * 按照yyyy-MM-dd HH:mm:ss的格式，字符串转日期
	 * @param date
	 * @return
	 */
	public static Date strToDate(String date){
		if(notEmpty(date)){
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			try {
				return format.parse(date);
			} catch (ParseException e) {
				e.printStackTrace();
			}
			return new Date();
		}else{
			return null;
		}
	}
	
	/**
	 * 按照yyyy-MM-dd HH:mm:ss的格式，字符串转日期
	 * @param date
	 * @return
	 */
	public static Date strToDateDay(String date){
		if(notEmpty(date)){
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
			try {
				return format.parse(date);
			} catch (ParseException e) {
				e.printStackTrace();
			}
			return new Date();
		}else{
			return null;
		}
	}
	/**
	 * 按照参数format的格式，日期转字符串
	 * @param date
	 * @param format
	 * @return
	 */
	public static String dateToStr(Date date,String format){
		if(date!=null){
			SimpleDateFormat sdf = new SimpleDateFormat(format);
			return sdf.format(date);
		}else{
			return "";
		}
	}
	
	/**
	 * 按照yyyy-MM-dd HH:mm:ss的格式，日期转字符串
	 * @return yyyy-MM-dd HH:mm:ss
	 */
	public static String getDate(){
		return dateToStr(new Date(),"yyyy-MM-dd HH:mm:ss");
	}
	
	/**
	 * 按照yyyy-MM-dd的格式，日期转字符串
	 * @return yyyy-MM-dd
	 */
	public static String getDay(){
		return dateToStr(new Date(),"yyyy-MM-dd");
	}
	
	/**
	 * 按照yyyyMMddhhmmss的格式，日期转字符串
	 * @return yyyyMMddhhmmss
	 */
	public static String getMsec(){
		return dateToStr(new Date(),"yyyyMMddhhmmss");
	}
	
	/**
	 * 获取有效时间范围内的时间
	 * @param date
	 * @return
	 */
	public static List<String> getRangeMonth(int range){
		List<String> dateList = new ArrayList<String>();
		if(range > 0){
			range++;
			SimpleDateFormat sdf=new SimpleDateFormat("yyyyMM");
	        for(int i  = 1 ; i < range;i++){
	        	Calendar rightNow = Calendar.getInstance();
	        	 //rightNow.add(Calendar.YEAR,-1);//日期减1年
		        rightNow.add(Calendar.MONTH,-i);//日期加3个月
		        //rightNow.add(Calendar.DAY_OF_YEAR,1);//日期加10天
		        Date cMonth=rightNow.getTime();
		        String reStr = sdf.format(cMonth);
		        dateList.add(reStr);
	        }
		}
		return dateList;
	}
	
	/**
	 * 返回jsonarray格式的字符串
	 * @param arrayStr
	 * @return
	 */
	public static String getArrayStr(String arrayStr){
		if(notEmpty(arrayStr)){
			if(arrayStr.indexOf("[") == -1){
				arrayStr = "[\"" + arrayStr + "\"]"; 
			}
		}
		return arrayStr;
	}
	
	/**
	 * 生成有效范围内的随机数
	 * @param start	起始值
	 * @param end		结束值
	 * @return
	 */
	public static int extRandom(int start, int end){
	    return Integer.parseInt(new java.text.DecimalFormat("0").format(Math.floor(Math.random() * (end - start) + start)));
	}
	
	/**
	 *  补零
	 *  0 代表前面补充0
	 *  len 代表长度
	 *  d 代表参数为正数型
	 * @param len
	 * @param val
	 * @return
	 */
	public static String zeroFill(String len,int val){
		return String.format("%0"+len+"d", val);      
	}
	
	/**
	 * 填充空白
	 * @param str
	 * @param strLength
	 * @return
	 */
	public static String blankSpaceFill(String str, int strLength) {
		int strLen = str.length();
		if (strLen < strLength) {
			while (strLen < strLength) {
				StringBuffer sb = new StringBuffer();
				// sb.append("0").append(str);// 左补0
				sb.append(str).append(" ");// 右补空格
				str = sb.toString();
				strLen = str.length();
			}
		}
		return str;
	}
	
	/**
	 * 格式化系统后台输出日志
	 * @param log
	 */
	public static String extLog(String log){
		return "ext_log - "+log;
	}
	
	/**
	 * 生成有效范围内的随机数，格式为大小写字母和数字的组合
	 * @param start	起始值
	 * @param end		结束值
	 * @return
	 */
	public static String extRandomStr(int start, int end){
		String rStr = "";
		int rCount = extRandom(start,end+1);
		for(int i = 0; i< rCount ; i++){
			rStr += randomChar();
		}
	    return rStr;
	}
	private static char randomChar(){
		Random r = new Random();
		String s = "AaBbCcDdEeFfGgHhIiJjKkLMmNnPpRrSsTtUuVvWwXxYyZz0123456789";
		return s.charAt(r.nextInt(s.length()));
	}
	
	/**
	 * 计算两个日期相隔的小时数
	 * @param beginDate			开始日期
	 * @param endDate	结束日期
	 * @return
	 */
    public static int timeoutHour(String beginDate,String endDate){
    	Date dFirstDate = strToDate(beginDate);
    	Date dSecondDate = strToDate(endDate);
    	int hour = (int)((dSecondDate.getTime() - dFirstDate.getTime())/(60*60*1000));//取得小时数
        //DecimalFormat df = new DecimalFormat("0.0");//格式化小数，不足的补0
        //String dHour = df.format(hour/60);//返回的是String类型的
        return hour;  
    }
    
    /**
     * 判断是否为周末
     * @param sDate	字符串日期
     * @return
     */
    public static boolean isWeekend(String sDate){
		boolean flag = false;
		if(notEmpty(sDate)){
			DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
			Date bdate;
			try {
				bdate = format.parse(sDate);
				Calendar cal = Calendar.getInstance();
				cal.setTime(bdate);
				if (cal.get(Calendar.DAY_OF_WEEK) == Calendar.SATURDAY
						|| cal.get(Calendar.DAY_OF_WEEK) == Calendar.SUNDAY) {
					flag = true;
				}
			} catch (ParseException e) {
				e.printStackTrace();
			}
		}
		return flag;
    }
    
}
