package cn.news.dao;

import java.util.List;

import cn.news.entity.UserInfo;

/**2018��4��28��*/
/**
 * �û���DAO
 */
public interface IUserInfoDAO {
  /**
   *   
   * @param info  �û�ʵ�������
   * @return  ��¼���  ��������
   * @throws Exception
   */
  //01.дһ�����ڵ�¼�ķ���
  public boolean isLogin(UserInfo info) throws Exception;
  
  //02.дһ����ѯ�����û��ķ���
  public List<UserInfo> findAll() throws Exception; 
  
  //03.дһ������û��ķ���
  public boolean addUser(UserInfo info) throws Exception;
  
  //04.дһ�������û���ţ�ɾ���û��ķ���
  public boolean addUser(Integer uidnew) throws Exception;
  
  //05.����һ��ֻ��ȡ��ҳ���ݵķ���
  public List<UserInfo> getOnePageData(int pageIndex,int pageSize) throws Exception;
  
  //06.��ȡ�û�����
  public int getTotalUsers() throws Exception;
  
//07.����һ��ֻ��ȡ��ҳ���ݵķ��� ������
  public List<UserInfo> getOnePageDataHasCondition(int pageIndex,int pageSize,String uname) throws Exception;
  
  //08.��ȡ���������Ƶ��û�����
  public int getTotalUsersHasCondition(String uname) throws Exception;
  
  
  
  
  
  
  
}
