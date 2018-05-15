package cn.news.service.impl;

import java.util.List;

import cn.news.dao.IUserInfoDAO;
import cn.news.dao.impl.UserInfoDAOImpl;
import cn.news.entity.UserInfo;
import cn.news.service.IUserInfoService;

/**2018年4月28日*/
//Ctrl+1
public class UserInfoServiceImpl implements IUserInfoService {
	//植入DAO层的接口
    IUserInfoDAO userInfoDAO=new UserInfoDAOImpl();
	
    @Override
	public boolean isLogin(UserInfo info) throws Exception {
		return userInfoDAO.isLogin(info);
	}

	@Override
	public List<UserInfo> findAll() throws Exception {
		return userInfoDAO.findAll();
	}

	@Override
	public boolean addUser(UserInfo info) throws Exception {
		return userInfoDAO.addUser(info);
	}

	@Override
	public boolean delUser(Integer uidnew) throws Exception {
		return userInfoDAO.addUser(uidnew);
		
	}

	@Override
	public List<UserInfo> getOnePageData(int pageIndex, int pageSize) throws Exception {
		return userInfoDAO.getOnePageData(pageIndex, pageSize);
	}

	@Override
	public int getTotalUsers() throws Exception {
		return userInfoDAO.getTotalUsers();
	}

	@Override
	public List<UserInfo> getOnePageDataHasCondition(int pageIndex, int pageSize, String uname) throws Exception {
		// TODO Auto-generated method stub
		return userInfoDAO.getOnePageDataHasCondition(pageIndex, pageSize, uname);
	}

	@Override
	public int getTotalUsersHasCondition(String uname) throws Exception {
		return userInfoDAO.getTotalUsersHasCondition(uname);
	}

}
