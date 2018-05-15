<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>易买网 - 首页</title>
<link type="text/css" rel="stylesheet" href="css/style.css" />
<link type="text/css" rel="stylesheet" href="css/PageDataStyle.css" />
<script type="text/javascript" src="scripts/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="scripts/function.js"></script>
</head>
<body>
<!--<div id="welcomeImage">
   <img width="100%" height="150" src="images/banner.jpg" alt="welcome">
</div>-->

 <c:if test="${categories==null}">
    <jsp:forward page="/Home"></jsp:forward>
 </c:if>
<jsp:include page="top.jsp" />
<div id="main" class="wrap">
	<jsp:include page="leftbar.jsp" />
	
	<div class="main">
		<div class="price-off">
            <div class="slideBox">
                <ul id="slideBox">
                    <li><img src="images/product/banner_1.jpg"/></li>
                    <li><img src="images/product/banner_2.jpg"/></li>
                    <li><img src="images/product/banner_3.jpg"/></li>
                    <li><img src="images/product/banner_4.jpg"/></li>
                </ul>
            </div>
			<h2>商品列表</h2>
			<ul class="product clearfix">
			<c:if test="${fn:length(list.proList)==0}">
				             无任何商品！
			</c:if>
				<c:forEach var="item" items="${list.proList}">
				  <li>
					<dl>
						<dt><a href="${pageContext.request.contextPath}/ProductDetails?id=${item.id}"  target="_self"><img src="images/product/${item.fileName}" /></a></dt>
						<dd class="title"><a href="" target="_self">${item.name}</a></dd>
						<dd class="price">${item.price}</dd>
					</dl>
				</li>
				</c:forEach>
			</ul>
			
			<div class="pager">
				<ul class="clearfix">					
					<c:if test="${list.totalPages>=1}">	
					<li><a href="${pageContext.request.contextPath}/Home?PageIndex=1&cateid=<c:if test="${ empty cateid}">1</c:if><c:if test="${not empty cateid}">${cateid }</c:if>">首页</a></li>	
					<!-- 上一页-->	
					  <!-- 显示分页码-->
					
					  <li>
					   <c:forEach  begin="${list.listbegin}" end="${list.listened}" var="i" varStatus="status">
					   
					       <c:choose>
                           <c:when test="${list.currentPage eq status.index}">
                              <span class="paginator">
                             	 <a style="color: #f60;">[${i}]</a>
                              </span>
                           </c:when>
                           <c:otherwise>
                               <span><a href="${pageContext.request.contextPath}/Home?PageIndex=${i}&cateid=<c:if test="${ empty cateid}">1</c:if><c:if test="${not empty cateid}">${cateid }</c:if>">${i}</a></span>
                           </c:otherwise>
                        </c:choose>
					  </c:forEach>
					  </li>
					<!-- 尾页 -->			
					<li><a href="${pageContext.request.contextPath}/Home?PageIndex=<c:out value='${list.totalPages}'/>&cateid=<c:if test="${ empty cateid}">1</c:if><c:if test="${not empty cateid}">${cateid }</c:if>">尾页 </a></li>
					</c:if>									
				</ul>
			</div>
		</div>
		<div class="side">			
			<div class="spacer"></div>
			<div class="news-list">
				<h4>新闻动态</h4>
				<ul>
					<li><a href="news-view.html"  target="_self">求学若渴，好学若饥</a></li>
					<li><a href="news-view.html"  target="_self">求学若渴，好学若饥</a></li>
				</ul>
			</div>
		</div>
		<div class="spacer clear"></div>
    </div>
</div>
<div id="footer">
	Copyright &copy; 2015 微冷的雨 All Rights Reserved. 京ICP证110号
</div>
</body>
</html>
