package cn.weilengdeyu.easybuy.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.weilengdeyu.easybuy.util.PayProcess;

public class PayServlet extends HttpServlet {

	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
           PayProcess process=new PayProcess("book","易买网", "8", "100");
           String url=process.GoPayPage();
           //重定向     实现跨网站的请求  转发是站内 
           response.sendRedirect(url);
	}

}
