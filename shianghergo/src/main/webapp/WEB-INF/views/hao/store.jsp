<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script
	src="http://static.runoob.com/assets/jquery-validation-1.14.0/lib/jquery.js"></script>
<script
	src="http://static.runoob.com/assets/jquery-validation-1.14.0/dist/jquery.validate.min.js"></script>
<script
	src="http://static.runoob.com/assets/jquery-validation-1.14.0/dist/localization/messages_zh.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/res/static/css/main.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/res/layui/css/layui.css">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/res/layui/layui.js"></script>
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
<meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">
<link rel="stylesheet"
	href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css">
<title>Store</title>
<link rel='stylesheet'
	href='${pageContext.request.contextPath }/css/styles.css'
	type="text/css" />
<style>
.bang {
	padding: 100px;
	text-align: left;
	margin: auto;
	display: table;
	padding-top: 40px;
	padding-left: 140px;
	font-family: "Arial", "Microsoft YaHei", "黑體", "宋體", sans-serif;
	font-size: 20px;
}

.title {
	text-align: center;
	padding-top: 80px;
	font-size: 50px;
	padding-button: 30px;
	color: transparent;
	background-color: black;
	text-shadow: rgba(255, 255, 255, 0.5) 0 5px 6px,
		rgba(255, 255, 255, 0.2) 1px 3px 3px;
	-webkit-background-clip: text;
}

.buttons {
	text-align: right;
}

.store-bg {
	background-image: url('https://i.imgur.com/dqiRiVK.jpg');
}

layui-table {
	color: #252525;
	font-size: 20px;
}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/eric/header.jsp" />
	<div class="main-nav">
		<ul class="layui-nav " lay-filter="" id="top">
			<li class="layui-nav-item"><a href="../Member002"><i
					class="layui-icon layui-icon-star"></i>我購買的商品</a></li>
			<li class="layui-nav-item "><a href="/WEB-INF/views/Member003"><i
					class="layui-icon layui-icon-star"></i>我建立的合購</a></li>
			<li class="layui-nav-item layui-this"><a href="Member004"><i
					class="layui-icon layui-icon-star"></i>我參與的合購</a></li>
			<li class="layui-nav-item "><a href="getMyMessage"><i
					class="layui-icon layui-icon-star"></i>我的留言板</a></li>
			<!-- 			<li class="layui-nav-item"><a href="goRegisterPage">加入會員</a></li> -->
			<li class="layui-nav-item "><a href="MyMessage"><i
					class="layui-icon layui-icon-star"></i>寄件備份</a></li>
			<li class="layui-nav-item "><a href="Member001"> <img
					src="<c:url value='getmemberPicture/${loginOK.id}'/>"
					class="layui-nav-img">${loginOK.name}
			</a></li>
			<li class="layui-nav-item"><a href="logout"><i
					class="layui-icon layui-icon-star"></i>登出</a></li>
			<li class="layui-nav-item "><a href="/hao/buildStore"><i
					class="layui-icon layui-icon-star"></i>我要開店</a></li>
		</ul>

		<div class="layui-table" style="height: 650; max-height: 900px;">
			<section>
				<div class="container" style="text-align: center">
					<h2>商店詳細資料</h2>
				</div>
			</section>
			<div class="bang">
				<section>
					<div>
						<p>商家編號： ${store.id}
						<p>商店名稱： ${store.name}</p>
						<p>商店介紹： ${store.detail}</p>
						<c:set var="status" scope="session" value="${store.status}" />
						<c:if test="${status==1 }">
							<p>商店狀態： 正常</p>
						</c:if>
						<c:if test="${status==2 }">
							<p>商店狀態： 禁用</p>
						</c:if>
						<c:if test="${status==3 }">
							<p>商店狀態： 關閉</p>
						</c:if>
					</div>
				</section>

				<div class="layui-btn-group">
					<a href="<spring:url value='store/Update?id=${store.id }' />"
						class="layui-btn"> <span class="glyphicon-info-sigh glyphicon"></span>修改
					</a> <a href="<spring:url value='/hao/stores' />" class="layui-btn">
						<span class="glyphicon-hand-left glyphicon"></span>返回
					</a> <a href="javascript:history.go(-1)" class="layui-btn">回會員中心 </a>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/eric/foot.jsp" />
</body>
</html>
