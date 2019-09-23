<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" ></script>
<script src="http://static.runoob.com/assets/jquery-validation-1.14.0/lib/jquery.js"></script>
<script src="http://static.runoob.com/assets/jquery-validation-1.14.0/dist/jquery.validate.min.js"></script>
<script src="http://static.runoob.com/assets/jquery-validation-1.14.0/dist/localization/messages_zh.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" ></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" ></script>
<title>login</title>
<script type=“text/javascript”></script>
<script>
	$(document).ready(function() {
		$("#loginForm").validate({
			rules : { //配置验证规则，key就是被验证的dom对象，value就是调用验证的方法(也是json格式)
				account : {
					required : true,
				},
				password : {
					required : true,
				},
			},
			messages : {
				account : {
					required : "帳號為必填",
				},
				password : {
					required : "密碼為必填",
				},
			}
		});
	});

	/*******************************插件新功能-设置插件validator的默认参数*****************************************/
	$.validator.setDefaults({
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
body {
	font-family: Microsoft Yahei;
	font-size: 15px;
}

fieldset {
	width: 800px;
	margin: auto;
}

legend {
	margin: auto;
}

.item {
	height: 56px;
	line-height: 36px;
	margin: 10px;
}

.item .item-label {
	float: left;
	width: 100px;
	text-align: right;
}

.item-text {
	float: left;
	width: 270px;
	height: 16px;
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
	<!-- 引入共同的頁首 -->
	<jsp:include page="top.jsp" />
	<div class="container">
		<form action="login.do" method="post" id="loginForm" name="">
			<fieldset>
				<legend>會員登入</legend>
				<div class="item">
					<label for="account" class="item-label">帳號:</label> <input
						type="text" id="account" name="account" path="account"
						class="item-text" placeholder="請輸入帳號" autocomplete="off"
						tip="請輸入帳號" />
				</div>
				<div class="item">
					<label for="loginpassword" class="item-label">密碼:</label> <input
						type="password" id="password" name="password" path="password"
						class="item-text" placeholder="請輸入密碼" tip="長度需6-16個字" />
				</div>
				<div class="item">
					<input type="submit" value="提交" class="item-submit"> <input
						type="reset" value="重填" name="cancel" id="cancel"> <a
						href="goRegisterPage"><input type="button" value="加入會員" /></a>
				</div>
			</fieldset>
		</form>
	</div>
</body>

</html>