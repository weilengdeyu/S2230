package cn.weilengdeyu.easybuy.biz;

import cn.weilengdeyu.easybuy.dao.UserDao;
import cn.weilengdeyu.easybuy.dao.impl.UserDaoImpl;
import cn.weilengdeyu.easybuy.entity.User;

public interface UserBiz {
	 UserDao userDao=new UserDaoImpl();
	//写一个验证用户是否登录成功的方法 
		public User isLogin(User user);
}
