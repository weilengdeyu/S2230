package cn.weilengdeyu.easybuy.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.weilengdeyu.easybuy.dao.impl.ProductCategoryDaoImpl;
import cn.weilengdeyu.easybuy.entity.ProductCategory;

public class LeftBar extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
    doPost(request,response);
		
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//01.左侧商品分类
		ProductCategoryDaoImpl category=new ProductCategoryDaoImpl();
		try {
			List<ProductCategory> categories=category.getProductCategories(null);
			request.setAttribute("categories", categories);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		String type=request.getParameter("type");
		System.out.println("我的类型"+type);
		if (type.equals("guestbook")) {
			request.getRequestDispatcher("/guestbook.jsp").forward(request, response);
		}else if (type.equals("address")) {
			request.getRequestDispatcher("/address.jsp").forward(request, response);
		}else if (type.equals("product-view")) {
			request.getRequestDispatcher("/product-view.jsp").forward(request, response);
		}
		
		
	}

}
