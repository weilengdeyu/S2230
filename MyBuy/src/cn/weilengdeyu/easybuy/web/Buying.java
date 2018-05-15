package cn.weilengdeyu.easybuy.web;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.jsp.PageContext;

import cn.weilengdeyu.easybuy.entity.Order;
import cn.weilengdeyu.easybuy.entity.User;

public class Buying extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
         doPost(request,response);
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
        //获取地址数据
		//获取用户编号和姓名
		User user=(User)request.getSession().getAttribute("loginuser");
		if(user!=null){
			String address=user.getAddress();
		    request.setAttribute("address",address);
		    String price=request.getParameter("price");
		    request.setAttribute("price",price);
		    request.getRequestDispatcher("/address.jsp").forward(request, response);
	    }else{
	    	String webpath=request.getContextPath();
	    	//问题：找上个页面的url地址
	    	String reqUrl=request.getHeader("referer");
	    	request.setAttribute("returnUrl", reqUrl);
	    	System.out.println("reqUrl是"+reqUrl);
	    	request.getRequestDispatcher("/login.jsp").forward(request, response);
	    	//this.pageContext.getRequest().getAttribute("javax.servlet.forward.request_uri");
	       //response.getOutputStream().write(("<script type='text/javascript'>location.href='"+webpath+"/login.jsp?returnUrl="+reqUrl+"';</script>").getBytes());
	    }
		//构建订单数据
		//Order order=new Order();
	
	}

}
