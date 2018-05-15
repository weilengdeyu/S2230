<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>登录-新闻系统</title>
		<link rel="stylesheet" href="css/com.css" />
		<link rel="stylesheet" type="text/css" href="css/login.css"/>
	</head>
	<body>
	<!-- 我是main -->
	<!-- branch1=====baranch1 -->
	    <%
	     /* Context ctx=new InitialContext();
	    
	    String result=(String)ctx.lookup("java:comp/env/happy2");
	     */
	    %>
	    
	     <%
	     Context ctx=new InitialContext();
	    
	     DataSource ds=(DataSource)ctx.lookup("java:comp/env/jdbc/news");
	     Connection con=ds.getConnection();
	    %>
	    
	    <%=con %>
		<div id="login">
			<h2>登录-新闻系统</h2>
			<form action="${pageContext.request.contextPath }/UserInfoServlet?oper=login" method="post">
				<table>
					<tr>
						<td>
							<label>帐号:</label>
						</td>
						<td>
							<input class="username" type="text" name="username" placeholder="请输入帐号" />
						</td>
					</tr>
					<tr>
						<td>
							<br />
						</td>
					</tr>
					<tr>
						<td>
							<label>密码:</label>
						</td>
						<td>
							<input class="password" type="password" name="password" placeholder="请输入密码" />
							<br><span class="red" id="myPassword"></span>
						</td>
					</tr>
					<tr>
						<td>验证码:</td>
						<td>
							<input class="verifycode" type="text" name="verifycode" placeholder="请输入验证码" />
							<img id="vfcodeimg" src="${pageContext.request.contextPath }/CodeServlet" alt="4353" style="margin-top: 20px" onclick="resetimg()" />
							<br />
							<br><span>${mess }</span>
						</td>
					</tr>
					<tr>
						<td colspan="2" style="text-align: center;">
							<!-- <input class="btsubmit" type="submit" value="登录" onclick="btsubmit()" /> -->
							<input class="btsubmit" type="submit" value="登录"" />
						</td>
					</tr>
				</table>
			</form>
		</div>
		<script type="text/javascript">
			function resetimg() {
				document.getElementById("vfcodeimg").src ="${pageContext.request.contextPath }/CodeServlet?"+ new Date().getTime();
			}
		</script>
	</body>
</html>
