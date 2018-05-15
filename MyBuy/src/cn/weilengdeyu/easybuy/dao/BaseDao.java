package cn.weilengdeyu.easybuy.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

//数据库连接与关闭工具类
public class BaseDao {
	//1.1  驱动字符串常量	
   private final static String driver="com.microsoft.sqlserver.jdbc.SQLServerDriver";
   //1.2 url
   private final static String url="jdbc:sqlserver://localhost:1433;DatabaseName=easybuy";
   private static String user="sa";//用户名
   private static String password="6375196";//密码
   
   //1.3  创建和数据库交互的三大对象
   protected Connection con;      //连接对象
   protected PreparedStatement ps;//命令对象
   protected ResultSet rs;        //结果集对象（读取器对象）
   
   //1.4 获取数据库连接对象
   public Connection getConnection(){
	   try {
		   
		Class.forName(driver);
		//如果连接对象为空 ，或者连接被关闭，重新构建连接对象
		 if(con==null||con.isClosed()){
			 con=DriverManager.getConnection(url,user,password);
		 }
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		   return con;
   }
   
   
   //1.5  释放数据库连接对象
   public void closeAll(){
	   //若结果集对象不为空，则关闭
	   try{
		   if(rs!=null){
			   rs.close();
		   }
		   if(ps!=null){
			   ps.close();
		   }
		   if(con!=null){
			   con.close();
		   }
	   }catch(Exception ex){
		    ex.printStackTrace();
	   }
   }
   //1.6  写一个方法：执行增删改操作
   public boolean executeUpdate(String sql,Object...prams){
	   boolean result=false;
	   con=getConnection();
	   try {
		  ps=con.prepareStatement(sql);
		  for (int i = 0; i < prams.length; i++) {
			   ps.setObject(i+1, prams[i]);
		   }
		  int count=ps.executeUpdate();
		  if (count>0) {
			 result=true;
		   }
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			closeAll();
		}
      return result;
   }
   //1.7  写一个方法   ，执行查询操作
   public ResultSet executeSelect(String sql,Object...prams){
	   con=getConnection();
	   try {
		ps=con.prepareStatement(sql);
		for (int i = 0; i < prams.length; i++) {
			   ps.setObject(i+1, prams[i]);
		   }
		 rs=ps.executeQuery();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			//closeAll(con, ps, rs);
		}
	   return rs;
   }
   
}



