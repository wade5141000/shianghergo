<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Build Store</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/res/static/css/main.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/res/layui/css/layui.css">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/res/layui/layui.js"></script>
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
<meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">
</head>
<body>
<!-- 	<div class="site-nav-bg"> -->
<!-- 		<div class="site-nav w1200"> -->
<!-- 			<p class="sn-back-home"> -->
<!-- 				<i class="layui-icon layui-icon-home"></i> <a href="index.jsp">首頁</a> -->
<!-- 			</p> -->
<!-- 			<div class="sn-quick-menu"> -->
<!-- 				<div class="login"> -->
<!-- 					<a href="login.jsp">登入</a> -->
<!-- 				</div> -->
<!-- 				<div class="sp-cart"> -->
<!-- 					<a href="shopcart.jsp">購物車</a><span>2</span> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 	</div> -->



<!-- 	<div class="header"> -->
<!-- 		<div class="headerLayout w1200"> -->
<!-- 			<div class="headerCon"> -->
<!-- 				<h1 class="mallLogo"> -->
<!-- 					<a href="index.jsp"> <img -->
<%-- 						src="${pageContext.request.contextPath}/res/static/img/logo4.png" --%>
<!-- 						width="100" height="100"> -->
<!-- 					</a> -->
<!-- 				</h1> -->
<!-- 				<div class="mallSearch"> -->
<%-- 					<form action="" class="layui-form" novalidate> --%>
<!-- 						<input type="text" name="title" required lay-verify="required" -->
<!-- 							autocomplete="off" class="layui-input" placeholder="請輸入需要的商品"> -->
<!-- 						<button class="layui-btn" lay-submit lay-filter="formDemo"> -->
<!-- 							<i class="layui-icon layui-icon-search"></i> -->
<!-- 						</button> -->
<!-- 						<input type="hidden" name="" value=""> -->
<%-- 					</form> --%>
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 	</div> -->

<!-- 	<div class="content content-nav-base buytoday-content"> -->
<!-- 		<div id="list-cont"> -->
<!-- 			<div class="main-nav"> -->
<!-- 				<div class="inner-cont0"> -->
<!-- 					<div class="inner-cont1 w1200"> -->
<!-- 						<div class="inner-cont2"> -->
<!-- 							<a href="commodity.jsp" class="active">所有商品</a> <a -->
<!-- 								href="buytoday.jsp">今日團購</a> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 			<div class="banner-box"> -->
<!-- 				<div class="banner"></div> -->
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 	</div> -->




	<section>
		<div class="container">
			<h1 style="text-align: center">設立商家</h1>
		</div>
	</section>
	<hr
		style="height: 1px; border: none; color: #333; background-color: #333;">
	<section class="container">
		<!--       三個地方要完全一樣 -->
		<form:form method='POST' modelAttribute="storeBean"
			class='form-horizontal' enctype="multipart/form-data">
			<fieldset>
				<div class="form-group">
					<label class="control-label col-lg-2 col-lg-2" for='member_id'>
						會員帳號(暫)：</label>
					<div class="col-lg-10">
						<form:input id="member_id" path="member_id" type='text'
							class='form:input-large' value="${loginOK.id }" />
					</div>
				</div>

				<div class="form-group">
					<label class="control-label col-lg-2 col-lg-2" for='name'>
						商店名稱 ：</label>
					<div class="col-lg-10">
						<form:input id="name" path="name" type='text'
							class='form:input-large' />
					</div>
				</div>

				<div class="form-group">
					<label class='control-label col-lg-2 col-lg-2' for="detail">
						商店介紹：</label>
					<div class='col-lg-10'>
						<form:input id="detail" path="detail" type='text'
							class='form:input-large' />
					</div>
				</div>

				<div class="form-group">
					<div class='col-lg-offset-2 col-lg-10'>
						<input id="btnAdd" type='submit' class='btn btn-primary'
							value="送出" />
					</div>
				</div>
			</fieldset>
		</form:form>
	</section>
</body>
</html>