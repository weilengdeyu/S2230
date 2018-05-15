package cn.weilengdeyu.easybuy.dao.impl;

import java.util.ArrayList;
import java.util.List;

import cn.weilengdeyu.easybuy.dao.BaseDao;
import cn.weilengdeyu.easybuy.dao.UserDao;
import cn.weilengdeyu.easybuy.entity.Product;
import cn.weilengdeyu.easybuy.entity.User;

public class UserDaoImpl extends BaseDao implements UserDao {

	@Override
	public User isLogin(User user) {
		String sql="select * from easybuy_user where eu_user_id=? and  eu_password=?";
		Object[] paras=new Object[]{user.getUserId(),user.getPassword()};
		rs=executeSelect(sql, paras);
		User ruser=null;
		try {
			if(rs.next()){
				ruser=new User();
				ruser.setUserId(rs.getString(1));
				ruser.setUserName(rs.getString(2));
				ruser.setAddress(rs.getString("eu_address"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ruser;
	}

	@Override
	public boolean isEmptyOrNot(User user) {
		boolean flag=false;
		String sql="select * from easybuy_user where eu_user_id=?";
		rs=executeSelect(sql, user.getUserId());
		User ruser=null;
		try {
			if(rs.next()){
				ruser=new User();
				ruser.setUserId(rs.getString(1));
				ruser.setUserName(rs.getString(2));
				ruser.setAddress(rs.getString("eu_address"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		if (ruser!=null) {
		  flag=true;
		}
		return flag;
	}

	@Override
	public List<User> getAllUsers(int currentPage, int pageSize) {
		String sql="select top "+pageSize+" * from EASYBUY_User where EU_USER_ID not in(select top "+(currentPage-1)*pageSize+" EU_USER_ID from EASYBUY_user)";
		List<User> list=new ArrayList<User>();
		try{
			rs=executeSelect(sql);
			while(rs.next()){
				User user=new User();
				//EU_USER_ID, EU_USER_NAME, EU_PASSWORD, EU_SEX, EU_BIRTHDAY, EU_IDENTITY_CODE,
				//EU_EMAIL, EU_MOBILE, EU_ADDRESS, EU_STATUS, EU_LOGIN
				user.setUserId(rs.getString("EU_USER_ID"));
				user.setUserName(rs.getString("EU_USER_NAME"));
				user.setMale(Boolean.parseBoolean(rs.getString("EU_SEX")));
				user.setEmail(rs.getString("EU_EMAIL"));
				user.setMobile(rs.getString("EU_MOBILE"));
				
				list.add(user);
			}
		}catch(Exception ex){
			ex.printStackTrace();
		}finally{
			closeAll();
		}
		return list;
	}

	@Override
	public int getRowsCount() {
		return getRowsCountById();	
	}
	
	public int getRowsCountById() {
		String sql=null;
		
			sql="select count(*) from EASYBUY_User ";
		
		int count=0;
        try {
    		rs=executeSelect(sql);
    		if(rs.next()){
				count=rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}

	@Override
	public boolean delUser(String uid) {
		String sql="delete from easybuy_user where EU_USER_ID=?";
		Object[] parasObjects={uid};
		boolean flag = executeUpdate(sql, parasObjects);
		System.out.println("flag"+flag);
		return flag;
	}

}
