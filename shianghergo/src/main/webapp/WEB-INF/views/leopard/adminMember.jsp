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
		<h1 class="title">會員管理</h1>
		<span class="adminlogin">
		<a href="login"
			class="btn btn-default navbar-btn">管理員登入</a></span>

		<ul class="nav nav-pills">
			<li role="presentation" class="active"><a href="member.do">會員管理</a></li>
			<li role="presentation"><a href="store.do">商店管理</a></li>
			<li role="presentation"><a href="showItem">商品管理</a></li>
			<li role="presentation"><a href="showGroups_item">團購商品管理</a></li>
			<li role="presentation"><a href="showVM.do">違規處理-會員</a></li>
			<li role="presentation"><a href="showVS.do">違規處理-商店</a></li>

		</ul>

	</div>

	<div class="content">
		
		<div class="container">
			
			
			<table class="table table-striped">
				<c:forEach var='members' items='${Member}'>

					<thead>
						<tr>
							<th>會員名稱</th>
							<th>會員帳號</th>
							<th>會員信箱</th>
							<th>會員電話</th>
							<th>會員生日</th>
							<th>會員住址</th>
							<th></th>
							<th></th>
							<th></th>
						</tr>
					</thead>



					<td>${members.name}</td>
					<td>${members.account}</td>
					<td>${members.email}</td>
					<td>${members.phone}</td>
					<td>${members.birthday}</td>
					<td>${members.address}</td>


					<td>
						<form action="reportMember" method="POST">
							<input type=hidden value="${members.id}" name="target">
							<button type="submit" class="btn btn-info">檢舉</button>
						</form>

					</td>

					<td>

						<form action="messageMember" method="POST">
							<input type=hidden value="${members.id}" name="target">
							<button type="submit" class="btn btn-warning">警告</button>


						</form>

					</td>

					<td>

						<form action="stopMember" method="POST">
							<input type=hidden value="${members.id}" name="target">
							<button type="submit" class="btn btn-danger">停權</button>
						</form>

					</td>

					<td>

						<form action="evaluationMember1" method="POST">
							<input type=hidden value="${members.id}" name="target">
							<button type="submit" class="btn btn-success">評價</button>


						</form>

					</td>


				</c:forEach>
			</table>
		</div>
	</div>
</body>
</html>
