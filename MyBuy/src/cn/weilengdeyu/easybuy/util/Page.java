package cn.weilengdeyu.easybuy.util;
import java.util.List;

import cn.weilengdeyu.easybuy.entity.Product;
import cn.weilengdeyu.easybuy.entity.User;
public class Page {
	// 总页数
	private int totalPages =0;
	// 总记录数
	private int totalRecords=0;
	// 每页显示的记录数
	private int pageSize =1;
	// 当前页码
	private int currentPage = 1;
	// 每页商品集合
	private List<Product> proList;

	//每页用户集合
	private List<User> userList;
	
	public List<User> getUserList() {
		return userList;
	}


	public void setUserList(List<User> userList) {
		this.userList = userList;
	}

	/*以下是分页页码条相关内容*/
    private int listbegin; //页码开始
    private int listened;//分页信息显示到第几页
    public int getListbegin() {
		return listbegin;
	}


	public void setListbegin(int listbegin) {
		this.listbegin = listbegin;
	}
	public int getListened() {
		return listened;
	}
	public void setListened(int listened) {
		this.listened = listened;
	}
	public int getTotalPages() {
		return totalPages;
	}
	//写一个方法计算出总页数   6    
	public int myGetTPages(){
		int num=totalRecords%pageSize==0?totalRecords/pageSize:(totalRecords/pageSize)+1;
		return num;
	}
	public void setTotalPages(int totalPages) {
		if(totalPages<=0){
			totalPages=1;
		}else{
		   this.totalPages = totalPages;
		}
	}

	public int getTotalRecords() {
		return totalRecords;
	}

	public void setTotalRecords(int totalRecords) {
		this.totalRecords = totalRecords;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		if(pageSize<=0){
			pageSize=1;
		}else{
			this.pageSize = pageSize;
		}
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		if(currentPage<=0){
			currentPage=1;
		}else if(currentPage>totalPages){
			currentPage=totalPages;
		}else{
			this.currentPage = currentPage;
		}
	}

	public List<Product> getProList() {
		return proList;
	}

	public void setProList(List<Product> proList) {
		this.proList = proList;
	}

}
