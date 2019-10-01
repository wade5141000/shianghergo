<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
<head>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" ></script>
<script src="http://static.runoob.com/assets/jquery-validation-1.14.0/lib/jquery.js"></script>
<script src="http://static.runoob.com/assets/jquery-validation-1.14.0/dist/jquery.validate.min.js"></script>
<script src="http://static.runoob.com/assets/jquery-validation-1.14.0/dist/localization/messages_zh.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" ></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" ></script>
<!-- <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> -->
<title>register</title>
<!-- <meta name="viewport" -->
<!-- 	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0"> -->
<!-- <meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1"> -->
<script>
	$(document)
			.ready(
					function() {
						$("#regForm").validate({
											// 			debug: true,
											rules : { //配置验证规则，key就是被验证的dom对象，value就是调用验证的方法(也是json格式)
												account : {
													required : true,
													// 					account : true,
													minlength : 6,
													maxlength : 16,
													remote :
					{
														//  						type : "POST",
														url : "Practice/../validateAccount",
														// 						url : "validateAccount.action",
														// 						contentType: "application/json",
														data : {
															account : function() {
																return $(
																		"#regForm input[name='account']")
																		.val();
																// 								return $("#account").val();	

															}
														}
													}

												},
												password : {
													required : true,
													minlength : 6,
													maxlength : 16
												},
												repassword : {
													required : true,
													equalTo : "#password"
												},
												name : {
													required : true,
													minlength : 2
												},
												address : {
													required : true

												},
												phone : {
													required : true,
													minlength : 10,
													number : true
												},
												email : {
													required : true,
													email : true
												},
												birthday : {
													required : true,
													dateISO : true
												},
											},
											messages : {
												account : {
													required : "帳號為必填",
													minlength : "帳號長度至少6位",
													maxlength : "密碼長度請勿超過16位",
													remote : "帳號已存在！"
												},
												password : {
													required : "密碼為必填",
													minlength : "密碼長度至少6位",
													maxlength : "密碼長度請勿超過16位"
												},
												repassword : {
													required : "請再次確認密碼",
													equalTo : "請確認密碼是否輸入正確"
												},
												name : {
													required : "名字必填",
													minlength : "請至少輸入2個字"
												},
												address : {
													required : "地址必填"
												},
												phone : {
													required : "電話必填",
													number : "請填入數字",
													minlength : "請填完整電話"
												},
												email : {
													required : "mail必填",
													email : "請填正確mail"
												},
												birthday : {
													required : "生日必填",
													dateISO : "請填正確日期格式，ex:1998/01/22 "
												},

											}
										});
					});

	/*******************************插件新功能-设置插件validator的默认参数*****************************************/
	$.validator
			.setDefaults({
				/*关闭键盘输入时的实时校验*/
				onkeyup : null,
				/*添加校验成功后的执行函数--修改提示内容，并为正确提示信息添加新的样式(默认是valid)*/
				success : function(label) {
					/*label的默认正确样式为valid，需要通过validClass来重置，否则这里添加的其他样式不能被清除*/
					label.text('').addClass('valid');
				},
				/*重写校验元素获得焦点后的执行函数--增加[1.光标移入元素时的帮助提示,2.校验元素的高亮显示]两个功能点*/
				onfocusin : function(element) {
					this.lastActive = element;
					/*1.帮助提示功能*/
					this.addWrapper(this.errorsFor(element)).hide();
					var tip = $(element).attr('tip');
					if (tip
							&& $(element).parent().children(".tip").length === 0) {
						$(element).parent().append(
								"<label class='tip'>" + tip + "</label>");
					}
					/*2.校验元素的高亮显示*/
					$(element).addClass('highlight');
					// Hide error label and remove error class on focus if enabled
					if (this.settings.focusCleanup) {
						if (this.settings.unhighlight) {
							this.settings.unhighlight.call(this, element,
									this.settings.errorClass,
									this.settings.validClass);
						}
						this.hideThese(this.errorsFor(element));
					}
				},
				/*重写校验元素焦点离开时的执行函数--移除[1.添加的帮助提示,2.校验元素的高亮显示]*/
				onfocusout : function(element) {
					/*1.帮助提示信息移除*/
					$(element).parent().children(".tip").remove();
					/*2.校验元素高亮样式移除*/
					$(element).removeClass('highlight');
					/*3.替换下面注释的原始代码，任何时候光标离开元素都触发校验功能*/
					this.element(element);
					/*if ( !this.checkable( element ) && ( element.name in this.submitted || !this.optional( element ) ) ) {
					  this.element( element );
					}*/
				}
			});
