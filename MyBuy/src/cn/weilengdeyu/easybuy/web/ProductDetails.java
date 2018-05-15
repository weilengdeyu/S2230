package cn.weilengdeyu.easybuy.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Arrays;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.weilengdeyu.easybuy.biz.impl.ProductBizImpl;
import cn.weilengdeyu.easybuy.entity.Product;
/**
 * @author Happy
 * 产品详细信息Servlet
 */
public class ProductDetails extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request,response);
	}
	
	ProductBizImpl proImpl=new ProductBizImpl();
    
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//获取商品编号
          int id=Integer.parseInt(request.getParameter("id"));
          //调用根据商品编号获取商品详细信息的方法
          Product pro=proImpl.getProductById(id);
          
          //写入cookie
          String proHistory=getHistory(request,String.valueOf(id));
          
          Cookie cookie=new Cookie("proHistory", proHistory);
          response.addCookie(cookie);
          request.setAttribute("pro", pro);
          request.getRequestDispatcher("/product-view.jsp").forward(request, response);
		
	}

	/**
	 * 
	 * @param request 封装的Request对象
	 * @param id   最新浏览的商品编号 
	 * @return  前三个浏览过的商品字符串
	 */
	private String getHistory(HttpServletRequest request, String id) {
		//获取用户所有携带的cookie
		//可能情况  
		//第一次访问:proHistory=null  1    proHistory=1
		//非第一次:proHistory=3_2_5  1    proHistory=1_3_2
		//非第一次:proHistory=3_1_5  1    proHistory=1_3_5
		//非第一次:proHistory=3_2    1    proHistory=1_3_2
		//拆解出cookies集合
		Cookie[] cookies=request.getCookies();
		//浏览过的商品形成的大字符串
		String proHistory=null;
		for (int i = 0;cookies!=null&& i < cookies.length; i++) {
			if (cookies[i].getName().equals("proHistory")) {
				proHistory=cookies[i].getValue();
				break;
			}
		}
		if(proHistory==null){
			return id;
		}
		//根据_分割数据
		//在java中 \代表转义字符 \n \t 等，而 \\ 代表一个反斜杠 而.代表一个元字符
		//要表示一个.就需要用 要用\. 
		//所以"\\." 在实际编译中 就代表 .
		List mylist=Arrays.asList(proHistory.split("\\_"));
		LinkedList<String> list=new LinkedList<String>();
		list.addAll(mylist);
		if (list.contains(id)) {//集合中含有该商品
			list.remove(id);
			list.addFirst(id);
		}else{
			if(list.size()>=3){
				list.removeLast();
				list.addFirst(id);
			}else{
				list.addFirst(id);
			}
		}
		StringBuffer sb=new StringBuffer();
		for (String item : list) {
			sb.append(item+"_");
		}
		return sb.deleteCharAt(sb.length()-1).toString();
	}

}
