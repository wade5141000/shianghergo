<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
<head>
<meta charset="UTF-8">
<!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css">
<!-- 可选的 Bootstrap 主题文件（一般不用引入） -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap-theme.min.css">
<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"></script>

</head>
<style>
* {
	font-family: 微軟正黑體;
   
}

.adminlogin {
	float: right;
}

.title {
	color: white;
}

.container{

font-size: 300px;
}

.back{

color:rgba(0,0,0,0.04);

font-size: 400px;
}

</style>

<body>


	<div class="navbar navbar-inverse">
		<h1 class="title">商品管理</h1>
		<span class="adminlogin"><a href="login"
			class="btn btn-default navbar-btn">管理員登入</a></span>




		<ul class="nav nav-pills">
			<li role="presentation"><a href="member.do">會員管理</a></li>
			<li role="presentation"><a href="store.do">商店管理</a></li>
			<li role="presentation"><a href="showItem">商品管理</a></li>
			<li role="presentation" ><a href="showGroups_item">團購商品管理</a></li>
			<li role="presentation"><a href="showVM.do">違規處理-會員</a></li>
			<li role="presentation"><a href="showVS.do">違規處理-商店</a></li>

		</ul>

	</div>

	
        <div class="container">
        <h1 class="back">admin</h1>
        </div>


</body>
</html>