</script>
<style>
/* body { */
/* 	font-family: Microsoft Yahei; */
/* 	font-size: 20px; */
/* 	background-image:url('images/rebg02.jpeg'); */
/* 	background-color:#a3a3a3; */
/* } */

body{

margin:0px;
padding:0px;
background:#fff url('images/rebg0801.jpg') center center fixed no-repeat;　
background-size: contain;　

}        

fieldset {

	width: 750px;
	border:1px solid gray;
	margin-left:auto;
	margin-right:auto;
	width:50%;
	background-color:white;
	text-align:left;
	padding:10px;
	font-family:微軟正黑體;
	border-radius: 5px;
    border-spacing: 0;
	
}

legend {
	margin: auto;
}

.item {
	height: 46px;
	line-height: 26px;
	margin: 10px;
}

.item .item-label {
	float: left;
	width: 100px;
	text-align: right;
}

.item-text {
	float: left;
	width: 300px;
	height: 26px;
	padding: 9px 25px 9px 5px;
	margin-left: 10px;
 	border: 1px solid #ccc; 
	overflow: hidden;
}

.item-select {
	float: left;
	height: 34px;
	border: 1px solid #ccc;
	margin-left: 10px;
	font-size: 14px;
	padding: 6px 0px;
}

.item-submit {
	margin-left: 88px;
}

input.error {
	border: 1px solid #E6594E;
}

input.highlight {
	border: 1px solid #7abd54;
}

label.error, label.tip {
	float: left;
	height: 32px;
	line-height: 32px;
	font-size: 14px;
	text-align: left;
	margin-left: 5px;
	padding-left: 20px;
	color: red;
	background: url('error.png') no-repeat left center;
}

label.tip {
	color: #aaa;
	background: url('tip.png') no-repeat left center;
}

label.valid {
	background: url('valid.png') no-repeat left center;
	width: 32px;
}


</style>
</head>
<body>
<jsp:include page="eric/header.jsp" />

<!-- 	<div class="site-nav-bg"> -->
<!-- 		<div class="site-nav w1200"> -->
<!-- 			<p class="sn-back-home"> -->
<!-- 				<i class="layui-icon layui-icon-home"></i> <a href="index">首页</a> -->
<!-- 			</p> -->
<!-- 			<div class="sn-quick-menu"> -->
<!-- 				<div class="login"> -->
<!-- 					<a href="login.jsp">登录</a> -->
<!-- 				</div> -->
<!-- 				<div class="sp-cart"> -->
<!-- 					<a href="shopcart.jsp">购物车</a><span>2</span> -->
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
<!-- 							autocomplete="off" class="layui-input" placeholder="请输入需要的商品"> -->
<!-- 						<button class="layui-btn" lay-submit lay-filter="formDemo"> -->
<!-- 							<i class="layui-icon layui-icon-search"></i> -->
<!-- 						</button> -->
<!-- 						<input type="hidden" name="" value=""> -->
<%-- 					</form> --%>
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 	</div> -->

