<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
		<link rel="stylesheet" type="text/css" href="../css/common.css"/>
		<style type="text/css">
			#logo {
				line-height: 120px;
				font-size: 36px;
				padding-left: 20px;
				color: #666;
				float: left;
			}
			#nav {
				float: right;
			}
			#nav .nav-contnt li{
				float: left;
				margin-top: 25px;
				margin-right: 20px;
			}
			#nav .nav-contnt a {
				color: #333;
				font-size: 20px;
				font-family: "楷体";
				font-weight: 600;
				padding: 10px 15px 10px 15px;
				background: url(../img/wenliku.com-240-sos.png);
				border-radius: 10px;
			}
			#nav .nav-contnt a:hover {
				background: #333;
				opacity: 0.5;
				color: #fff;
			}
		</style>
	</head>
	<body>
		<div id="logo">
			<h2 style="">新闻管理系统</h2>
		</div>
		<div id="nav">
			<ul class="nav-contnt">
				<li><a href="###">首页</a></li>
				<li><a href="${pageContext.request.contextPath }/UserInfoServlet?oper=logOut" target="_top">退出</a></li>
				<li><a href="###">关于</a></li>
			</ul>
		</div>
	</body>
</html>
