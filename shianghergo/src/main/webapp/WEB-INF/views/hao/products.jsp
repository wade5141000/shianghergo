<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css">
<title>Products</title>
<link rel='stylesheet' href='${pageContext.request.contextPath }/css/styles.css' type="text/css" />
</head>
<body>
	<section>
		<div>
			<div class="container" style="text-align: center">
				<h1>商品清單</h1>
			</div>
		</div>
	</section>
	<hr
		style="height: 1px; border: none; color: #333; background-color: #333;">
	<section class="container">
		<c:forEach var='product' items='${products }'>
			<div class="col-sm-6 col-md-3" style="width: 360px; height: 360px">
				<div class="thumbnail" style="width: 320px; height: 340px">
					<img width='100' height='200' src="<c:url value='/hao/getPicture/${product.id }' />"/>
					<div class="caption">
						<p>
							<b style='font-size: 16px;'>${product.name }</b>
						</p>
						<p>價格：${product.price }</p>
						<p>目前在庫數量：${product.reserve }</p>
						<p>
							<a href="<spring:url value='/hao/product?id=${product.id }' />"
								class="btn btn-primary">
								<span class="glyphicon-info-sigh glyphicon"></span>詳細資料
							</a>
							
							<a href="<spring:url value='/hao/product/Update?id=${product.id }' />" class="btn btn-primary">
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