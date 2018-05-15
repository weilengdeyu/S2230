<%@page import="cn.news.util.PageUtil"%>
<%@page import="cn.news.entity.UserInfo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link rel="stylesheet" type="text/css" href="../css/common.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/layui/css/layui.css" />
<script type="text/javascript"
	src="${pageContext.request.contextPath }/layui/jQuery1.11.1.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/layui/layui.js"></script>
<style type="text/css">
tr {
	text-align: center;
}

body {
	font-family: 楷体;
}

table {
	border-collapse: collapse;
	width: 55%;
}

.head-manage {
	font-size: 40px;
	text-align: center;
	margin-top: 20px;
}

.show-info {
	margin-top: 15px;
	font-size: 20px;
}
</style>
<script type="text/javascript">
	function del(uid) {
		var flag = confirm('大爷，您确定要删除该条记录吗？');
		if (flag) {
			//user clike the confirm button
			var path = '${pageContext.request.contextPath}/UserInfoServlet?oper=del&uid='
					+ uid;
			location.href = path;
		}
	}

	$(function() {
		$("#direction")
				.click(
						function() {

							var path = "${pageContext.request.contextPath}/UserInfoServlet?oper=list&pageIndex="
									+ $("[name=despage]").val();
							location.href = path;
						});
	});

	function nextPage(pageIndex) {
		var uname = $("[name=uname]").val();
		var path = "${pageContext.request.contextPath}/UserInfoServlet?oper=list&pageIndex="
				+ pageIndex;
		location.href = path;
	}
</script>

</head>
<body style="">
	<%-- 		<jsp:include page="/userManageServlet"></jsp:include> --%>
	<h3 class="head-manage">
		您正在操作的是【用户管理 】<a class="layui-btn" href="UserInfoServlet?oper=addUser">添加用户</a>
	</h3>

	<div class="show-info" align="center">
		<form
			action="${pageContext.request.contextPath}/UserInfoServlet?oper=find"
			method="post">
			请输入用户名：<input type="text" name="uname" value="${uname }" /> <input
				type="submit" value="查询" />
		</form>
		<table border="1">
			<tr>
				<th>姓名</th>
				<th colspan="2">管 理</th>
			</tr>
			<c:forEach items="${pageUtil.list}" var="info">
				<tr>
					<td>${info.uname}</td>
					<td><a href="${pageContext.request.contextPath}/UserInfoServlet?oper=UpdateUser&uid=${info.uid}">修改</a>
						&nbsp;&nbsp;&nbsp;<a href="javascript:del(${info.uid})">删除</a></td>
				</tr>
			</c:forEach>
		</table>
		<!-- 分页区域 -->
		<div id="pagenation" style="margin-top: 10px;">
			<a
				href="${pageContext.request.contextPath}/UserInfoServlet?oper=list&pageIndex=1">首页</a>&nbsp;
			<a
				href="${pageContext.request.contextPath}/UserInfoServlet?oper=list&pageIndex=${pageUtil.pageIndex-1}">上一页</a>&nbsp;
			<a href="javascript:nextPage(${pageUtil.pageIndex+1})">下一页</a> &nbsp;<a
				href="${pageContext.request.contextPath}/UserInfoServlet?oper=list&pageIndex=${pageUtil.totalPages}">尾页</a>跳转到:<input
				name="despage" value="${pageUtil.pageIndex==1?" ":pageUtil.pageIndex}"/>
			<input id="direction" type="button" value="跳转" /><label>【${pageUtil.pageIndex}/${ pageUtil.totalPages}页】</label>
		</div>
		<script type="text/javascript">
			
			function delUser(id) {
				var r=confirm("是否删除");
				if (r==true)
				{
				   // x="你按下了\"确定\"按钮!";
				    location.href = "${pageContext.request.contextPath }/deleteUserOne?id="+id;
				}
				else
				{
				    //x="你按下了\"取消\"按钮!";
				}
			}
			function upUser(id) {
				location.href = "${pageContext.request.contextPath }/admin/update-info.jsp?id="+id;
			}
		}
		function upUser(id) {
			location.href = "${pageContext.request.contextPath }/admin/update-info.jsp?id="
					+ id;
		}
	</script>
</body>
</html>
