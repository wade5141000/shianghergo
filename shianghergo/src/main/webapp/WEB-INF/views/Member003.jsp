<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<script src="https://cdn.staticfile.org/jquery/3.2.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>我建立的合購</title>
<style type="text/css">
.table1 {
	border: 1px solid #ddd;
	width: 900px;
}

thead {
	background-color: lightblue;
}
</style>
</head>
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
			<li class="layui-nav-item layui-this"><a href="Member003"><i class="layui-icon layui-icon-star"></i>我建立的合購</a></li>
			<li class="layui-nav-item"><a href="Member004"><i class="layui-icon layui-icon-star"></i>我參與的合購</a></li>
			<li class="layui-nav-item "><a href="getMyMessage"><i class="layui-icon layui-icon-star"></i>我的留言板</a></li>
<!-- 			<li class="layui-nav-item"><a href="goRegisterPage">加入會員</a></li> -->
			<li class="layui-nav-item "><a href="MyMessage"><i class="layui-icon layui-icon-star"></i>寄件備份</a></li>
			<li class="layui-nav-item "><a href="Member001"> <img
					src="<c:url value='getmemberPicture/${loginOK.id}'/>" class="layui-nav-img">${loginOK.name}
			</a></li>
			<li class="layui-nav-item"><a href="logout"><i class="layui-icon layui-icon-star"></i>登出</a></li>
		</ul>
		<div style="padding-left: 350px;padding-right: 350px;">
			<table class="layui-table">
				<tr id='borderA' height='50'>
					<th id='borderA' align="center">由 ${loginOK.name}發起的合購團</th>
				</tr>
				<tr id='borderA' height='36'>
					<th id='borderA'>合購編號</th>
					<th id='borderA'>開始時間</th>
					<th id='borderA'>截止時間</th>
					<th id='borderA'>團名</th>
					<th id='borderA'>簡介</th>
					<th id='borderA'>付款方式</th>
					<th id='borderA'>我的團員</th>
					<th id='borderA'>商品明細</th>
				</tr>
				<c:forEach var="anGroupsBean" items="${MyGroupsList}">
					<TR id='borderA' height='30'>
						<TD id='borderA' align="center">${anGroupsBean.id}</TD>
						<TD id='borderA' align="center">${anGroupsBean.start_time}</TD>
						<TD id='borderA' align="center">&nbsp;${anGroupsBean.end_time}</TD>
						<TD id='borderA' align="center">${anGroupsBean.name}</TD>
						<TD id='borderA' align="center">&nbsp;${anGroupsBean.detail}</TD>
						<TD id='borderA' align="center">${anGroupsBean.payment}</TD>
						<TD id='borderA' align="center"><a
							href="<c:url value='getMyGroupsPerson?groups_id=${anGroupsBean.id}' />">
								<button type="button" class="layui-btn layui-btn-radius layui-btn-danger">詳情</button> </a></TD>
					<TD id='borderA' align="center"><a
							href="<c:url value='getMyGroupsListD?groups_id=${anGroupsBean.id}' />">
								 <button type="button" class="layui-btn layui-btn-radius layui-btn-danger">詳情</button></a></TD>
					</TR>
				</c:forEach>

			</TABLE>
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