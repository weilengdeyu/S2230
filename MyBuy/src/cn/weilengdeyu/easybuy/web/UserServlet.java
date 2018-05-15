package cn.weilengdeyu.easybuy.web;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.weilengdeyu.easybuy.dao.impl.UserDaoImpl;
import cn.weilengdeyu.easybuy.util.Page;

public class UserServlet extends HttpServlet {

	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
         doPost(request, response);
		
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		UserDaoImpl impl=new UserDaoImpl();
		Page page=new Page();
		//给page对象赋值
		 //每页显示的记录数
		  page.setPageSize(2);//每页显示的记录数
		 
        //获取传递过来的PageIndex变量的值
		String mycurrentPage=request.getParameter("PageIndex");
		
		 int pages=0;
		if(mycurrentPage==null){
			mycurrentPage="1";
		  }
		
		 page.setTotalRecords(impl.getRowsCount());
		   pages=page.myGetTPages();
		  page.setTotalPages(pages);
		Integer currentPage=Integer.parseInt(mycurrentPage);
		  if(currentPage==null){
		    currentPage=1;
		  }
		  if(currentPage<=0){
		    currentPage=1;
		  }
		  if(currentPage>page.getTotalPages()){
			     currentPage=page.getTotalPages();
		  }
		  
		  System.out.println(currentPage.toString());
		  page.setCurrentPage(Integer.parseInt(currentPage.toString()));//设置当前页
		 
		  page.setUserList(impl.getAllUsers(page.getCurrentPage(),page.getPageSize()));
			
	  			
	  			
			  
	        int liststep = 3;//最多显示分页页数  
			int listbegin = (page.getCurrentPage() - (int) Math.floor((double) liststep / 2));//从第几页开始显示分页信息   
	        if (listbegin < 1) { //当前页-(总显示的页列表数/2)   
	            listbegin = 1;   
	        }else if(listbegin+(int) Math.floor((double) liststep / 2)>page.getTotalPages()){
	      	  listbegin=page.getTotalPages()-liststep+1;
	        }
	        int listend=page.getCurrentPage() + liststep / 2;
	       
	        if(page.getTotalPages()<liststep){
	      	  listend=page.getTotalPages();
	        }else if(page.getTotalPages()>liststep&&listend<=page.getTotalPages()){
	          listend =listend<liststep?liststep:listend;//分页信息显示到第几页//当前页+(总显示的页列表数/2)
	        }else if (listend > page.getTotalPages()) {    
	            listend = page.getTotalPages();   
	        }
	        page.setListbegin(listbegin);
	        page.setListened(listend); 
		    
		    request.setAttribute("list",page);
		    request.getRequestDispatcher("/manager/user.jsp").forward(request, response);
	}

}
