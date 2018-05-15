<%@ page language="java" import="java.util.*"  pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="lefter">
	<div class="box">
		<h2>商品分类</h2>
		<dl>
			<c:forEach items="${categories}" var="category">
				<c:if test="${category.id==category.parentId}">
					<dt>${category.name}</dt>
				</c:if>
				<c:if test="${category.id!=category.parentId}">
					<dd>
						<a href="Home?action=product_list&cateid=${category.id}">${category.name}</a>
					</dd>
				</c:if>
			</c:forEach>
		</dl>
	</div>
	<div class="spacer"></div>
	<div class="last-view">
		<h2>最近浏览</h2>
			<dl class="clearfix">
				<c:forEach items="${brolist}" var="product">
					<dt>
						<img style="width:30px;height:20px;"
							src="images/product/${product.fileName}" />
					</dt>
					<dd>
						<a href="Product?action=view&entityId=${product.id}">${product.name}</a>
					</dd>
				</c:forEach>
			</dl>
	</div>
</div>