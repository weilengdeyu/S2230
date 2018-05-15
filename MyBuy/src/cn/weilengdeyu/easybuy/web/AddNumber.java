package cn.weilengdeyu.easybuy.web;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.weilengdeyu.easybuy.dao.impl.ProductDaoImpl;
import cn.weilengdeyu.easybuy.entity.Cart;
import cn.weilengdeyu.easybuy.entity.CartItem;

public class AddNumber extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
       doPost(request,response);
		
	}
	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//获取商品编号
         String id=request.getParameter("id");
       
         Cart cart=(Cart)request.getSession().getAttribute("cart");
         int count=cart.getMap().get(id).getQuantity();
         cart.getMap().get(id).setQuantity(count+1);
         request.getSession().setAttribute("cart", cart);
          response.getWriter().print(cart.getMap().get(id).getQuantity());
	}

}
