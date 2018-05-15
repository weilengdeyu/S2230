<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <link rel="stylesheet" href="layer/skin/layer.css" type="text/css"></link>
    <style type="text/css">
       #mya{
         cursor:pointer;
       }
    </style>
<script type="text/javascript" src="scripts/jquery-1.11.1.min.js"></script>

<script type="text/javascript" src="scripts/function.js"></script>
<script type="text/javascript" src="layer-v2.4/layer/layer.js"></script>

<script type="text/javascript" src="jquery-easyui-1.4.2/jquery.easyui.min.js"></script>
<link rel="stylesheet" href="jquery-easyui-1.4.2/themes/default/easyui.css" type="text/css"></link>
<link rel="stylesheet" href="jquery-easyui-1.4.2/themes/icon.css" type="text/css"></link>

<script type="text/javascript">
  $(function(){
	 
	  $("#mya").click(function(){
		  layer.open({
			  close:function(index){
				  alert('aa');
			  },
			  closeBtn: 1, //不显示关闭按钮
			  type: 2, 
			  area: ['700px', '500px'],
			  content: ['login.jsp', 'no'] //这里content是一个URL，如果你不想让iframe出现滚动条，你还可以content: ['http://sentsin.com', 'no']
		  }); 
	  });
	  
	  
  });
</script>
  <div id="header" class="wrap" >
  <div class="top-bg">
    <!-- 00.易买网logo -->
	<div id="logo"><img src="${pageContext.request.contextPath}/images/logo.gif" /></div>
	<!-- 01.Start 右侧工具导航条 -->
	<div class="help">
	
		<a href="CartServlet" class="shopping" id="shoppingBag">购物车<c:out value="" default="0"/>件</a>
		<!-- 导航条显示的内容必须经过严格判定 -->
		<c:if test="${sessionScope.loginuser!=null }">
	    	<a class="button" id="logout" href="Login?action=logout">注销</a>
		</c:if>
		<c:if  test="${sessionScope.loginuser==null}" >
			<a href="login.jsp">登录</a>
			<%--<a id="mya">登录</a>
		--%></c:if>
		<a href="register.jsp">注册</a>
		<c:if test="${sessionScope.loginuser!=null }">
			<a href="guestbook.jsp">留言</a>
	    	<a href="manager/index.jsp">后台管理</a>
		</c:if>
	</div>
	<!-- 01.end 右侧工具导航条结束-->
	
	
	<!-- 02.Start 分类导航条 -->
	<div class="navbar">
		<ul class="clearfix">
			<li class="current"><a href="Home">首页</a></li>
			<li><a href="#">图书</a></li>
			<li><a href="#">百货</a></li>
			<li><a href="#">品牌</a></li>
			<li><a href="#">促销</a></li>
		</ul>
	</div>
	<!-- 02.End 分类导航条 -->
	</div>
</div>

<!-- 03.Start 分类导航条子项 -->
<div id="childNav">
	<div class="wrap">
		<ul class="clearfix">
			<li class="first"><a href="#">音乐</a></li>
			<li><a href="#">影视</a></li>
			<li><a href="#">少儿</a></li>
			<li><a href="#">动漫</a></li>
			<li><a href="#">小说</a></li>
			<li><a href="#">外语</a></li>
			<li><a href="#">数码相机</a></li>
			<li class="last"><a href="#">笔记本</a></li>
		</ul>
	</div>
</div>
<!-- 03.End 分类导航条子项结束 -->