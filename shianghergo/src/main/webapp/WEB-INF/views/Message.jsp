<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
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
<head>
<meta charset="UTF-8">
<title>平台留言</title>
<link rel="stylesheet"
	href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
<script
	src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://cdn.staticfile.org/angular.js/1.4.6/angular.min.js"></script>
</head>
<style>
#contact-area {
	padding: 20px 0 60px;
}

.contact-box {
	-webkit-box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	padding: 50px 50px 35px;
	background-color: #fff;
	border-radius: 6px;
}

.contact-box input {
	height: 50px;
	border: 1px solid #f7f6f5;
	font-size: 15px;
	background-color: #f7f6f5;
	font-weight: 500
}

.contact-box textarea {
	border: 1px solid #f7f6f5;
	padding-top: 10px;
	background-color: #f7f6f5;
	font-size: 15px;
	font-weight: 500
}

.contact-box button {
	background-color: #325eff;
	border: 0;
	color: #fff;
	padding: 10px 30px;
	border-radius: 4px;
	cursor: pointer;
	outline: 0;
	font-weight: 500;
	font-size: 15px
}

.contact-box button:hover {
	background-color: #0f39cf;
}
</style>
<body>
<div>
<!-- 	<table border="1" class="table1"> -->
<div class="site-nav-bg">
		<div class="site-nav w1200">
			<p class="sn-back-home">
				<i class="layui-icon layui-icon-home"></i> <a href="index">首页</a>
			</p>
			<div class="sn-quick-menu">
				<div class="login">
					<a href="login.jsp">登录</a>
				</div>
				<div class="sp-cart">
					<a href="shopcart.jsp">购物车</a><span>2</span>
				</div>
			</div>
		</div>
	</div>

	<div class="header">
		<div class="headerLayout w1200">
			<div class="headerCon">
				<h1 class="mallLogo">
					<a href="index.jsp"> <img
						src="${pageContext.request.contextPath}/res/static/img/logo4.png"
						width="100" height="100">
					</a>
				</h1>
				<div class="mallSearch">
					<form action="" class="layui-form" novalidate>
						<input type="text" name="title" required lay-verify="required"
							autocomplete="off" class="layui-input" placeholder="请输入需要的商品">
						<button class="layui-btn" lay-submit lay-filter="formDemo">
							<i class="layui-icon layui-icon-search"></i>
						</button>
						<input type="hidden" name="" value="">
					</form>
				</div>
			</div>
		</div>
	</div>
	<div class="main-nav" style="padding-bottom: 500px;">
		<ul class="layui-nav " lay-filter="" id="top">
			<li class="layui-nav-item"><a href="Member002"><i class="layui-icon layui-icon-star"></i>我購買的商品</a></li>
			<li class="layui-nav-item "><a href="Member003"><i class="layui-icon layui-icon-star"></i>我建立的合購</a></li>
			<li class="layui-nav-item"><a href="Member004"><i class="layui-icon layui-icon-star"></i>我參與的合購</a></li>
			<li class="layui-nav-item layui-this"><a href="getMyMessage"><i class="layui-icon layui-icon-star"></i>我的留言板</a></li>
<!-- 			<li class="layui-nav-item"><a href="goRegisterPage">加入會員</a></li> -->
			<li class="layui-nav-item "><a href="MyMessage"><i class="layui-icon layui-icon-star"></i>寄件備份</a></li>
			<li class="layui-nav-item "><a href="Member001"> <img
					src="<c:url value='getmemberPicture/${loginOK.id}'/>" class="layui-nav-img">${loginOK.name}
			</a></li>
			<li class="layui-nav-item"><a href="logout"><i class="layui-icon layui-icon-star"></i>登出</a></li>
		</ul>
<div style="padding-left: 350px;padding-right: 350px;">
	<section id="contact-area">
		<div class="container">
			<div class="row">
				<div class="col-lg-10 offset-lg-1">
					<div class="contact-box text-center">
						<form id="ajax-contact" action="saveMessage.do" method="post">
							<input type="hidden" name="member_id" value="${mm.id}" /> <input
								type="hidden" name="target" value="${mmm.id}" />
							<div class="form-group row">
								<div class="col-lg-6">
									<p class="form-control-static">收件人:${mmm.name}</p>
								</div>
							</div>
							<div class="form-group">
								<input type="text" class="form-control" id="title" name="title"
									placeholder="標題">
							</div>
							<div class="form-group">
								<textarea class="form-control" id="contents" name="contents"
									rows="10" placeholder="留言内容*" required="required"></textarea>
							</div>
							<div>
								<input type="hidden" name="status" value="1" />
							</div>
							<button type="submit">提 交</button>
							<div id="form-messages"></div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</section>
	</div>
	</div>
	</div>
	<div class="footer" style="padding-right: 200px; padding-left: 200px;">
		<div class="ng-promise-box">
			<div class="ng-promise w1200">
				<p class="text">
					<a class="icon1" href="javascript:;">7天无理由退换货</a> <a class="icon2"
						href="javascript:;">满99元全场免邮</a> <a class="icon3"
						style="margin-right: 0" href="javascript:;">100%品质保证</a>
				</p>
			</div>
		</div>
		<div class="mod_help w1200">
			<p>
				<a href="javascript:;">关于我们</a> <span>|</span> <a
					href="javascript:;">帮助中心</a> <span>|</span> <a href="javascript:;">售后服务</a>
				<span>|</span> <a href="javascript:;">母婴资讯</a> <span>|</span> <a
					href="javascript:;">关于货源</a>
			</p>
			<p class="coty">母婴商城版权所有 &copy; 2012-2020</p>
		</div>
	</div>
</body>
</html>