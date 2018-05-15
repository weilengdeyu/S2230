<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<title>登录-新闻系统</title>
		<link rel="stylesheet" href="css/com.css" />
		<link rel="stylesheet" href="css/regist.css" />
	</head>

	<body>
		<div id="regist">
			<h1>注册-新闻系统</h1>
			<form action="${pageContext.request.contextPath }/registServlet " method="post">
				<table>
					<tr>
						<td>
							<label>帐号:</label>
						</td>
						<td>
							<input class="username" type="text" name="username" placeholder="请输入帐号" />
							<br><span class="red" id="myUsername"></span>
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
						<td>
							<label>确认密码:</label>
						</td>
						<td>
							<input class="ispassword" type="password" name="ispassword" placeholder="请输入确认密码" />
							<br><span class="red" id="myIsPassword"></span>
						</td>
					</tr>
					<tr>
						<td>
							<label>性别:</label>
						</td>
						<td>
							<input id="sex1" class="sex1" type="Radio" name="sex" value="男" /><label for="sex1">男</label>
							<input id="sex0" class="sex0" type="Radio" name="sex" value="女" /><label for="sex0">女</label>
							<br><span class="red" id="mySex"></span>
						</td>
					</tr>
					<tr>
						<td>
							<label>职业:</label>
						</td>
						<td>
							<select name="profession">
								<option value="学生">学生</option>
								<option value="老师">老师</option>
								<option value="校长">校长</option>
							</select>
						</td>
					</tr>
					<tr>
						<td>
							<label>个人爱好:</label>
						</td>
						<td>
							<input id="favourite1" type="checkbox" name="favourite" value="写代码" /><label for="favourite1">写代码</label>
							<input id="favourite2" type="checkbox" name="favourite" value="读书" /><label for="favourite2">读书</label>
							<input id="favourite3" type="checkbox" name="favourite" value="听音乐" /><label for="favourite3">听音乐</label>
						</td>
					</tr>
					<tr>
						<td>
							<label>个人说明:</label>
						</td>
						<td>
							<textarea class="note" name="note" cols="35" rows="5"></textarea>
						</td>
					</tr>
					<tr>
						<td>验证码:</td>
						<td>
							<input class="verifycode" type="text" name="verifycode" placeholder="请输入验证码" />
							<img id="vfcodeimg" src="${pageContext.request.contextPath }/CodeServlet?" onclick="resetimg()" alt="4353" style="line-height: 30px;" />
							<span style="line-height: 30px;">${mess }</span>
						</td>
					</tr>
					<tr>
						<td colspan="2" style="text-align: center;">
							<input class="btsubmit" type="submit" value="注 册" onclick="btsubmit()" />
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

<!--<script>
			function btsubmit() {
				if (myForm.username.value == "") {
					document.getElementById("myUsername").innerHTML = "请输入帐号";
					return;
				} else {
					document.getElementById("myUsername").innerHTML = "";
				}
				if (myForm.password.value.length <= 0) {
					document.getElementById("myPassword").innerHTML = "密码不正确";
					return;
				} else {
					document.getElementById("myPassword").innerHTML = "";
				}
				if (myForm.ispassword.value.length <= 0) {
					document.getElementById("myIsPassword").innerHTML = "确认密码不正确";
					return;
				} else {
					document.getElementById("myIsPassword").innerHTML = "";
				}
				myForm.submit();
			}
		</script>-->