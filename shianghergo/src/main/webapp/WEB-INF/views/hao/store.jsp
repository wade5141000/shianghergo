<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
<head>
<meta charset="UTF-8">

<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
<meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">
<link rel="stylesheet"
	href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css">
<title>Store</title>

<style type="text/css">
.layui-table {
	color: #252525;
	font-size: 20px;
}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/eric/header.jsp" />
	<jsp:include page="../BlackLine.jsp" />
	<section class="container">
		<table style="border-style: solid; margin-top: 25px;">
			<tr>
				<td></td>
				<td><h2>商店詳細資料</h2></td>
			</tr>
			<tr>
				<td><label class="item-label">商家編號：</label></td>
				<td><p>${store.id}</p></td>
			</tr>
			<tr>
				<td><label class="item-label">商店名稱:</label></td>
				<td><p>${store.name}</p></td>
			</tr>
			<tr>
				<td><label class="item-label">商店介紹：</label></td>
				<td><p>${store.detail}</p></td>
			</tr>
			<tr>
				<c:set var="status" scope="session" value="${store.status}" />
				<c:if test="${status==1 }">
					<p>商店狀態：正常</p>
				</c:if>
				<c:if test="${status==2 }">
					<p>商店狀態：禁用</p>
				</c:if>
				<c:if test="${status==3 }">
					<p>商店狀態：關閉</p>
				</c:if>
			</tr>
		</table>
		<%-- 				<h3>商家編號：${store.id}</h3> --%>
		<%-- 				<p>商店名稱:：${store.name}</p> --%>
		<%-- 				<p>商店介紹： ${store.detail}</p> --%>
		<div class="layui-btn-group">
			<a href="<spring:url value='store/Update?id=${store.id }' />"
				class="layui-btn"> <span class="glyphicon-info-sigh glyphicon"></span>修改
			</a> <a href="<spring:url value='/hao/stores' />" class="layui-btn">
				<span class="glyphicon-hand-left glyphicon"></span>返回
			</a>
		</div>

	</section>

	<jsp:include page="/WEB-INF/views/eric/foot.jsp" />
</body>
</html>
