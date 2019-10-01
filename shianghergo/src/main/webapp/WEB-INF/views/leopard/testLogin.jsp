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
*{
font-family: 微軟正黑體;
font-size: 25px;
}

.admin {
	width: 400px;
	margin-left: auto;
	margin-right: auto;
	margin-top: 50px;
}

.img {
	margin-left: 39%;
	margin-top: 50px;
}
</style>
<meta charset="UTF-8">

<title>管理員登入</title>
</head>
<body>
	<div class="container">
		<h1 style="margin-left: 480px;">測試會員登入</h1>


		<img class="img" alt="管理員"
			src="${pageContext.request.contextPath}/resources/images/admin.png">


		<div class="admin">


			<form action="testlogin.do" method="POST">

				<div class="input-group input-group-lg">
					<span class="input-group-addon" id="sizing-addon1">會員帳號</span> <input
						type="text" name="account" class="form-control"
						aria-describedby="sizing-addon1">
				</div>

				<div class="input-group input-group-lg">
					<span class="input-group-addon" id="sizing-addon1">會員密碼</span> <input
						type="password" name="password" class="form-control"
						aria-describedby="sizing-addon1">
				</div>

				<input type="submit" value="登入"> 
				<input type="reset"  value="取消">

			</form>
		</div>














	</div>


</body>
</html>