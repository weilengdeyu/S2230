<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8" />
	<title>管理控制台</title>
	<link rel="stylesheet" type="text/css" href="../css/common.css"/>
</head>
<frameset rows="120,*" cols="*" bordercolor="#008000">
	<frame src="${pageContext.request.contextPath }/admin/top.jsp">
	<frameset cols="206,*">
		<frame src="${pageContext.request.contextPath }/admin/admin-left.jsp">
		<frame src="${pageContext.request.contextPath }/admin/console.jsp" name="main_right">
	</frameset>
</frameset>
</html>