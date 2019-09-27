<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css">
<title>Store</title>
<link rel='stylesheet'
	href='${pageContext.request.contextPath }/css/styles.css'
	type="text/css" />
</head>
<body>
	<section>
		<div>
			<div class="container" style="text-align: center">
				<h2>商店詳細資料</h2>
			</div>
		</div>
	</section>
	<section class="container">
		<div class="row">
			<div class="col-md-5">
				<h3>商家編號：${store.id}</h3>
				<p>商店名稱:：${store.name}</p>
				<p>商店介紹： ${store.detail}</p>
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

				<p>
					<a href="<spring:url value='store/Update?id=${store.id }' />"
						class="btn btn-primary"> <span
						class="glyphicon-info-sigh glyphicon"></span>修改
					</a> <a href="<spring:url value='/hao/stores' />"
						class="btn btn-default"> <span
						class="glyphicon-hand-left glyphicon"></span>返回
					</a>
				</p>
			</div>
		</div>
	</section>
</body>
</html>
