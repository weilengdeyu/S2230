package cn.news.dao;

import java.util.List;

import cn.news.entity.UserInfo;

/**2018年4月28日*/
/**
 * 用户的DAO
 */
public interface IUserInfoDAO {
  /**
   *   
   * @param info  用户实体类对象
   * @return  登录结果  布尔类型
   * @throws Exception
   */
  //01.写一个用于登录的方法
  public boolean isLogin(UserInfo info) throws Exception;
  
  //02.写一个查询所有用户的方法
  public List<UserInfo> findAll() throws Exception; 
  
  //03.写一个添加用户的方法
  public boolean addUser(UserInfo info) throws Exception;
  
  //04.写一个根据用户编号，删除用户的方法
  public boolean addUser(Integer uidnew) throws Exception;
  
  //05.定制一个只获取单页数据的方法
  public List<UserInfo> getOnePageData(int pageIndex,int pageSize) throws Exception;
  
  //06.获取用户总数
  public int getTotalUsers() throws Exception;
  
//07.定制一个只获取单页数据的方法 带条件
  public List<UserInfo> getOnePageDataHasCondition(int pageIndex,int pageSize,String uname) throws Exception;
  
  //08.获取带条件限制的用户总数
  public int getTotalUsersHasCondition(String uname) throws Exception;
  
  
  
  
  
  
  
}
