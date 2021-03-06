﻿<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>易买网 - 首页</title>
<link type="text/css" rel="stylesheet" href="css/style.css" />
<script type="text/javascript" src="scripts/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="scripts/function.js"></script>
<script type="text/javascript">
 function test(price){
   document.write("<form action='${pageContext.request.contextPath}/Buying' method='post' name='formx1' id='formx1' style='display:none'>");  
	document.write("<input type='hidden' name='price' value='"+price+"'/>");  
	document.write("</form>"); 
//document.formx1.submit();
document.getElementById("formx1").submit();  
 }

 
   //加入购物车
   function addInCart(){
	   location.href="${pageContext.request.contextPath}/CartServlet?proid=${pro.id}&rd="+Math.random();
   }
   
</script>

</head>
<body>
<c:if test="${categories==null}">
	 <jsp:forward page="/LeftBar?type=product-view"></jsp:forward>
</c:if>
<jsp:include page="top.jsp" />
<div id="position" class="wrap">
	您现在的位置：<a href="index.jsp">易买网</a> &gt; <a href="product-list.html">图书音像</a> &gt; 图书
</div>
<div id="main" class="wrap">
	
  <jsp:include page="/leftbar.jsp"></jsp:include>
	<div id="product" class="main">
		<h1>${pro.name}</h1>
		<div class="infos">
			<div class="thumb"><img src="images/product/${pro.fileName}" width="110" height="106" /></div>
			<div class="buy">
				商城价：<span class="price">￥<span id="myprice">${pro.price}</span></span><br />
				库　存：<c:if test="${pro.stock>0}">有货</c:if><c:if test="${pro.stock<=0}">无货</c:if>
			  <div class="button"><input type="button" name="button" value="" onclick="test(${pro.price})" /><a href="${pageContext.request.contextPath}/CartServlet?proid=${pro.id}">放入购物车2</a></div>
			</div>
			<div class="clear"></div>
		</div>
		<div class="introduce">
			<h2><strong>商品详情</strong></h2>
			<div class="text">
			${fn:substring(pro.description,0,20) }........
			
			</div>
		</div>
	</div>
	<div class="clear"></div>
</div>
<div id="footer">
	Copyright &copy; 2015 微冷的雨 All Rights Reserved. 京ICP证110号
</div>
</body>
</html>
