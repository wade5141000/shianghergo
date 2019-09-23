<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script> -->
<!-- <script src="https://cdn.jsdelivr.net/jquery.validation/1.14.0/jquery.validate.min.js"></script>	 -->
<link rel="stylesheet"
	href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
<!-- <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script> -->
<script
	src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>index</title>
<style>
.fakeimg { 
 	height: 200px; 
 	background: #aaa; 
 } 
</style>
</head>
<body>
	<div class="jumbotron text-center" style="margin-bottom: 0">
		<h1>會員系統</h1>
		<p>饗合購</p>
	</div>

	<nav class="navbar navbar-default" role="navigation">
		<div class="container-fluid">
			<div class="navbar-header">
				<a class="navbar-brand" href="#">饗合購</a>
			</div>
			<div>
				<ul class="nav navbar-nav">
					<li class="active"><a href="login">登入</a></li>
					<li><a href="goRegisterPage">註冊</a></li>
					<li><a href="logout">${loginOK.name}登出 </a>
				</ul>
			</div>
		</div>
	</nav>



</body>
</html>