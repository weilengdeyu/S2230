package cn.weilengdeyu.easybuy.web;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.weilengdeyu.easybuy.dao.impl.ProductDaoImpl;
import cn.weilengdeyu.easybuy.entity.Cart;
//处理购物车逻辑的Servlet
public class CartServlet extends HttpServlet {

	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
            doPost(request,response);
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
            //获取产品编号
		    String proid=request.getParameter("proid");
		    //将用户购买的商品加入到购物车中
		    Cart cart=(Cart)request.getSession().getAttribute("cart");
		    if (cart==null) {
				cart =new Cart();
				request.getSession().setAttribute("cart", cart);
			}
		    ProductDaoImpl impl=new ProductDaoImpl();
		    impl.buyPro(proid, cart);
		    response.sendRedirect(request.getContextPath()+"/shopping.jsp");
		    //request.getRequestDispatcher("/shopping.jsp").forward(request, response);
	}

}

















