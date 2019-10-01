<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css">
<title>Stores</title>
<link rel='stylesheet'
	href='${pageContext.request.contextPath }/css/styles.css'
	type="text/css" />
</head>
<body>
	<section>
		<div>
			<div class="container" style="text-align: center">
				<h1>商家清單</h1>
			</div>
		</div>
	</section>
	<!-- 	<section> -->
	<%-- 		<c:forEach var='product' items='${stores }'> --%>
	<!-- 			<div> -->
	<%-- 				<p>商店編號：${store.id }</p> --%>
	<%-- 				<p>商店名稱：${store.name }</p> --%>
	<%-- 				<p>商店介紹：${store.detail }</p> --%>
	<%-- 				<p>目前狀態：${store.status }</p> --%>
	<!-- 			</div> -->
	<%-- 		</c:forEach> --%>
	<!-- 	</section> -->
	<section class="container">
		<c:forEach var='store' items='${stores }'>
			<div class="col-sm-6 col-md-3" style="width: 360px; height: 360px">
				<div class="thumbnail" style="width: 320px; height: 340px">
					<div class="caption">
						<p>
							<b style='font-size: 16px;'>${store.id }</b>
						</p>
						<p>商店名稱：${store.name }</p>
						<p>商店介紹：${store.detail }</p>
						<c:set var="status" scope="session" value="${store.status }" />
						<c:if test="${status == 1 }">
							<p>目前狀態：正常</p>
						</c:if>
						<c:if test="${status == 2 }">
							<p>目前狀態：禁用</p>
						</c:if>
						<c:if test="${status == 3 }">
							<p>目前狀態：關閉</p>
						</c:if>
						<p>
							<a href="<spring:url value='store?id=${store.id }' />"
								class="btn btn-primary">
								<span class="glyphicon-info-sigh glyphicon"></span>詳細資料
							</a>
							
							<a href="<spring:url value='store/Update?id=${store.id }' />" class="btn btn-primary">
								<span class="glyphicon-info-sigh glyphicon"></span>修改
							</a>
						</p>
					</div>
				</div>
			</div>
		</c:forEach>
	</section>
</body>
</html>