package cn.weilengdeyu.easybuy.biz.impl;

import cn.weilengdeyu.easybuy.biz.UserBiz;
import cn.weilengdeyu.easybuy.entity.User;

public class UserBizImpl implements UserBiz {

	@Override
	public User isLogin(User user) {
		 User ruser=userDao.isLogin(user);
		return ruser;
	}

}
