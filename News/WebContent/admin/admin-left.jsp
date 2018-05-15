<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> --%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
		<link rel="stylesheet" type="text/css" href="../css/common.css"/>
		<style type="text/css">
			#nav {
				width: 100%;
				position: relative;
			}
			#nav tr {
				
			}
			#nav ul li {
				margin-top: 5px;
			}
			#nav ul li a {
				display: block;
				font-size: 20px;
				border-radius: 10px;
				font-size: 30px;
				color: #333;
				text-align: center;
				background: url(../img/wenliku.com-240-sos.png);
				font-family: "楷体";
			}
			#nav ul li a:hover {
				color: #fff;
				background: #333;
				opacity: 0.8;
			}
		</style>
	</head>
	<body>
		
		<div id="nav">
			<ul>
				<li><h3 align="center" style="font-size: 25px;">新闻管理</h3></li>
				<hr />
				<li><a href="${pageContext.request.contextPath }/admin/console.jsp" target="main_right">控 制 台</a></li>
				<li><a href="${pageContext.request.contextPath }/admin/news-pull.jsp" target="main_right">新闻发布</a></li>
				<li><a href="${pageContext.request.contextPath }/admin/news-manage.jsp" target="main_right">新闻管理</a></li>
				<li><h3 align="center" style="font-size: 25px;">帐号管理</h3></li>
				<hr />
				<c:if test="${myUser.type == '管理员'}">
				<li><a href="${pageContext.request.contextPath }/UserInfoServlet?oper=list" target="main_right">帐号管理</a></li>
				</c:if>
				<li><a href="${pageContext.request.contextPath }/admin/user-info.jsp" target="main_right">个人信息</a></li>
			</ul>
		</div>
	</body>
</html>
