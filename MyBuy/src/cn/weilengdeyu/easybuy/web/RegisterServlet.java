package cn.weilengdeyu.easybuy.web;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.weilengdeyu.easybuy.dao.UserDao;
import cn.weilengdeyu.easybuy.dao.impl.UserDaoImpl;
import cn.weilengdeyu.easybuy.entity.Cart;
import cn.weilengdeyu.easybuy.entity.User;

public class RegisterServlet extends HttpServlet {

	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request,response);
		
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//获取用户编号
        String id=request.getParameter("id");
        UserDao dao=new UserDaoImpl();
        User user=new User();
        user.setUserId(id);
        boolean flag = dao.isEmptyOrNot(user);
        String str=null;
        if (flag) {
			str="用户名已存在！";
		}else {
			str="用户名可用";
		}
        response.setContentType("text/plain");
        response.setCharacterEncoding("utf-8");
         response.getWriter().print(str);
		
	}

}
