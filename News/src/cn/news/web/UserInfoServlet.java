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
	//�������Service��
    IUserInfoService infoService=new UserInfoServiceImpl();
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//���post���������
		request.setCharacterEncoding("utf-8");
		String oper=request.getParameter("oper");
		if(oper.equals("login")){
			login(request,response);	
		}else if(oper.equals("logOut")){ //�û�ע��
			//session���
			request.getSession().removeAttribute("uname");
			response.sendRedirect("/News/login.jsp");
		}else if(oper.equals("list")){
			try {
				userListOnePage(request,response);
			} catch (Exception e) {
				e.printStackTrace();
			}//�û��б�
		}else if(oper.equals("addUser")){
			//����û� 
			//ת�������ҳ��
			request.setAttribute("type", "1");
			request.getRequestDispatcher("/admin/user-info.jsp").forward(request, response);
		}else if(oper.equals("addUserDB")){
			addUserToDb(request,response);
		}else if(oper.equals("del")){
			delUser(request,response);
		}else if(oper.equals("find")){  //��������ѯ
			getOnePageDataByCondition(request,response);
			//01.��ȡ������
			String uname=request.getParameter("uname");
			//01.Page����
			PageUtil pageUtil=new PageUtil();
			//02.���Ը�ֵ
			  //2.1��ҳ��ʾ������  ҳ��С
			 int pageSize=3;
			 pageUtil.setPageSize(pageSize);
			 
			 //2.��ǰ�ǵڼ�ҳ
			 int pageIndex=1;
			 String pageIndexTemp=request.getParameter("pageIndex");
			 if(pageIndexTemp!=null&&!pageIndexTemp.equals("")){
				 pageIndex=Integer.parseInt(pageIndexTemp);
			 }
			 pageUtil.setPageIndex(pageIndex);
			 
			 //3.�ܼ�¼��
			int totalRecords=0;
			try {
				totalRecords = infoService.getTotalUsersHasCondition(uname);
				 pageUtil.setTotalRecords(totalRecords);
			} catch (Exception e1) {
				e1.printStackTrace();
			}
			 //4.��ҳ��
			 int totalPages=pageUtil.getTotalRecords()%pageUtil.getPageSize()==0?pageUtil.getTotalRecords()/pageUtil.getPageSize():pageUtil.getTotalRecords()/pageUtil.getPageSize()+1;
			 pageUtil.setTotalPages(totalPages);
			 
			 //5.���ͼ���
			 List<UserInfo> list=null;
			try {
				list = infoService.getOnePageDataHasCondition(pageUtil.getPageIndex(), pageUtil.getPageSize(),uname);
				pageUtil.setList(list);
		   } catch (Exception e1) {
				e1.printStackTrace();
			}
			 
			//03.��page�����������request
			request.setAttribute("pageUtil", pageUtil);
			//�����������
			request.setAttribute("uname", uname);
			try {
				//04.ת��
				request.getRequestDispatcher("/admin/user-manage.jsp").forward(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}
	}
	private void getOnePageDataByCondition(HttpServletRequest request, HttpServletResponse response) {
		
		
	}
	private void userListOnePage(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//01.Page����
		PageUtil pageUtil=new PageUtil();

		//02.���Ը�ֵ
		  //2.1��ҳ��ʾ������  ҳ��С
		 int pageSize=3;
		 pageUtil.setPageSize(pageSize);
		 
		 //2.��ǰ�ǵڼ�ҳ
		 int pageIndex=1;
		 String pageIndexTemp=request.getParameter("pageIndex");
		 if(pageIndexTemp!=null&&!pageIndexTemp.equals("")){
			 pageIndex=Integer.parseInt(pageIndexTemp);
		 }
		 pageUtil.setPageIndex(pageIndex);
		 
		 //3.�ܼ�¼��
		 int totalRecords= infoService.getTotalUsers();
		 pageUtil.setTotalRecords(totalRecords);
		 
		 //4.��ҳ��
		 int totalPages=pageUtil.getTotalRecords()%pageUtil.getPageSize()==0?pageUtil.getTotalRecords()/pageUtil.getPageSize():pageUtil.getTotalRecords()/pageUtil.getPageSize()+1;
		 pageUtil.setTotalPages(totalPages);
		 
		 //5.���ͼ���
		 List<UserInfo> list = infoService.getOnePageData(pageUtil.getPageIndex(), pageUtil.getPageSize());
		 pageUtil.setList(list);
		//03.��page�����������request
		request.setAttribute("pageUtil", pageUtil);
		try {
			//04.ת��
			request.getRequestDispatcher("/admin/user-manage.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	private void delUser(HttpServletRequest request,HttpServletResponse response) {
		//del ����
		//���ע��һ�����飬�������ϴ�Server �ϵ����� �������ַ���
		String uid=request.getParameter("uid");
		
		//�ַ�ת��int
		Integer uidnew=Integer.parseInt(uid);
		try {
			boolean flag = infoService.delUser(uidnew);
			if(flag){
				//�ص�list
				request.getRequestDispatcher("/UserInfoServlet?oper=list").forward(request, response);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		
	}
	private void addUserToDb(HttpServletRequest request,HttpServletResponse response) {
		String type=request.getParameter("isAddOrUpdate");
		if(type.equals("1")){
			//���
			//01.�����û��������Ϣ
			String uname=request.getParameter("username");
			String upwd=request.getParameter("password");
			UserInfo info=new UserInfo();
			info.setUname(uname);
			info.setUpwd(upwd);
			 //02.����service��ӷ���
			try {
				boolean flag = infoService.addUser(info);
				if (flag) {
					//�ɹ�
					//03.��ӳɹ�����ת���û��б�ҳ��
					request.getRequestDispatcher("/UserInfoServlet?oper=list").forward(request, response);
				}
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else{
			
			//�޸Ĳ���
		}
		
	}
	
	private void userList(HttpServletRequest request,HttpServletResponse response) {
		try {
			List<UserInfo> list = infoService.findAll();
			request.setAttribute("list", list);//�����ͼ��Ϸ���request������
			//ת��ʵ�����ݵĹ���
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
				//��¼
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
