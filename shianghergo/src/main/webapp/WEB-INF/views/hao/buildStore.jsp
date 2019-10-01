<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Document</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/res/static/css/main.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/res/layui/css/layui.css">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/res/layui/layui.js"></script>
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
<meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">
<style type="text/css">
.layui-btn-container {
	margin: auto;
	padding: 9px 25px 9px 5px;
}
</style>
</head>
<body>
<jsp:include page="/WEB-INF/views/eric/header.jsp" />
<div class="main-nav" style="padding-bottom: 500px;">
			<ul class="layui-nav " lay-filter="" id="top">
				<li class="layui-nav-item"><a href="../Member002"><i
						class="layui-icon layui-icon-star"></i>我購買的商品</a></li>
				<li class="layui-nav-item "><a href="Member003"><i
						class="layui-icon layui-icon-star"></i>我建立的合購</a></li>
				<li class="layui-nav-item "><a href="Member004"><i
						class="layui-icon layui-icon-star"></i>我參與的合購</a></li>
				<li class="layui-nav-item "><a href="getMyMessage"><i
						class="layui-icon layui-icon-star"></i>我的留言板</a></li>
				<!-- 			<li class="layui-nav-item"><a href="goRegisterPage">加入會員</a></li> -->
				<li class="layui-nav-item "><a href="MyMessage"><i
						class="layui-icon layui-icon-star"></i>寄件備份</a></li>
				<li class="layui-nav-item layui-this"><a href="Member001"> <img
						src="<c:url value='/getmemberPicture/${loginOK.id}'/>"
						class="layui-nav-img">${loginOK.name}
				</a></li>
				<li class="layui-nav-item"><a href="logout"><i
						class="layui-icon layui-icon-star"></i>登出</a></li>
				<li class="layui-nav-item "><a href="hao/products/add"><i
						class="layui-icon layui-icon-star"></i>我要開店</a></li>
			</ul>

	<div class="content content-nav-base  login-content">
		<div class="main-nav">
			<ul class="layui-nav" lay-filter="">
				<li class="layui-nav-item"><a href="">所有商品</a></li>
				<li class="layui-nav-item "><a href="">今日團購</a></li>
				<li class="layui-nav-item"><a href="">關於我們</a></li>
				<li class="layui-nav-item layui-this"><a href="">登入</a></li>
				<li class="layui-nav-item"><a href="goRegisterPage">加入會員</a></li>
				<li class="layui-nav-item"><a href="MemberDL">會員預覽</a></li>
			</ul>
			<!--       <div class="inner-cont0"> -->
			<!--         <div class="inner-cont1 w1200"> -->
			<!--           <div class="inner-cont2"> -->
			<!--             <a href="commodity.jsp" class="active">所有商品</a> -->
			<!--             <a href="buytoday.jsp">今日团购</a> -->
			<!--             <a href="about.jsp">关于我们</a> -->
			<!--           </div> -->
			<!--         </div> -->
			<!--       </div> -->
		</div>

		<div class="login-bg">
			<div class="login-cont w1200">
				<div class="form-box">
					<form:form modelAttribute="storeBean" enctype="multipart/form-data"
						class="layui-form" method="post">
						<legend>開設商店</legend>
						<div class="layui-form-item">
							<div class="layui-inline iphone">
								<div class="layui-input-inline">
									<form:input type="hidden" id="member_id" path="member_id" value="${loginOK.id }" />
									<form:input type="text" path="name" id="name"
										lay-verify="required|phone" placeholder="請輸入商店名稱"
										autocomplete="off" class="layui-input" />
								</div>
							</div>
							<div class="layui-inline iphone">
								<div class="layui-input-inline">
									<form:input id="detail" type="text" path="detail"
										lay-verify="required" placeholder="請輸入商店說明" autocomplete="off"
										class="layui-input" />
								</div>
							</div>
						</div>
						<div class="layui-form-item login-btn">
							<div class="layui-input-block">
								<button class="layui-btn" lay-submit lay-filter="login">確認送出</button>
							</div>
						</div>
					</form:form>
				</div>
			</div>
		</div>
		</div>
	</div>

	<jsp:include page="/WEB-INF/views/eric/foot.jsp" />

<!-- 	<section> -->
<!-- 		<div class="container"> -->
<!-- 			<h1 style="text-align: center">設立商家</h1> -->
<!-- 		</div> -->
<!-- 	</section> -->
<!-- 	<hr -->
<!-- 		style="height: 1px; border: none; color: #333; background-color: #333;"> -->
<!-- 	<section class="container"> -->
<!-- 		<!--       三個地方要完全一樣 --> -->
<%-- 		<form:form method='POST' modelAttribute="storeBean" --%>
<%-- 			class='form-horizontal' enctype="multipart/form-data"> --%>
<!-- 			<fieldset> -->
<!-- 				<div class="form-group"> -->
<!-- 					<label class="control-label col-lg-2 col-lg-2" for='member_id'> -->
<!-- 						會員帳號(暫)：</label> -->
<!-- 					<div class="col-lg-10"> -->
<%-- 						<form:input id="member_id" path="member_id" type='text' --%>
<%-- 							class='form:input-large' value="${loginOK.id }" /> --%>
<!-- 					</div> -->
<!-- 				</div> -->

<!-- 				<div class="form-group"> -->
<!-- 					<label class="control-label col-lg-2 col-lg-2" for='name'> -->
<!-- 						商店名稱 ：</label> -->
<!-- 					<div class="col-lg-10"> -->
<%-- 						<form:input id="name" path="name" type='text' --%>
<%-- 							class='form:input-large' /> --%>
<!-- 					</div> -->
<!-- 				</div> -->

<!-- 				<div class="form-group"> -->
<!-- 					<label class='control-label col-lg-2 col-lg-2' for="detail"> -->
<!-- 						商店介紹：</label> -->
<!-- 					<div class='col-lg-10'> -->
<%-- 						<form:input id="detail" path="detail" type='text' --%>
<%-- 							class='form:input-large' /> --%>
<!-- 					</div> -->
<!-- 				</div> -->

<!-- 				<div class="form-group"> -->
<!-- 					<div class='col-lg-offset-2 col-lg-10'> -->
<!-- 						<input id="btnAdd" type='submit' class='btn btn-primary' -->
<!-- 							value="送出" /> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 			</fieldset> -->
<%-- 		</form:form> --%>
<!-- 	</section> -->
</body>
</html>