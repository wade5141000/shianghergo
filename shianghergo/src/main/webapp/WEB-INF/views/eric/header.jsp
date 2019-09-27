<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="site-nav-bg" style="height: 30px">
		<div class="site-nav w1200">
			<div class="sn-quick-menu">
				<div class="login">
					<a href="oldindex">舊index</a>
				</div>
				<div class="login">
					<a href="goRegisterPage">註冊</a>
				</div>
				<div class="login">
					<a href="login.jsp">登入</a>
				</div>
				<div class="sp-cart">
					<a href="shopcart.jsp">購物車</a><span>2</span>
				</div>
			</div>
		</div>
	</div>
<!-- 	====  -->
	<nav class="navbar navbar-expand-lg navbar-light bg-light"
		style="width: 100%">
		<a href="index.jsp"> <img src="${pageContext.request.contextPath}/res/static/img/logo4.png"
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
				<li class="nav-item active"><a class="nav-link" href="#">首頁
						<span class="sr-only">(current)</span>
				</a></li>
				<li class="nav-item"><a class="nav-link" href="hao/products">所有商品</a></li>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="frank/groups"
					id="navbarDropdown" role="button" data-toggle="dropdown"
					aria-haspopup="true" aria-expanded="false">今日團購 </a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdown">
						<a class="dropdown-item" href="#">下拉表單1</a> <a
							class="dropdown-item" href="#">下拉表單2</a>
						<div class="dropdown-divider"></div>
					</div></li>
				<li class="nav-item"><a class="nav-link" href="#">我要開團</a></li>

			</ul>
			<form action='<c:url value="/Search.controller" />' method="get"
				class="form-inline my-2 my-lg-0">
				<input class="form-control mr-sm-2" type="text" name="title"
					value="${param.title}" autocomplete="off" placeholder="請輸入需要的商品"
					aria-label="Search">
				<button class="btn btn-outline-success my-2 my-sm-0" type="submit">GO</button>
			</form>
		</div>
	</nav>

</body>
</html>