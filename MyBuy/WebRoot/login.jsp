<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<title>易买网 - 登录</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link type="text/css" rel="stylesheet" href="css/style.css" />
<script type="text/javascript" src="skygqCheckAjaxForm.1.2/demo/jquery-1.4.4.min.js"></script>
<script type="text/javascript" src="layer-v2.4/layer/layer.js"></script>
<script type="text/javascript" src="scripts/jquery.skygqCheckAjaxform.1.3.js"></script>
<script type="text/javascript" src="scripts/function.js"></script>

<!-- 统一认证 -->
<script type="text/javascript" src="http://qzonestyle.gtimg.cn/qzone/openapi/qc_loader.js" data-appid="100229030" charset="utf-8">
</script>

<script type="text/javascript">
  function getToken(){
    if(QC.Login.check()){//如果已登录
		QC.Login.getMe(function(openId, accessToken){
		alert(["当前登录用户的", "openId为："+openId, "accessToken为："+accessToken].join("\n"));
	});
	}
  }
</script>

<script type="text/javascript">
	
	
	/*$(function(){
		var items_array2 = [
			{ name:"userId",type:"username",simple:"用户名",focusMsg:'数字和英文及下划线和.的组合，开头为字母，4-20个字符'},
			{ name:"password",type:'password',simple:"密码",focusMsg:'最小长度:6 最大长度:16'},
			
			{ name:"code",simple:"Email",focusMsg:'请填写真实并且最常用的邮箱'}
		];
		
		$("#form1").skygqCheckAjaxForm({
			items: items_array2,
			isAjaxSubmit:true,
			url:"/MyBuy/Login?action=login",
			type:"post",
			success:function(data2){
	      		parent.location.href="/MyBuy/Home";
	      		parent.layer.close(index);
	      	    
	      	}
					
		});
	
		
	});*/
 
  $(function(){
	  
  });
  function reloadCode(){
    document.getElementById('safeCode').src='${pageContext.request.contextPath}/Num?code='+Math.random();
  }
  //测试生成的随机验证码
  function aa(){
     
     document.getElementsByTagName("title")[0].innerHTML='${numrand}';
     alert(document.getElementsByTagName("title")[0].innerHTML);
  }

</script>
</head>
<body class="easyui-layout">
<!-- 静态导入，与当前页面合并。两个页面的代码在一个页面里,复用顶部的代码-->
 <div region="north" border="true" split="false" style="overflow: hidden; height: 120px;">
<%@ include file="top.jsp" %>
</div>
<div id="register" class="wrap">
	<div class="shadow">
		<div class="box">
			<h1>欢迎回到【微冷的雨】易买网</h1>
			<form id="loginForm" method="post" action="${pageContext.request.contextPath }/Login?action=login&returnUrl=${returnUrl}">
				<table>
					<tr>
						<td class="field">用户名：</td>
						<td>
                            <input class="text" type="text" id="userId" name="userId"  value="admin" />
                            <span></span>
						</td>
					</tr>
					<tr>
						<td class="field">登录密码：</td>
						<td>
                            <input class="text" type="password" id="password" name="password" value="${password}" />
							<c:if test="${not empty errors && not empty errors['userId']}">
								<span class="error">${errors['userId']}</span>
							</c:if>
							<c:if test="${empty errors || empty errors['userId']}"><span></span></c:if>
						</td>
					</tr>
					<tr>
					   <td class="field">验证码：</td>
						<td>
                            <img src="${pageContext.request.contextPath}/Num" id="safeCode"/><a onclick="reloadCode()" href="javascript:void(0)">看不清，换一张</a><br>
	                        <input type="text" name="code" id="code">
	                       <c:if test="${not empty errors && not empty errors['mess']}">
								<span class="error">${errors['mess']}</span>
							</c:if>
							<c:if test="${empty errors || empty errors['mess']}"><span></span></c:if>
							<c:if test="${not empty errors && not empty errors['code']}">
								<span class="error">${errors['code']}</span>
							</c:if>
							<c:if test="${empty errors || empty errors['code']}"><span></span></c:if>
						</td>
					</tr>
					<tr>
						<td></td>
					<!-- 统一认证开始代码 -->	
					<span id="qqLoginBtn"></span>
					<script type="text/javascript">
						QC.Login({
							btnId:"qqLoginBtn"	//插入按钮的节点id
						});
						
	
					</script>
					<!-- 统一认证结束代码 -->
					 <input type="button" onclick="getToken()" value="获取"/>
						<td><label class="ui-green"><input type="submit" name="submit" value="立即登录" id="btnLogin" /></label></td>
					</tr>
				</table>
			</form>
			
		</div>
	</div>
	<div class="clear"></div>
</div>
<div id="footer">
	Copyright &copy; 2015 Happy All Rights Reserved. 京ICP证1000001号
	
</div>
</body>
</html>
