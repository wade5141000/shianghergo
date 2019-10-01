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
<style>
.stores-bg {
	width: 100%;
	background-image: url('https://i.imgur.com/M2GUC3c.jpg'); no-repeat;
	background-size: cover;
}

.thumbnail {
	vertical-align: text-bottom;
}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/eric/header.jsp"></jsp:include>
	<div class="stores-bg">
		<section>
			<div>
				<div class="container" style="text-align: center; padding:20px;">
					<h1>商家清單</h1>
				</div>
			</div>
		</section>
		
		<section class="container">
			<c:forEach var='store' items='${stores }'>
				<div class="col-sm-6 col-md-3" style="width: 360px; height: 260px;">
					<div class="thumbnail" style="width: 320px; height: 240px;">
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

						</div>
						<div style="text-align:right">
							<a href="<spring:url value='store?id=${store.id }' />"
								class="btn btn-primary">詳細資料
							</a> <a href="<spring:url value='store/Update?id=${store.id }' />"
								class="btn btn-primary">修改
							</a>
						</div>
					</div>
				</div>
			</c:forEach>
		</section>
	</div>
	<jsp:include page="/WEB-INF/views/eric/foot.jsp"></jsp:include>
</body>
</html>