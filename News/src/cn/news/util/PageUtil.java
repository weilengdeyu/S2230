package cn.news.util;

import java.util.List;

import cn.news.entity.UserInfo;

/**2018��5��12��*/
public class PageUtil {
   //��ǰҳ��
	private int pageIndex;
	
  //ÿҳ��ʾ�ļ�¼��
	private int pageSize;
	
  //�ܼ�¼��
	private int totalRecords;
  //��ҳ��
	private int totalPages;
  //���ݱ���
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
