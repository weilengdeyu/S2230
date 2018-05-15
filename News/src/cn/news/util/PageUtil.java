package cn.news.util;

import java.util.List;

import cn.news.entity.UserInfo;

/**2018年5月12日*/
public class PageUtil {
   //当前页面
	private int pageIndex;
	
  //每页显示的记录数
	private int pageSize;
	
  //总记录数
	private int totalRecords;
  //总页数
	private int totalPages;
  //数据本身
	private List<UserInfo> list;
	public int getPageIndex() {
		return pageIndex;
	}
	public void setPageIndex(int pageIndex) {
		this.pageIndex = pageIndex;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public int getTotalRecords() {
		return totalRecords;
	}
	public void setTotalRecords(int totalRecords) {
		this.totalRecords = totalRecords;
	}
	public int getTotalPages() {
		return totalPages;
	}
	public void setTotalPages(int totalPages) {
		this.totalPages = totalPages;
	}
	public List<UserInfo> getList() {
		return list;
	}
	public void setList(List<UserInfo> list) {
		this.list = list;
	}
	
}
