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
</style>

<body>

	<div class="navbar navbar-inverse">
		<h1 class="title">團購商品管理</h1>
		<span class="adminlogin"><a href="login"
			class="btn btn-default navbar-btn">管理員登入</a></span>




		<ul class="nav nav-pills">
			<li role="presentation"><a href="member.do">會員管理</a></li>
			<li role="presentation"><a href="store.do">商店管理</a></li>
			<li role="presentation"><a href="showItem">商品管理</a></li>
			<li role="presentation" class="active"><a href="showGroups_item">團購商品管理</a></li>
			<li role="presentation"><a href="showVM.do">違規處理-會員</a></li>
			<li role="presentation"><a href="showVS.do">違規處理-商店</a></li>

		</ul>

	</div>

<div class="content">
	<div class="container">
		<table class="table table-striped">	
			<c:forEach var='groups_items' items='${groups_item}'>
				<thead>
					<tr>
						<th>商店ID</th>
						<th>商品名稱</th>
						<th>商品介紹</th>
						<th>商品價錢</th>
				        <th></th>
					</tr>
					</thead>
					
					    <td>${groups_items.groupsBean.id}</td>
						<td>${groups_items.name}</td>
						<td>${groups_items.detail}</td>
						<td>${groups_items.price}</td>
						<td>
							<form action="deletel1" method="POST">
								<input type=hidden value="${groups_items.id}" name="id">
							 <button type="submit" class="btn btn-info">下架</button>
							</form>

						</td>
					
			</c:forEach>
		</table>
	</div>
	</div>
</body>
</html>