<!-- 	<div class="main-nav"> -->
<!-- 		<ul class="layui-nav" lay-filter=""> -->
<!-- 			<li class="layui-nav-item"><a href="">所有商品</a></li> -->
<!-- 			<li class="layui-nav-item "><a href="">今日團購</a></li> -->
<!-- 			<li class="layui-nav-item"><a href="">關於我們</a></li> -->
<!-- 			<li class="layui-nav-item"><a href="login">登入</a></li> -->
<!-- 			<li class="layui-nav-item layui-this"><a href="goRegisterPage">加入會員</a></li> -->
<!-- 			<li class="layui-nav-item"><a href="MemberDL">會員預覽</a></li> -->
<!-- 		</ul> -->
<!-- 	</div> -->


	<div class="container"style="height: 650;max-height: 900px;">
		<form:form action="goRegisterPage.do" method="post" id="regForm"
			enctype="multipart/form-data" name="memberlist"
			modelAttribute="memberbean">
			<fieldset style="margin-left: 800px;margin-top: 100px;">
				<h1 align="center">會員註冊</h1>
				<div class="item">
					<label for="account" class="item-label">帳號:</label>
					<form:input type="text" id="account" name="account" path="account"
						class="item-text" placeholder="請輸入帳號" autocomplete="off"
						tip="請輸入帳號" />
				</div>
				<div class="item">
					<label for="password" class="item-label">密碼:</label>
					<form:input type="password" id="password" name="password"
						path="password" class="item-text" placeholder="請輸入密碼"
						tip="長度需6-16個字" />
				</div>
				<div class="item">
					<label for="password" class="item-label">確認密碼:</label>
					<form:input type="password" id="repassword" name="repassword"
						path="" class="item-text" placeholder="請再次輸入密碼" />
				</div>
				<div class="item">
					<label for="name" class="item-label">姓名:</label>
					<form:input type="text" id="name" name="name" path="name"
						class="item-text" placeholder="請輸入姓名" autocomplete="off"
						tip="請輸入姓名" />
				</div>
				<div class="item">
					<label for="address" class="item-label">地址:</label>
					<form:input type="text" id="address" name="address" path="address"
						class="item-text" placeholder="請輸入地址" autocomplete="off"
						tip="請輸入地址" />
				</div>
				<div class="item">
					<label for="phone" class="item-label">電話:</label>
					<form:input type="text" id="phone" name="phone" path="phone"
						class="item-text" placeholder="請輸入電話" autocomplete="off"
						tip="請輸入電話" />
				</div>
				<div class="item">
					<label for="email" class="item-label">Mail:</label>
					<form:input type="text" id="email" name="email" path="email"
						class="item-text" placeholder="請輸入mail" autocomplete="off"
						tip="請輸入mail" />
				</div>
				<div class="item">
					<label for="birthday" class="item-label">生日:</label>
					<form:input type="text" id="birthday" name="birthday"
						path="birthday" class="item-text"
						placeholder="請輸入生日,ex:1998/01/22" autocomplete="off"
						tip="請輸入生日,ex:1998/01/22" />
				</div>
				<div>
					<input type="hidden" name="register_time" value="${now}" />
				</div>
				<div>
					<input type="hidden" name="status" value="1" />
				</div>
				<div class="item">
					<label for="image" class="item-label">大頭照:</label>
					<form:input type="file" id="image" name="image" path="image"
						class="item-file" placeholder="" autocomplete="off" tip="" />
				</div>
				<div class="btn-group" style="margin-left: 120px;">
				<button type="submit" class="btn btn-primary btn-sm">提交</button>
				<button type="reset" class="btn btn-primary btn-sm">重置</button>
				<a href="loginNew" class="btn btn-primary btn-sm">已有會員?馬上登入</a>
				</div>
			</fieldset>
		</form:form>
	</div>


	<jsp:include page="eric/foot.jsp" />
<!-- 	<div class="footer"> -->
<!-- 		<div class="ng-promise-box"> -->
<!-- 			<div class="ng-promise w1200"> -->
<!-- 				<p class="text"> -->
<!-- 					<a class="icon1" href="javascript:;">7天无理由退换货</a> <a class="icon2" -->
<!-- 						href="javascript:;">满99元全场免邮</a> <a class="icon3" -->
<!-- 						style="margin-right: 0" href="javascript:;">100%品质保证</a> -->
<!-- 				</p> -->
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 		<div class="mod_help w1200"> -->
<!-- 			<p> -->
<!-- 				<a href="javascript:;">关于我们</a> <span>|</span> <a -->
<!-- 					href="javascript:;">帮助中心</a> <span>|</span> <a href="javascript:;">售后服务</a> -->
<!-- 				<span>|</span> <a href="javascript:;">母婴资讯</a> <span>|</span> <a -->
<!-- 					href="javascript:;">关于货源</a> -->
<!-- 			</p> -->
<!-- 			<p class="coty">母婴商城版权所有 &copy; 2012-2020</p> -->
<!-- 		</div> -->
<!-- 	</div> -->
	<!--   <script type="text/javascript"> -->
	<!--     layui.config({ -->
	<!--        base: '../res/static/js/util' //你存放新模块的目录，注意，不是layui的模块目录 -->
	<!--      }).use(['jquery','form'],function(){ -->
	<!--            var $ = layui.$,form = layui.form; -->
	<!--   </script> -->
<!-- 	<script type="text/javascript"> -->
<!-- // 		$(function() { -->
<!-- // 			layui.use('form', function() { -->
<!-- // 				var form = layui.form; -->
<!-- // 				//监听提交 -->
<!-- // 				form.on('submit(login)', function(data) { -->
<!-- // 					console.log(data); -->
<!-- // 					return false; -->
<!-- // 				}); -->
<!-- // 			}); -->
<!-- // 		}) -->
<!-- // 		//注意：导航 依赖 element 模块，否则无法进行功能性操作 -->
<!-- // 		layui.use('element', function() { -->
<!-- // 			var element = layui.element; -->

<!-- // 			//… -->
<!-- // 		}); -->
<!-- 	</script> -->
</body>

</html>