package cn.weilengdeyu.easybuy.dao;

import java.util.List;
import cn.weilengdeyu.easybuy.entity.User;

public  interface UserDao {
   //写一个验证用户是否登录成功的方法 
	public User isLogin(User user);
	//02.写一个判定用户是否存在的方法
	public boolean isEmptyOrNot(User user);
	
	//03.书写查询所有用户信息的方法(第一页数据)
	public List<User> getAllUsers(int currentPage, int pageSize);
	//04.写一个获取用户表中总记录数的方法
    public int getRowsCount();
    
    
    //05.写一个删除用户的方法
    public boolean delUser(String uid);
}
