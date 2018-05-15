package cn.weilengdeyu.easybuy.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.weilengdeyu.easybuy.entity.Order;
import cn.weilengdeyu.easybuy.entity.User;

public class Account extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
        doPost(request,response);
		
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
         //提交订单（准备订单数据）

		Order order=new Order();
		//用户编号
		User user=(User)request.getSession().getAttribute("loginuser");
		String userid=user.getUserId();
		//用户名称
		String username=user.getUserName();
		//送货地址
		String address=(String)request.getAttribute("address");
		//订货时间
		Date date=new Date();
		String orderdate=date.toLocaleString();
		//订单金额
		double price=Double.parseDouble(request.getAttribute("price").toString());
		//订单状态设置成1 
		int ordertype=1;
		//类型
		int type=1;
		//写入订单表
		request.getRequestDispatcher("/shopping-result.jsp").forward(request, response);
		
		
	}

}
