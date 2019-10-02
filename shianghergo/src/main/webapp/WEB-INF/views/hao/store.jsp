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
	<jsp:include page="../BlackLine.jsp" />
	<div style="padding-bottom: 350px;" >
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
			<div style="padding-left: 20px; padding-top: 30px;"
				class="card-footer text-muted">
				<%-- 				<h3>商家編號：${store.id}</h3> --%>
				<%-- 				<p>商店名稱:：${store.name}</p> --%>
				<%-- 				<p>商店介紹： ${store.detail}</p> --%>
				<a href="<spring:url value='store/Update?id=${store.id }' />"
					class="btn btn-primary">修改 </a> <a
					href="<spring:url value='/hao/stores' />" class="btn btn-primary">
					返回 </a>
			</div>
			
		</div>
		
	</div>
	<jsp:include page="/WEB-INF/views/eric/foot.jsp" />
</body>
</html>
