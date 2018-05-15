package cn.weilengdeyu.easybuy.web;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.weilengdeyu.easybuy.biz.UserBiz;
import cn.weilengdeyu.easybuy.biz.impl.UserBizImpl;
import cn.weilengdeyu.easybuy.entity.User;
import cn.weilengdeyu.easybuy.util.Validator;

public class Login extends HttpServlet {
	private UserBiz userService;
	public void init() throws ServletException {
		userService = new UserBizImpl();
	}
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
         doPost(request,response);
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//判定用户的动作，根据动作的不同进入不同的方法体执行
		String action=request.getParameter("action");
		if(action.equals("login")){ //用户点击登录按钮
			 //解决post请求的乱码问题
			request.setCharacterEncoding("utf-8");
			//获取用户提交的数据
			String uid=request.getParameter("userId");
			String upwd=request.getParameter("password");
			String url=(String)request.getParameter("returnUrl");
			System.out.println("访问的url是"+url);
			
			//验证码 用户填写的
			String code=request.getParameter("code");
			//图片中正确验证码
			String rightCode=(String)request.getSession().getAttribute("numrand");
			Validator validator=new Validator(Validator.toSingleParameters(request));
			request.setAttribute("userId", uid);
			request.setAttribute("password", upwd);
			if (validator.checkRequiredError("code")) {
				validator.addError("code","验证码不能为空！");
			}//验证验证码是否正确，因为如果验证码错误的话，就没有必要访问数据库去验证用户名和密码是否正确。
			else if(code!=null&&rightCode!=null&&!code.equals(rightCode)){
				validator.addError("mess", "验证码错误，请重新输入!");
			}else if(!validator.checkRequiredError(new String[] { "userId",
			"password" })){         //用户名和密码不为空
				User user=new User();
				user.setUserId(uid);
				user.setPassword(upwd);
				
				 User flag=userService.isLogin(user);
				 if (flag!=null) {
					 user.setAddress(flag.getAddress());
					//将用户对象记录到Session
					 request.getSession().setAttribute("loginuser",user);
				 }else {
					 validator.addError("userId", "用户名或密码不正确");
				}
				
			}
			if(!validator.hasErrors()&&url==null){
				response.sendRedirect(request.getContextPath() + "/Home");
			}else if(!validator.hasErrors()&&url!=null){
				response.sendRedirect(url);
			}
			else {
				request.setAttribute("errors", validator.getErrors());
				request.getRequestDispatcher("/login.jsp").forward(request, response);
			}
		}else if(action.equals("logout")){
			//删除Session
			request.getSession().removeAttribute("loginuser");
			request.getSession().removeAttribute("cart");
			
			//重定向 页面
			request.getRequestDispatcher("/login.jsp").forward(request, response);
		}
	}

}
