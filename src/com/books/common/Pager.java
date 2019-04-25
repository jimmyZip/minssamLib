package com.books.common;

import javax.servlet.http.HttpServletRequest;

public class Pager {
	private int currentPage = 1;
	private int totalRecord;
	private int pageSize;
	private int totalPage;
	private int blockSize;
	private int firstPage;
	private int lastPage;
	private int curPos;
	private int num;

	public void init(HttpServletRequest request,int totalRecord) {
		if (request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		this.totalRecord = totalRecord;
		pageSize = 10;
		totalPage = (int) Math.ceil((float) totalRecord / pageSize);
		blockSize = 10;
		firstPage = currentPage - (currentPage - 1) % blockSize;
		lastPage = firstPage + (blockSize - 1);
		curPos = (currentPage - 1) * pageSize;// currentPo
		num = totalRecord - curPos;
	}
	
	// Search 페이지에서 사용하는 Pager 초기화 메서드
	public void searchInit(int currentPage,int totalRecord) {
		this.currentPage = currentPage;
		if(totalRecord >1000) {
			this.totalRecord = 1000;
		}else {
			this.totalRecord = totalRecord;
		}
		
		pageSize = 10;
		totalPage = (int) Math.ceil((float) totalRecord / pageSize);
		blockSize = 10;
		firstPage = currentPage - (currentPage - 1) % blockSize;
		lastPage = firstPage + (blockSize - 1);
		curPos = (currentPage - 1) * pageSize;// currentPo
		num = totalRecord - curPos;
	}
	
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	public int getTotalRecord() {
		return totalRecord;
	}
	public void setTotalRecord(int totalRecord) {
		this.totalRecord = totalRecord;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public int getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	public int getBlockSize() {
		return blockSize;
	}
	public void setBlockSize(int blockSize) {
		this.blockSize = blockSize;
	}
	public int getFirstPage() {
		return firstPage;
	}
	public void setFirstPage(int firstPage) {
		this.firstPage = firstPage;
	}
	public int getLastPage() {
		return lastPage;
	}
	public void setLastPage(int lastPage) {
		this.lastPage = lastPage;
	}
	public int getCurPos() {
		return curPos;
	}
	public void setCurPos(int curPos) {
		this.curPos = curPos;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
}