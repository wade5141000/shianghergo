<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>商家修改</title>
</head>
<body>
<section>
		<div class="container">
			<h1 style="text-align: center">
				修改商家資料
			</h1>
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


				<div class="form-group">
					<label class="control-label col-lg-2 col-lg-2" for="id">
						商店編號 </label>
					<div class="col-lg-10">
					<input type="text" id="id" path="id" class="form:input-large"
					 value="${store.id }" readonly="readonly" />
						
					</div>
				</div>

				<div class="form-group">
					<label class='control-label col-lg-2 col-lg-2' for="detail">
						商店介紹
					</label>
					<div class='col-lg-10'>
						<form:input id="detail" path="detail" type='text'
							class='form:input-large' value='${store.detail }' />
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
	</section>
</body>
</html>