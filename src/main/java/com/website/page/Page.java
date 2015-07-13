package com.website.page;

import com.website.utils.Tools;

public class Page {
	//每页显示记录数，默认为10
	private int rows ;		
	//当前记录起始索引
	private int start;
	//总页数
	private int total;		
	//总记录数
	private int records;
	//当前页
	private int page;	
	//true:需要分页的地方，传入的参数就是Page实体；false:需要分页的地方，传入的参数所代表的实体拥有Page属性
	private boolean entityOrField;
	//private String pageStr;	//最终页面显示的底部翻页导航，详细见：getPageStr();
	//排序字段
	private String sidx;		
	//排序方式，是升序还是降序
	private String sord;		
	//查询限制条件
	private String whereinfo;
	//语言
	private String language;		
	//自定义属性1
	private int ncustom;
	//自定义属性2
	private String scustom;
	//自定义属性3
	private String scustom2;
		
	public int getNcustom() {
		return ncustom;
	}
	public void setNcustom(int ncustom) {
		this.ncustom = ncustom;
	}
	public String getScustom() {
		return scustom;
	}
	public void setScustom(String scustom) {
		this.scustom = scustom;
	}
	public String getLanguage() {
		return  Tools.isEmpty(language) ? "zh_CN" : language;
	}
	public void setLanguage(String language) {
		this.language = language;
	}
	public String getWhereinfo() {
		return  Tools.isEmpty(whereinfo) ? "" : whereinfo;
	}
	public void setWhereinfo(String whereinfo) {
		this.whereinfo = whereinfo;
	}
	public int getTotal() {
		if(records%rows == 0){
			total = records/rows;
		}else{
			total = records/rows+1;
		}
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public int getRecords() {
		return records;
	}
	public void setRecords(int records) {
		this.records = records;
	}
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public int getCurrentResult() {
		start = (getPage()-1)*getRows();
		if(start<0){
			start = 0;
		}
		return start;
	}
	public void setCurrentResult(int currentResult) {
		this.start = currentResult;
	}
	public boolean isEntityOrField() {
		return entityOrField;
	}
	public void setEntityOrField(boolean entityOrField) {
		this.entityOrField = entityOrField;
	}
	public int getRows() {
		return rows;
	}
	public void setRows(int rows) {
		this.rows = rows;
	}
	public int getStart() {
		return start;
	}
	public void setStart(int start) {
		this.start = start;
	}
	public String getSidx() {
		return sidx;
	}
	public void setSidx(String sidx) {
		this.sidx = sidx;
	}
	public String getSord() {
		return sord;
	}
	public void setSord(String sord) {
		this.sord = sord;
	}
	public String getScustom2() {
		return scustom2;
	}
	public void setScustom2(String scustom2) {
		this.scustom2 = scustom2;
	}
}