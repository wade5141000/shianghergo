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
<title>Store</title>

</head>
<body>
	<jsp:include page="/WEB-INF/views/eric/header.jsp" />


	<div style="padding-bottom: 50px;">
		<div style="padding-left: 350px; padding-right: 350px;"
			class="card text-center">
			<div class="card-header" style="margin-top: 25px; margin-top: 10px;">
				<h1>商店資訊</h1>
			</div>
			<div class="card-body">
				<p class="card-text">商家編號：${store.id}</p>
				<p class="card-text">商店名稱:${store.name}</p>
				<p class="card-text">商店介紹：${store.detail}</p>
				<p class="card-text">
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
			</div>
			<div style="padding-left: 20px; padding-top: 30px; height: 90px;"
				class="card-footer text-muted"></div>
		</div>
	</div>


	<div
		style="padding-bottom: 50px; margin-left: 265px; padding-right: 350px; padding-left: 85px">
		<div class="card">
			<h1 class="card-header" style="text-align: center">我的商品列表</h1>
		</div>
		<div class="card-deck">
			<c:forEach var='product' items='${products }' varStatus="status">
				<div class="card">
					<a href="<spring:url value='/hao/product?id=${product.id }' />">
						<img width='140' height='200'
						src="<c:url value='/hao/getPicture/${product.id }' />"
						class="card-img-top" alt="...">
					</a>
					<div class="card-body">
						<h5 class="card-title">品名:${product.name }</h5>
						<p class="card-text">說明：${product.detail }</p>
						<p class="card-text">說明：${product.id }</p>

					</div>
				</div>
				<c:if test="${(status.index % 5) == 4}">
		</div>
		<div class="card-deck">
			</c:if>
			<c:if test="${status.last}">
				<c:if test="${(status.index+1) % 5 != 0}">
					<c:forEach var='abc' items='${products}' varStatus="i">
						<c:if test="${i.index < -(((status.index+1)%5) -5)}">
							<div class="card" style="border: 1px solid white"></div>
						</c:if>
					</c:forEach>
				</c:if>
			</c:if>
			</c:forEach>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/eric/foot.jsp" />
</body>
</html>
