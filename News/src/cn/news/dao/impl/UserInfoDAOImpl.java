package cn.news.dao.impl;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import org.apache.jasper.tagplugins.jstl.core.ForEach;
import org.eclipse.jdt.internal.compiler.env.IBinaryAnnotation;
import org.eclipse.jdt.internal.compiler.env.IBinaryElementValuePair;
import org.junit.Test;

import cn.news.dao.BaseDAO;
import cn.news.dao.IUserInfoDAO;
import cn.news.entity.UserInfo;

/**2018年4月28日*/
public class UserInfoDAOImpl extends BaseDAO implements IUserInfoDAO {

	@Test
	public void testLogin() throws Exception{
		/*UserInfo info=new UserInfo();
		info.setUname("1");
		info.setUpwd("1");
		 boolean flag=isLogin(info);
		 System.out.println(flag);*/
		
		List<UserInfo> list= findAll() ;
		for (UserInfo info : list) {
			System.out.println(info.getUname());
		}
		
	}
	
	@Override
	public boolean isLogin(UserInfo info) throws Exception {
		boolean flag=false;//默认登录失败的  当行单列
		String sql="select count(1) as mycount from news_UserInfo where uname=? and upwd=?";
		Object[] paras={info.getUname(),info.getUpwd()};
		ResultSet rs = executeQuery(sql, paras);
		if(rs.next()){
			//有值
			int count = rs.getInt("mycount");
			if (count>0) {
				flag=true;
			}
		}
		closeAllResources();
		return flag;
	}

	@Override
	public List<UserInfo> findAll() throws Exception {
		List<UserInfo> list=new ArrayList<UserInfo>();
		String sql="select * from news_userinfo";
		ResultSet rs = executeQuery(sql);
		while(rs.next()){
			UserInfo info=new UserInfo();
			
			String uname = rs.getString("uname");
			int uid = rs.getInt("uid");
			info.setUname(uname);
			info.setUid(uid);
			list.add(info);
		}
		closeAllResources();
		return list;
	}

	@Override
	public boolean addUser(UserInfo info) throws Exception {
		boolean flag=false;//login failed
		String sql="insert into news_userinfo(uname,upwd) values(?,?)";
		Object[] paras={info.getUname(),info.getUpwd()};
		int count = executeUpdate(sql, paras);
		closeAllResources();
		if (count>0) {
			flag=true;
		}
		return flag;
	}

	@Override
	public boolean addUser(Integer uidnew) throws Exception {
		boolean flag=false;
		String sql="delete from news_userinfo where uid=?";
		int count = executeUpdate(sql,uidnew);
		if (count>0) {
			flag=true;
		}
		return flag;
	}
	
    
	
	//分页数据查询
		@Override
		public List<UserInfo> getOnePageData(int pageIndex,int pageSize) throws Exception {
			
			List<UserInfo> list=new ArrayList<UserInfo>();
			String sql="SELECT * FROM news_userinfo  LIMIT ?,?";
			Object[] paras={(pageIndex-1)*pageSize,pageSize};
			ResultSet rs = executeQuery(sql, paras);
			while(rs.next()){  //
				UserInfo info=new UserInfo(); 
				info.setUid(rs.getInt("uid"));
				info.setUname(rs.getString("uname"));
				info.setUpwd(rs.getString("upwd"));
				list.add(info);
			}
			return list;
		}

	@Override
	public int getTotalUsers() throws Exception {
		int totalNum=0;
		String sql="SELECT COUNT(1) as count FROM news_userinfo";
		 ResultSet rs = executeQuery(sql);
		 if(rs.next()){
			 totalNum=rs.getInt("count");
		 }
		 return totalNum;
	}

	@Override
	public List<UserInfo> getOnePageDataHasCondition(int pageIndex, int pageSize, String uname) throws Exception {
		List<UserInfo> list=new ArrayList<UserInfo>();
		String sql="SELECT * FROM news_userinfo where uname like ? LIMIT ?,?";
		Object[] paras={"%"+uname+"%",(pageIndex-1)*pageSize,pageSize};
		ResultSet rs = executeQuery(sql, paras);
		while(rs.next()){  //
			UserInfo info=new UserInfo(); 
			info.setUid(rs.getInt("uid"));
			info.setUname(rs.getString("uname"));
			info.setUpwd(rs.getString("upwd"));
			list.add(info);
		}
		return list;
	}

	@Override
	public int getTotalUsersHasCondition(String uname) throws Exception {
		int totalNum=0;
		String sql="SELECT COUNT(1) as count FROM news_userinfo where uname like ? ";
		 ResultSet rs = executeQuery(sql,"%"+uname+"%");
		 if(rs.next()){
			 totalNum=rs.getInt("count");
		 }
		 return totalNum;
	}


}
