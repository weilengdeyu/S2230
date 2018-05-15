package cn.news.web;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.news.entity.UserInfo;
import cn.news.service.IUserInfoService;
import cn.news.service.impl.UserInfoServiceImpl;
import cn.news.util.PageUtil;

/**
 * Servlet implementation class UserInfoServlet
 */
@WebServlet("/UserInfoServlet")
public class UserInfoServlet extends HttpServlet {
	//引入的是Service层
    IUserInfoService infoService=new UserInfoServiceImpl();
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//解决post请求的乱码
		request.setCharacterEncoding("utf-8");
		String oper=request.getParameter("oper");
		if(oper.equals("login")){
			login(request,response);	
		}else if(oper.equals("logOut")){ //用户注销
			//session清除
			request.getSession().removeAttribute("uname");
			response.sendRedirect("/News/login.jsp");
		}else if(oper.equals("list")){
			try {
				userListOnePage(request,response);
			} catch (Exception e) {
				e.printStackTrace();
			}//用户列表
		}else if(oper.equals("addUser")){
			//添加用户 
			//转发到添加页面
			request.setAttribute("type", "1");
			request.getRequestDispatcher("/admin/user-info.jsp").forward(request, response);
		}else if(oper.equals("addUserDB")){
			addUserToDb(request,response);
		}else if(oper.equals("del")){
			delUser(request,response);
		}else if(oper.equals("find")){  //带条件查询
			getOnePageDataByCondition(request,response);
			//01.获取到条件
			String uname=request.getParameter("uname");
			//01.Page对象
			PageUtil pageUtil=new PageUtil();
			//02.属性赋值
			  //2.1本页显示数据量  页大小
			 int pageSize=3;
			 pageUtil.setPageSize(pageSize);
			 
			 //2.当前是第几页
			 int pageIndex=1;
			 String pageIndexTemp=request.getParameter("pageIndex");
			 if(pageIndexTemp!=null&&!pageIndexTemp.equals("")){
				 pageIndex=Integer.parseInt(pageIndexTemp);
			 }
			 pageUtil.setPageIndex(pageIndex);
			 
			 //3.总记录数
			int totalRecords=0;
			try {
				totalRecords = infoService.getTotalUsersHasCondition(uname);
				 pageUtil.setTotalRecords(totalRecords);
			} catch (Exception e1) {
				e1.printStackTrace();
			}
			 //4.总页数
			 int totalPages=pageUtil.getTotalRecords()%pageUtil.getPageSize()==0?pageUtil.getTotalRecords()/pageUtil.getPageSize():pageUtil.getTotalRecords()/pageUtil.getPageSize()+1;
			 pageUtil.setTotalPages(totalPages);
			 
			 //5.泛型集合
			 List<UserInfo> list=null;
			try {
				list = infoService.getOnePageDataHasCondition(pageUtil.getPageIndex(), pageUtil.getPageSize(),uname);
				pageUtil.setList(list);
		   } catch (Exception e1) {
				e1.printStackTrace();
			}
			 
			//03.将page对象整体放入request
			request.setAttribute("pageUtil", pageUtil);
			//放入检索条件
			request.setAttribute("uname", uname);
			try {
				//04.转发
				request.getRequestDispatcher("/admin/user-manage.jsp").forward(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}
	}
	private void getOnePageDataByCondition(HttpServletRequest request, HttpServletResponse response) {
		
		
	}
	private void userListOnePage(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//01.Page对象
		PageUtil pageUtil=new PageUtil();

		//02.属性赋值
		  //2.1本页显示数据量  页大小
		 int pageSize=3;
		 pageUtil.setPageSize(pageSize);
		 
		 //2.当前是第几页
		 int pageIndex=1;
		 String pageIndexTemp=request.getParameter("pageIndex");
		 if(pageIndexTemp!=null&&!pageIndexTemp.equals("")){
			 pageIndex=Integer.parseInt(pageIndexTemp);
		 }
		 pageUtil.setPageIndex(pageIndex);
		 
		 //3.总记录数
		 int totalRecords= infoService.getTotalUsers();
		 pageUtil.setTotalRecords(totalRecords);
		 
		 //4.总页数
		 int totalPages=pageUtil.getTotalRecords()%pageUtil.getPageSize()==0?pageUtil.getTotalRecords()/pageUtil.getPageSize():pageUtil.getTotalRecords()/pageUtil.getPageSize()+1;
		 pageUtil.setTotalPages(totalPages);
		 
		 //5.泛型集合
		 List<UserInfo> list = infoService.getOnePageData(pageUtil.getPageIndex(), pageUtil.getPageSize());
		 pageUtil.setList(list);
		//03.将page对象整体放入request
		request.setAttribute("pageUtil", pageUtil);
		try {
			//04.转发
			request.getRequestDispatcher("/admin/user-manage.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	private void delUser(HttpServletRequest request,HttpServletResponse response) {
		//del 操作
		//大家注意一件事情，从网线上打到Server 上的数据 ，都是字符串
		String uid=request.getParameter("uid");
		
		//字符转成int
		Integer uidnew=Integer.parseInt(uid);
		try {
			boolean flag = infoService.delUser(uidnew);
			if(flag){
				//回到list
				request.getRequestDispatcher("/UserInfoServlet?oper=list").forward(request, response);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		
	}
	private void addUserToDb(HttpServletRequest request,HttpServletResponse response) {
		String type=request.getParameter("isAddOrUpdate");
		if(type.equals("1")){
			//添加
			//01.接收用户输入的信息
			String uname=request.getParameter("username");
			String upwd=request.getParameter("password");
			UserInfo info=new UserInfo();
			info.setUname(uname);
			info.setUpwd(upwd);
			 //02.调度service添加方法
			try {
				boolean flag = infoService.addUser(info);
				if (flag) {
					//成功
					//03.添加成功，跳转到用户列表页面
					request.getRequestDispatcher("/UserInfoServlet?oper=list").forward(request, response);
				}
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else{
			
			//修改操作
		}
		
	}
	
	private void userList(HttpServletRequest request,HttpServletResponse response) {
		try {
			List<UserInfo> list = infoService.findAll();
			request.setAttribute("list", list);//将泛型集合放入request作用域
			//转发实现数据的共享
			request.getRequestDispatcher("/admin/user-manage.jsp").forward(request, response);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	public void login(HttpServletRequest request, HttpServletResponse response){
		UserInfo info=new UserInfo();
		String uname=request.getParameter("username");
		String upwd=request.getParameter("password");
		info.setUname(uname);
		info.setUpwd(upwd);
		
		try {
			boolean flag = infoService.isLogin(info);
			if (flag) {
				//登录
				request.getSession().setAttribute("uname", uname);
				response.sendRedirect("/News/admin/admin.jsp");
			}else{
				response.sendRedirect("/News/login.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
