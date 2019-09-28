<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" ></script>
<script src="http://static.runoob.com/assets/jquery-validation-1.14.0/lib/jquery.js"></script>
<script src="http://static.runoob.com/assets/jquery-validation-1.14.0/dist/jquery.validate.min.js"></script>
<script src="http://static.runoob.com/assets/jquery-validation-1.14.0/dist/localization/messages_zh.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" ></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" ></script>
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
<style type="text/css">
.table1 {
	border: 1px solid #ddd;
	width: 700px;
}

thead {
	background-color: lightblue;
}

</style>
</head>
<body>
<div>
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
				<li class="layui-nav-item"><a href="Member002"><i
						class="layui-icon layui-icon-star"></i>我購買的商品</a></li>
				<li class="layui-nav-item "><a href="Member003"><i
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
			</ul>
<div style="padding-left: 350px; padding-right: 350px;">
	<input type="hidden" name="id" value="${loginOK.id}" />
	<table border="1" class="layui-table">
		<tbody>
			<tr>
				<td width="30">大頭照</td>
				<td align="center"><img  width="50" height="50" alt="" src="<c:url value='getmemberPicture/${loginOK.id}'/>"/></td>
			</tr>
			<tr>
				<td width="30">帳號</td>
				<td align="center">${loginOK.account}</td>
			</tr>
			<tr>
				<td width="30">密碼</td>
				<td align="center">${loginOK.password}</td>
			</tr>
			<tr>
				<td width="30">姓名</td>
				<td align="center">${loginOK.name}</td>
			</tr>
			<tr>
				<td width="300">手機</td>
				<td align="center">${loginOK.phone}</td>
			</tr>
			<tr>
				<td width="30">Email</td>
				<td align="center">${loginOK.email}</td>
			</tr>
			<tr>
				<td width="30">生日</td>
				<td align="center">${loginOK.birthday}</td>
			</tr>
			<tr>
				<td width="30">地址</td>
				<td align="center">${loginOK.address}</td>
			</tr>
			<tr>
				<td width="30">修改</td>
				<td align="center">
				<a href="Practice/../doupdate?account=${loginOK.account}"><img
						src="images/01.jpg" width="30"></a></td>
			</tr>
		</tbody>
	</table>
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
<script type="text/javascript">
	//注意：导航 依赖 element 模块，否则无法进行功能性操作
	layui.use('element', function() {
		var element = layui.element(); //导航的hover效果、二级菜单等功能，需要依赖element模块
	});
</script>
</html>
