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
<script type="text/javascript" src="scripts/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="scripts/function.js"></script>
</head>
<body>
<jsp:include page="top.jsp" />
<div id="position" class="wrap">
	您现在的位置：<a href="index.jsp">易买网</a> &gt; 在线留言
</div>
<div id="main" class="wrap">
	<c:if test="${categories==null}">
	 <jsp:forward page="/LeftBar?type=guestbook"></jsp:forward>
  </c:if>
      <jsp:include page="/leftbar.jsp"></jsp:include>
	<div class="main">
		<div class="guestbook">
			<h2>全部留言</h2>
			<ul>
				<li>
					<dl>
						<dt>那个什么衣服贵吗</dt>
						<dd class="author">网友：张三丰 <span class="timer">2010:10:10 20:00:01</span></dd>
						<dd>不贵</dd>
					</dl>
				</li>
				<li>
					<dl>
						<dt>那个什么衣服贵吗</dt>
						<dd class="author">网友：张三丰 <span class="timer">2010:10:10 20:00:01</span></dd>
						<dd>不贵</dd>
					</dl>
				</li>
				<li>
					<dl>
						<dt>那个什么衣服贵吗</dt>
						<dd class="author">网友：张三丰 <span class="timer">2010:10:10 20:00:01</span></dd>
						<dd>不贵</dd>
					</dl>
				</li>
			</ul>
			<div class="clear"></div>
			<div class="pager">
				<ul class="clearfix">
					<li><a >首页</a></li>
					<li>...</li>
					<li><a >4</a></li>
					<li class="current">5</li>
                    <li><a >6</a></li>
                    <li>...</li>
					<li><a >尾页</a></li>
				</ul>
			</div>
			<div id="reply-box">
				<form id="guestBook">
					<table>
						<tr>
							<td class="field">昵称：</td>
							<td><input class="text" type="text" name="guestName" disabled="disabled" value="当前用户名"/></td>
						</tr>						
						<tr>
							<td class="field">留言内容：</td>
							<td><textarea name="guestContent"></textarea><span></span></td>
						</tr>
						<tr>
							<td></td>
							<td><label class="ui-blue"><input type="submit" name="submit" value="提交留言" /></label></td>
						</tr>
					</table>
				</form>
			</div>
		</div>
	</div>
	<div class="clear"></div>
</div>
<div id="footer">
	Copyright &copy; 2013 北大青鸟 All Rights Reserved. 京ICP证1000001号
</div>
</body>
</html>
