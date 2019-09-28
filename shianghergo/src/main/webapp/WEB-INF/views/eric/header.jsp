<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/res/static/css/main.css">
<!-- <link rel="stylesheet" type="text/css" href="../res/layui/css/layui.css"> -->
<script type="text/javascript" src="${pageContext.request.contextPath}/res/layui/layui.js"></script>
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
<meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">
<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
	integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
	integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="https://unpkg.com/bootstrap-table@1.15.4/dist/bootstrap-table.min.css">
<script
	src="https://unpkg.com/bootstrap-table@1.15.4/dist/bootstrap-table.min.js"></script>
<script
	src="https://unpkg.com/bootstrap-table@1.15.4/dist/locale/bootstrap-table-zh-TW.min.js"></script>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
	<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/res/static/css/header.css">
</head>
<body>
	<div class="site-nav-bg" style="height: 30px">
		<div class="site-nav w1200">
			<div class="sn-quick-menu">
			<div class="login"><a href="fortest">測試</a></div>
      	<div class="login"><a href="productfile.s">訂購單</a></div>
      	<div class="login"><a href="wade/showmap">google map</a></div>
				<div class="login">
					<a href="oldindex">舊index</a>
				</div>
				<div class="login">
					<a href="goRegisterPage">註冊</a>
				</div>
				<div class="login">
					<a href="login">登入</a>
				</div>
				<div class="sp-cart">
					<a href="cart">購物車</a><span>2</span>
				</div>
			</div>
		</div>
	</div>
<!-- 	====  -->
	<nav class="navbar navbar-expand-lg navbar-light bg-light"
		style="width: 100%;margin-bottom: 0px">
		<a href="${pageContext.request.contextPath}/index"> <img src="${pageContext.request.contextPath}/res/static/img/logo4.png"
			width="100" height="100">
		</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/index">首頁</a></li>
				
				
				<li class="nav-item dropdown">
					<a class="nav-link dropdown-toggle" href="" id="navbarDropdown1" role="button" data-toggle="dropdown"
					aria-haspopup="true" aria-expanded="false">瀏覽商品</a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdown1">
						<a class="dropdown-item" href="hao/products">所有商品</a>
						<c:forEach var="category" items="${categoryList}">
							<a class="dropdown-item" href="">${category.name}</a> 
						</c:forEach>
<!-- 						<div class="dropdown-divider"></div> -->
					</div>
				</li>
				
				<li class="nav-item dropdown">
					<a class="nav-link dropdown-toggle" href="" id="navbarDropdown2" role="button" data-toggle="dropdown"
						aria-haspopup="true" aria-expanded="false">瀏覽團購 </a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdown2">
						<a class="dropdown-item" href="frank/groups">所有團購</a>
						<a class="dropdown-item" href="">類別1</a> 
						<a class="dropdown-item" href="">類別2</a>
<!-- 						<div class="dropdown-divider"></div> -->
					</div>
				</li>
					
				<li class="nav-item"><a class="nav-link" href="frank/Groups1">我要開團</a></li>

			</ul>
			<form action="${pageContext.request.contextPath}/leopard/showGroups"  method="POST"
				class="form-inline my-2 my-lg-0">
				<select name="sort">
					<option value="1">商品</option>
					<option value="2">團購商品</option>
				</select>
				<input class="form-control mr-sm-2" type="text" name="name"
					autocomplete="off" placeholder="請輸入需要的商品"
					aria-label="Search" style="width:300px">
				<button class="btn btn-outline-success my-2 my-sm-0" type="submit">GO</button>
			</form>
		</div>
	</nav>

</body>
</html>