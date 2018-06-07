package com.mypet.ssm.po;

import java.util.List;

/**
 * 宠物搜索结果
 * 假设数据格式为：
   {total:”2”,rows:[{“id”:”1”,”name”,”张三”},{“id”:”2”,”name”,”李四”}]}
 * @author Dan
 *
 */
public class PageResult {
	//总记录
	private long total;
	//查询结果list
	private List<?> rows;
	private int currentPage;
	//多少页
	private int row;
	public int getRow() {
		return row;
	}
	public void setRow(int row) {
		this.row = row;
	}
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	public long getTotal() {
		return total;
	}
	public void setTotal(long total) {
		this.total = total;
	}
	public List<?> getRows() {
		return rows;
	}
	public void setRows(List<?> rows) {
		this.rows = rows;
	}
	
}
