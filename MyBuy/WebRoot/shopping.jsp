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
</head>
<body>
<jsp:include page="top.jsp" />
<div id="position" class="wrap">
	您现在的位置：<a href="index.jsp">易买网</a> &gt; 购物车
</div>
<div class="wrap">
	<div id="shopping">
		<form action="address.jsp" action="post">
			<table>
				<tr>
					<th>商品名称</th>
					<th>商品价格</th>
					<th>购买数量</th>
					<th>操作</th>
				</tr>
				
				<c:forEach var="item" items="${cart.map }">	
					<tr id="product_id_0">
						<td class="thumb"><input type="hidden" name="myid" id="myid" value="${item.value.product.id}"/><img src="images/product/${item.value.product.fileName}" /><a href="product-view.jsp">${item.value.product.name}</a></td>
						<td class="price" id="price_id_0">
							<span>${item.value.product.price }</span>
							<input type="hidden" value="${item.value.product.price}" />
						</td>
						<td class="number">
	                        <span name="del">-</span>
	                        
	                        <input id="number_id_0" type="text" name="number" value="${item.value.quantity}" />
	                        <span name="add">+</span>
						</td>
						<td class="delete"><a href="javascript:void(0)">删除</a></td>
					</tr>
               </c:forEach>
			</table>
            <div class="total"><span id="total">总计：￥0</span></div>
			<div class="button"><input type="submit" value="" /></div>
		</form>
	</div>
	<script type="text/javascript">
		//document.write("Cookie中记录的购物车商品ID："+ getCookie("product") + "，可以在动态页面中进行读取");
	</script>
</div>
<div id="footer">
	Copyright &copy; 2016 北大青鸟 All Rights Reserved. 京ICP证1000001号
</div>
</body>
</html>
