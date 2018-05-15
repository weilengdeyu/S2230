<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
			
			#info-h3 {
				font-size: 40px;
				text-align: center;
				margin-top: 20px;
			}
			
			#show-info {
				font-size: 25px;
				width: 400px;
				margin: 0 auto;
				margin-top: 30px;
			}
			
			.username,
			.password,
			.favourite {
				width: 260px;
				height: 30px;
				font-size: 20px;
				border-radius: 5px;
				outline: none;
				border: 1px solid #666;
				line-height: 30px;
			}
			
			.note {
				font-size: 19px;
				list-style: none;
				resize: none;
				border-radius: 5px;
				outline: none;
				width: 290px;
			}
			
			.btsubmit {
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
			}
		</style>
	</head>

	<body>
		<%session.setAttribute("UserId", request.getParameter("id"));%>
		<%-- <jsp:include page="/selectOneServlet"></jsp:include> --%>
		<h3 id="info-h3">修改信息</h3>
		<div id="show-info">
			<form action="${pageContext.request.contextPath }/updateUserInfoServlet" method="post">
				<table>
					<tr>
						<td>
							<label>帐号:</label>
						</td>
						<td>
							<input class="username" type="text" name="username" placeholder="请输入帐号" value="${selectUserOne.username }" />
							<input type="hidden" name="id" value="${selectUserOne.id }">
							<br><span class="red" id="myUsername"></span>
						</td>
					</tr>
					<tr>
						<td>
							<label>密码:</label>
						</td>
						<td>
							<input class="password" type="password" name="password" placeholder="请输入密码" value="${selectUserOne.password }" />
						</td>
					</tr>
					<tr>
						<td>
							<label>性别:</label>
						</td>
						<td>
							<input id="sex1" type="Radio" name="sex" value="男" ${(selectUserOne.sex=='男')?'checked' : ''} /><label for="sex1">男</label>
							<input id="sex0" type="Radio" name="sex" value="女" ${(selectUserOne.sex=='女')?'checked' : ''} /><label for="sex0">女</label>
						</td>
					</tr>
					<tr>
						<td>
							<label>职业:</label>
						</td>
						<td>
							<select name="profession">
								<option value="学生" ${(selectUserOne.profession == "学生") ? 'selected="学生"' : '' }>学生</option>
								<option value="老师" ${(selectUserOne.profession == "老师") ? 'selected="老师"' : '' }>老师</option>
								<option value="校长" ${(selectUserOne.profession == "校长") ? 'selected="校长"' : '' }>校长</option>
							</select>
						</td>
					</tr>
					<tr>
						<td>
							<label>个人爱好:</label>
						</td>
						<td>
							<input class="favourite" type="text" name="favourite" value="${selectUserOne.favourite }" />
						</td>
					</tr>
					<tr>
						<td>
							<label>个人说明:</label>
						</td>
						<td>
							<textarea class="note" class="note" name="note" cols="35" rows="5">${selectUserOne.note }</textarea>
						</td>
					</tr>
					<tr>
						<td>
							<label>权限:</label>
						</td>
						<td>
							<%-- <input type="text" name="type" value="${selectUserOne.type }"> --%>
							<select name="type">
								<option value="" ${(selectUserOne.type == null) ? 'selected=""' : '' }></option>
								<option value="管理员" ${(selectUserOne.type == "管理员") ? 'selected="管理员"' : '' }>管理员</option>
								<option value="普通帐号" ${(selectUserOne.type == "普通帐号") ? 'selected="普通帐号"' : '' }>普通帐号</option>
							</select>
						</td>
					</tr>
					<tr>
						<td colspan="2" style="text-align: center;">
							<input class="btsubmit" type="submit" value="更新个人资料" onclick="btsubmit()" />
						</td>
					</tr>
				</table>
		</div>
	</body>

</html>