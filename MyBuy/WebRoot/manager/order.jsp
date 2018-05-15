<%@ page language="java" import="java.util.*"contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>后台管理 - 易买网</title>
<link type="text/css" rel="stylesheet" href="../css/style.css" />
<script type="text/javascript" src="../scripts/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="../scripts/function.js"></script>
<script type="text/javascript">
  function test(tt){
	  //准备好要更新的值
	  //
  }
</script>
</head>
<body>
<div id="header" class="wrap">
	<div id="logo"><img src="../images/logo.gif" /></div>
	<div class="help"><a href="../index.html">返回前台页面</a></div>
	<div class="navbar">
		<ul class="clearfix">
			<li><a href="index.html">首页</a></li>
			<li><a href="user.html">用户</a></li>
			<li><a href="product.html">商品</a></li>
			<li class="current"><a href="order.html">订单</a></li>
			<li><a href="guestbook.html">留言</a></li>
			<li><a href="news.html">新闻</a></li>
		</ul>
	</div>
</div>
<div id="childNav">
	<div class="welcome wrap">
		管理员pillys您好，今天是2012-12-21，欢迎回到管理后台。
	</div>
</div>
<div id="position" class="wrap">
	您现在的位置：<a href="index.html">易买网</a> &gt; 管理后台
</div>
<div id="main" class="wrap">
	
	<jsp:include page="leftbar.jsp" />
	
	<div class="main">
		<h2>订单管理</h2>
		<div class="manage">
			<div class="search">				
			</div>
			<div class="spacer"></div>
            <form id="orderForm" method="post"  action="Order">
                 订单号：<input type="text" class="text" name="entityId" id="entityId" />
                 订货人：<input type="text" class="text" name="userName" />
                 <label class="ui-blue"><input type="submit" name="submit" value="查询" /></label>
            </form>
			<table class="list">
				<tr>
					<th colspan="2">单号：1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 时间：2013-3-16</th>					
					<th colspan="2">状态:收货确认</th>					
				</tr>
				<tr>
					<td class="first w4 c"><img src="../images/product/1.jpg" />画册</td>
					<td >100</td>
					<td>1</td>
					<td class="w1 c" rowspan="2">总计：140</td>					
				</tr>
				<tr>
					<td class="first w4 c"><img src="../images/product/2.jpg" />项链</td>
					<td >40</td>
					<td>1</td>			
				</tr>
                	<tr>
					<th colspan="2">单号：2 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;时间：2013-5-16</th>
					<th colspan="2">状态:待审核<select name="status" onchange="test(oldvalue,this.value)">						    
								<option value="1"  >待审核</option>
								<option value="2"  >审核通过</option>
								<option value="3"  >配货</option>
								<option value="4" >发货</option>
								<option value="5"  >收货确认</option>
							
						</select></th>					
				</tr>
				<tr>
					<td class="first w4 c"><img src="../images/product/3.jpg" />护肤王</td>
					<td >400</td>
					<td>1</td>
					<td class="w1 c">总计：400</td>					
				</tr>				
			</table>
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
		</div>
	</div>
	<div class="clear"></div>
</div>
<div id="footer">
	Copyright &copy; 2013 北大青鸟 All Rights Reserved. 京ICP证1000001号
</div>
</body>
</html>
