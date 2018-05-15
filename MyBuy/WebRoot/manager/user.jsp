<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>后台管理 - 易买网</title>
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/scripts/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/scripts/function.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/scripts/jquery.unobtrusive-ajax.min.js"></script>
<script type="text/javascript">
  function mydel(id){
	var url="${pageContext.request.contextPath}/UserDel?id="+id;
	
	
	 $.ajax({
     	url:url,
     	type:"post"
     })
	 
  }
</script>
</head>
<body>

<!-- 这里top.jsp页面的引入 -->
<jsp:include page="top.jsp" />

<div id="position" class="wrap">
	您现在的位置：<a href="index.html">易买网</a> &gt; 管理后台
</div>
<div id="main" class="wrap">
	<jsp:include page="leftbar.jsp" />
		<div class="main">
		<h2>用户管理</h2>
		<div class="manage">
			<table class="list">
				<tr>
					<th>用户名</th>
					<th>真实姓名</th>
					<th>性别</th>
					<th>Email</th>
					<th>手机</th>
					<th>操作</th>
				</tr>
				<c:forEach var="item" items="${list.userList}">
				  <tr>
					
					    <td class="first w4 c">${item.userId}</td>
					    <td class="w1 c">${item.userName}</td>
					    <td class="w2 c">${item.male}</td>
					    <td>${item.email}</td>
					    <td class="w4 c">${item.mobile}</td>
					    <td class="w1 c"><a href="">修改</a> 
					    <a class="manageDel" href="javascript:mydel('${item.userId}')">删除</a></td>

					
				</tr>
				</c:forEach>
				
			</table>
		</div>
	</div>
	<div class="clear"></div>
     <div class="pager">
				<ul class="clearfix">					
					<c:if test="${list.totalPages>=1}">	
					<li><a href="${pageContext.request.contextPath}/UserServlet?PageIndex=1">首页</a></li>	
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
                               <span><a href="${pageContext.request.contextPath}/UserServlet?PageIndex=${i}">${i}</a></span>
                           </c:otherwise>
                        </c:choose>
					  </c:forEach>
					  </li>
					<!-- 尾页 -->			
					<li><a href="${pageContext.request.contextPath}/UserServlet?PageIndex=<c:out value='${list.totalPages}'/>">尾页 </a></li>
					</c:if>									
				</ul>
			</div>
</div>
<div id="footer">
	Copyright &copy; 2013 北大青鸟 All Rights Reserved. 京ICP证1000001号
</div>
</body>
</html>
