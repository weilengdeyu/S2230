package cn.weilengdeyu.easybuy.web;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.weilengdeyu.easybuy.dao.impl.UserDaoImpl;

public class UserDel extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
         doPost(request, response);
		
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			//获取编号
		    String id=request.getParameter("id");
		    //调用删除方法
		    UserDaoImpl impl=new UserDaoImpl();
		   impl.delUser(id);
		    request.getRequestDispatcher("/UserServlet").forward(request, response);
		
	}

}
