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
</head>
<body>
	<jsp:include page="/WEB-INF/views/eric/header.jsp"></jsp:include>
	<section>
		<div class="container">
			<h1 style="text-align: center">修改商家資料</h1>
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
					<label class="control-label col-lg-2 col-lg-2" for='name'>
						商店名稱 </label>
					<div class="col-lg-10">
						<form:input id="name" path="name" type='text'
							class='form:input-large' value='${store.name}' />
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
							value='${store.detail }' />
					</div>
				</div>

				<div class="form-group">
					<div class='col-lg-offset-2 col-lg-10'>
						<input id="btnAdd" type='submit' class='btn btn-primary'
							value="確認修改" />
					</div>
				</div>

			</fieldset>
		</form:form>
		<form action="closeStore" method="POST">
			<input type=hidden value="${store.id}" name="id">
			<button type="submit" class="btn btn-success" onclick="close()">關閉商店</button>
		</form>
	</section>
	<jsp:include page="/WEB-INF/views/eric/foot.jsp"></jsp:include>
</body>
</html>