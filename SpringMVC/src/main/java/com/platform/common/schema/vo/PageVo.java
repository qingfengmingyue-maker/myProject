package com.platform.common.schema.vo;


public class PageVo {
	private Integer sEcho;  //第几次请求的标志，虽然没什么用，但是最好有
	private int iColumns;
	private int iDisplayStart;
	private int iDisplayLength;
	
	public int getCurrentPageNum() {
		return iDisplayStart/iDisplayLength+1;
	}
	public void setCurrentPageNum(int currentPageNum) {
	}
	public Integer getsEcho() {
		return sEcho;
	}
	public void setsEcho(Integer sEcho) {
		this.sEcho = sEcho;
	}
	public int getiColumns() {
		return iColumns;
	}
	public void setiColumns(int iColumns) {
		this.iColumns = iColumns;
	}
	public int getiDisplayStart() {
		return iDisplayStart;
	}
	public void setiDisplayStart(int iDisplayStart) {
		this.iDisplayStart = iDisplayStart;
	}
	public int getiDisplayLength() {
		return iDisplayLength;
	}
	public void setiDisplayLength(int iDisplayLength) {
		this.iDisplayLength = iDisplayLength;
	}	
}