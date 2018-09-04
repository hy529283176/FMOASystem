package com.dick.util;

public class PageUtil {
	private Integer pageSize;//每页的条数
	private Integer totalCount;//总记录数
	private Integer currentPage;//当前页
	private Integer totalPage;//总页数
	public  Integer getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public Integer getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}
	public Integer getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	public Integer getTotalPage() {
		return totalPage = totalCount%pageSize==0?totalCount/pageSize:(totalCount/pageSize+1);
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
}
