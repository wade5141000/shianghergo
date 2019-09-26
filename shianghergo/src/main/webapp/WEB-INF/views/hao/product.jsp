<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css">
<title>Product</title>
<link rel='stylesheet' href='${pageContext.request.contextPath }/css/styles.css' type="text/css" />
</head>
<body>
	<section>
		<div>
			<div class="container" style="text-align: center">
				<h2>產品資料</h2>
			</div>
		</div>
	</section>
	<section class="container">
		<div class="row">
			<img width='100' height='150' src="<c:url value='/hao/getPicture/${product.id }' />" />
			<div class="col-md-5">
				<h3>${product.name}</h3>
				<p>分類： ${product.category}</p>
				<p>單價:：${product.price}</p>
				<p>商店名稱:：${product.storeBean.name}</p>
				<p>商品介紹： ${product.detail}</p>
				<p>
					<strong>商品編號: </strong> <span class='label label-warning'>
						${product.id} </span>
				</p>
				<p>
					<a href="<spring:url value='/hao/products' />" class="btn btn-default">
						<span class="glyphicon-hand-left glyphicon"></span>返回
					</a> 
				</p>
			</div>
		</div>
	</section>
</body>
</html>
