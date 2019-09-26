<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
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
					<form class="layui-form" action="login.do" method="post">
						<legend>會員登入</legend>
						<div class="layui-form-item">
							<div class="layui-inline iphone">
								<div class="layui-input-inline">
									<i class="layui-icon layui-icon-username iphone-icon"></i> <input
										type="text" name="account" id="account"
										lay-verify="required|phone" placeholder="請輸入帳號"
										autocomplete="off" class="layui-input">
								</div>
							</div>
							<div class="layui-inline iphone">
								<div class="layui-input-inline">
									<i class="layui-icon layui-icon-password iphone-icon"></i> <input
										id="password" type="password" name="password"
										lay-verify="required" placeholder="請輸入密碼" autocomplete="off"
										class="layui-input">
								</div>
							</div>
						</div>
						<div class="layui-form-item login-btn">
							<div class="layui-input-block">
								<button class="layui-btn" lay-submit lay-filter="login">登入</button>
							</div>
							<div class="layui-btn-container">
								<!--                 <button type="button" class="layui-btn">一个标准的按钮</button> -->
								<a href="goRegisterPage" class="layui-btn">加入會員</a>
								<button type="reset" class="layui-btn">重置</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

	<div class="footer">
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
	<!--   <script type="text/javascript"> -->
	<!--     layui.config({ -->
	<!--        base: '../res/static/js/util' //你存放新模块的目录，注意，不是layui的模块目录 -->
	<!--      }).use(['jquery','form'],function(){ -->
	<!--            var $ = layui.$,form = layui.form; -->
	<!--   </script> -->
	<script type="text/javascript">
		$(function() {
			layui.use('form', function() {
				var form = layui.form;
				//监听提交
				form.on('submit(login)', function(data) {
					console.log(data);
					return false;
				});
			});
		})
		//注意：导航 依赖 element 模块，否则无法进行功能性操作
		layui.use('element', function() {
			var element = layui.element;

			//…
		});
	</script>


</body>
</html>