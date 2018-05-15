package cn.news.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

/**2018��3��24��*/
//tool class 
public class BaseDAO {
   //1.four  connetion  property �Ĵ���������
   public static final String driver="com.mysql.jdbc.Driver";
   public static final String url="jdbc:mysql:///newss2229";
   public static final String username="root";
   public static final String password="root";
   //1.2 ����ӿ�
   Connection con ;//�����ͨ�����ݿ������
   PreparedStatement ps; //������Server����SQLָ��
   ResultSet rs; //��DB������һ��ʵʱ�Ķ�ȡ���ݵĹ���
  //2.get connection method  ��ȡ���ӵķ���
   public Connection getConnectionOld() throws Exception{
	   Class.forName(driver);
	   if (con==null||con.isClosed()) {
		   con  = DriverManager.getConnection(url, username, password);
	   }
	   return con;
   }
   public Connection getConnection() throws Exception{
	  Context ctx=new InitialContext();
	  DataSource ds= (DataSource)ctx.lookup("java:comp/env/jdbc/news");
	  if (con==null||con.isClosed()) {
		   con  = ds.getConnection();
	  }
	  return con;
   }
	
  //3.close all resource �ر���Դ�ķ���
   public void closeAllResources() throws Exception{
	    //alt+���¼�ͷ������codeλ��
	   if(rs!=null){
		   rs.close();
	   }
	   if(ps!=null){
		   ps.close();
	   }
	  if(con!=null){
		  con.close();
	  }
   }
	
  //4. execute update delte and insert method return  must be a int type  ,it means affect rows
   /**
    * 
    * @param sql  ��Ҫִ�е�sql
    * @param objs  �ɱ���� ���ӽ����ϴ��ݹ����Ĳ���������ȷ�� Object... objs
    * @return ��Ӱ������ ֻ��ִ�� CUD(create update delete)
    * @throws Exception Ԥ�е���DB�Ľ��������ܻ���һ������������Ԥ�������˶����쳣
    */
   public int executeUpdate(String sql,Object... objs) throws Exception{
	   getConnection();
	   ps=con.prepareStatement(sql);
	   for (int i = 0; i < objs.length; i++) {
		   ps.setObject(i+1, objs[i]);
	   }
	   int count = ps.executeUpdate();
	   return count;
   }
	
  //5. execute select method
   /**
    * 
    * @param sql  ��Ҫִ�е�sql
    * @param objs  �ɱ���� ���ӽ����ϴ��ݹ����Ĳ���������ȷ�� Object... objs
    * @return ��Ӱ������ ֻ��ִ�� CUD(create update delete)
    * @throws Exception Ԥ�е���DB�Ľ��������ܻ���һ������������Ԥ�������˶����쳣
    */
   public ResultSet executeQuery(String sql,Object... objs) throws Exception{
	   getConnection();
	   ps=con.prepareStatement(sql);
	   for (int i = 0; i < objs.length; i++) {
		   ps.setObject(i+1, objs[i]);
	   }
	    rs= ps.executeQuery();
	   return rs;
   }
	
	
	
}
