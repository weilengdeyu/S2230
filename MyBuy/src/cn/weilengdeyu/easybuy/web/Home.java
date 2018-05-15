package cn.weilengdeyu.easybuy.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import cn.weilengdeyu.easybuy.biz.impl.ProductBizImpl;
import cn.weilengdeyu.easybuy.dao.impl.ProductCategoryDaoImpl;
import cn.weilengdeyu.easybuy.dao.impl.ProductDaoImpl;
import cn.weilengdeyu.easybuy.entity.Product;
import cn.weilengdeyu.easybuy.entity.ProductCategory;
import cn.weilengdeyu.easybuy.util.Page;

public class Home extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
        doPost(request,response);
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
        //准备各种数据
		//01.左侧商品分类
		//商品分类实现类
		//获取需要进行的操作
		String oper=request.getParameter("action");
		ProductCategoryDaoImpl category=new ProductCategoryDaoImpl();
		ProductBizImpl pro=new ProductBizImpl();
		try {
			List<ProductCategory> categories=category.getProductCategories(null);
			request.setAttribute("categories", categories);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		//02.商品列表展示
		ProductDaoImpl productimpl=new ProductDaoImpl();
		List<Product> prolist=null;
		String cateId=request.getParameter("cateid");
		
		Page page=new Page();
		//给page对象赋值
		 //每页显示的记录数
		  page.setPageSize(2);//每页显示的记录数
		 
        //获取传递过来的PageIndex变量的值
		String mycurrentPage=request.getParameter("PageIndex");
		String mycateid=request.getParameter("cateid");
		
		if(mycateid==null){
			mycateid="1";
		}
		
		if(mycurrentPage==null){
			mycurrentPage="1";
		  }
		
		  
          //03.显示用户最近浏览过的商品
          Cookie cookies[]=request.getCookies();
          List<Product> list=new LinkedList<Product>();
          for (int i = 0;cookies!=null&&i < cookies.length; i++) {
			 Cookie cookie=cookies[i];
			 if (cookie.getName().equals("proHistory")) {
				 String proHistory=cookie.getValue();
				 String[] ids=proHistory.split("\\_");
				 for (String item : ids) {
					//形成一个商品对象（得到商品名称）
					 Product product=pro.getProductById(Integer.parseInt(item));
					 list.add(product);
				 }
			 }
		  } 
          
        int pages=0;
       //设置当前页要显示的数据
        if (oper!=null) {
  			if (oper.equals("product_list")) {
  				if(cateId!=null){
  					page.setTotalRecords(productimpl.getRowsCountById(Integer.valueOf(cateId)));
  				  pages=page.myGetTPages();
  				  page.setTotalPages(pages);
  				}
  			}
  		}else{
  			page.setProList(productimpl.getAllProducts(page.getCurrentPage(),page.getPageSize()));
  			if(mycateid.equals("1")){
	  			
	  			 page.setTotalRecords(productimpl.getRowsCount());
	  			   pages=page.myGetTPages();
	  			  page.setTotalPages(pages);
  			  }else{
  				  System.out.println("aaaa"+cateId);
  				page.setTotalRecords(productimpl.getRowsCountById(Integer.valueOf(cateId)));
				  pages=page.myGetTPages();
				  page.setTotalPages(pages);
  			  }
  			 
  		}
       
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
		  if(!mycateid.equals("1")){
	        	request.setAttribute("cateid", mycateid);
	        }
	        else {
	        	
	  			request.setAttribute("cateid", cateId);
			}
		prolist=productimpl.getProductsByCateId(Integer.valueOf(mycateid),page.getCurrentPage(),page.getPageSize());
      	page.setProList(prolist);
			  
			 
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
        //
	    request.getSession().setAttribute("brolist", list);
	    request.setAttribute("list",page);
		request.getRequestDispatcher("/index.jsp").forward(request, response);
	}

}
