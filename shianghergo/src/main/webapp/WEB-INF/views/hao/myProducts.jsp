<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
<head>
<meta charset="UTF-8">
<title>myProducts</title>
<link rel="stylesheet"
	href="http://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
<script src="http://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
<script
	src="http://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/res/static/css/main.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/res/layui/css/layui.css">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/res/layui/layui.js"></script>
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
<meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">
<style>
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/eric/header.jsp"></jsp:include>

	<section>
		<div>
			<div class="container" style="text-align: center">
				<h1>您的商品清單</h1>
			</div>
		</div>
	</section>
	<hr
		style="height: 1px; border: none; color: #333; background-color: #333;">
	<section class="container">
		<c:forEach var='product' items='${products }'>
			<div class="col-sm-6 col-md-3" style="width: 360px; height: 360px;">
				<div class="thumbnail"
					style="width: 250px; height: 340px; border:solid 1px gray;">
					<div style="padding-bottom: 5px; text-align: center;">
						<img width='140' height='200'
							src="<c:url value='/hao/getPicture/${product.id }' />" />
					</div>
					<div class="caption" style="text-align: center">
						<p>
							<b style='font-size: 16px;'>${product.name }</b>
						</p>
						<p>價格：${product.price }</p>
						<p>說明：${product.detail }</p>
						<p>
							<a
								href="<spring:url value='/hao/product/Update?id=${product.id }' />"
								class="btn btn-primary"> 修改 </a>
						</p>
					</div>
				</div>
			</div>
		</c:forEach>
	</section>
	<jsp:include page="/WEB-INF/views/eric/foot.jsp" />
</body>
</html>