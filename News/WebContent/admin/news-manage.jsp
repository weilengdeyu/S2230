<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> --%>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<title></title>
		<link rel="stylesheet" type="text/css" href="../css/common.css" />
		<style type="text/css">
			body {
				font-family: 楷体;
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
	</head>

	<body>
	<%-- <jsp:include page="/newsManageServlet"></jsp:include> --%>
		<h3 class="head-manage">新闻管理</h3>
		<div class="show-info" align="center">
			<table border="1">
				<tr>
					<th>新闻编 号</th>
					<th>标题</th>
					<th>作者</th>
					<th>发布时间</th>
					<th colspan="2">管 理</th>
				</tr>
				<c:forEach items="${allArticle }" var="allArticle">
					<tr>
						<td>${allArticle.id }</td>
						<td>${allArticle.title }</td>
						<td>${allArticle.userid }</td>
						<%-- <td>${fn:substring(allArticle.pubtime, 0, 19)}</td> --%>
						<td><button onclick="upNews('${allArticle.id }')">修改</button></td>
						<td><button onclick="delNews('${allArticle.id }')">删除</button></td>
					</tr>
				</c:forEach>
			</table>
		</div>
		<script type="text/javascript">
			
			function delNews(id) {
				
				var r=confirm("是否删除");
				if (r==true)
				{
				   // x="你按下了\"确定\"按钮!";
				    location.href = "${pageContext.request.contextPath }/deleteNews?id="+id;
				}
				else
				{
				    //x="你按下了\"取消\"按钮!";
				}
			}
			function upNews(id) {
				location.href = "${pageContext.request.contextPath }/admin/upNews.jsp?id="+id;
			}
		</script>
	</body>

</html>