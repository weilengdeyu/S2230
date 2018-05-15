<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<title></title>
		<link rel="stylesheet" href="../css/common.css" />
		<style type="text/css">
			body {
				font-family: "楷体";
			}
			
			.head-manage {
				font-size: 40px;
				text-align: center;
				margin-top: 20px;
			}
			
			#show-info .title {
				width: 100%;
				height: 40px;
				font-size: 30px;
				border-radius: 5px;
				outline: none;
				border: 1px solid #666;
				padding: 10px;
				box-sizing: border-box;
				color: #333;
			}
			
			.content {
				list-style: none;
				resize: none;
				border-radius: 5px;
				outline: none;
			}
			
			.bt {
				margin-top: 15px;
				display: inline-block;
				padding: 6px 25px;
				margin-bottom: 0;
				font-size: 18px;
				line-height: 1.428571429;
				border-radius: 4px;
				color: #fff;
				background-color: #666;
				border-color: #999;
				text-align: center;
			}
		</style>
	</head>

<body>
	<h3 class="head-manage">新闻修改</h3>
	<%session.setAttribute("NewsId", request.getParameter("id"));%>
	<%-- <jsp:include page="/selectNews"></jsp:include> --%>
	<div id="show-info" align="center">
		<form action="${pageContext.request.contextPath }/newsPullServlet" method="post">
			<table>
				<tr>
					<td><input class="title" type="text" name="title" value="${upNews.title }"
						placeholder="新闻标题" /></td>
				</tr>
				<tr>
					<td><textarea class="content" name="content" cols="150"
							rows="23">${upNews.content }</textarea></td>
				</tr>
				<tr>
					<td align="center">
						<input class="bt" type="submit" value="更新文章" />
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>

</html>