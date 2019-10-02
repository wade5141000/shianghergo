<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css">
<!-- 可选的 Bootstrap 主题文件（一般不用引入） -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap-theme.min.css">
<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/res/static/css/main.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/res/layui/css/layui.css">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/res/layui/layui.js"></script>
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
<meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">
<title>商家修改</title>
<script>
	function close() {
		var r = confirm("是否關閉商店")
		if (r == true) {
			alert('成功關閉商店');
			
		} else {
			alert('取消關閉商店');
		}
	}
</script>
<style type="text/css">
/* fieldset{ */
/* border:2px; */
/* } */

</style>
</head>
<body>

	<jsp:include page="/WEB-INF/views/eric/header.jsp" />
	<div class="main-nav" style="padding-bottom: 500px;">
	<ul class="layui-nav " lay-filter="" id="top">
		<li class="layui-nav-item"><a href="Member002"><i
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

	<section>
		<div class="container" style="padding:20px">
			<h1 style="text-align: center; font-size:50px">修改商家資料</h1>
		</div>
	</section>
	<hr
		style="height: 1px; border: none; color: #333; background-color: #333;">
	<section class="container">
		<!--       三個地方要完全一樣 -->
		<form:form method='POST' modelAttribute="storeBean"
			class='form-horizontal' enctype="multipart/form-data" >
			<fieldset style="padding-top:20px;text-align:center">
				<div class="form-group" >
					<label class="control-label col-lg-2 col-lg-2" for='name'>
						商店名稱 </label>
					<div class="col-lg-10">
						<form:input id="name" path="name" type='text'
							class='form:input-large' value='${store.name}' required="required" />
					</div>
				</div>


				<input type="hidden" id="id" path="id" class="form:input-large"
					value="${store.id }" readonly="readonly" />


				<div class="form-group">
					<label class='control-label col-lg-2 col-lg-2' for="detail">
						商店介紹 </label>
					<div class='col-lg-10'>
						<form:input id="detail" path="detail" type='text'
							style="width:400px;height:120px;" class='form:input-large'
							value='${store.detail }' required="required" />
					</div>
				</div>

				<div class="form-group">
					<div class='col-lg-offset-2 col-lg-10'>
						<input id="btnAdd" type='submit' class='btn btn-primary'
							value="確認修改" />
							<input type=hidden value="${store.id}" name="id">
							<button type="button" class="btn btn-success" onclick="close(${store.id})">關閉商店</button>
						<input type ="button"class="btn btn-success" onclick="history.back()" value="回到上一頁"></input>
					</div>
				</div>
			</fieldset>
		</form:form>
	</section>

	</div>
	<jsp:include page="/WEB-INF/views/eric/foot.jsp" />

</body>
</html>