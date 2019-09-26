<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
<head>

<meta charset="UTF-8">
<link rel="stylesheet"
	href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css">
<style type="text/css">
fieldset {
	border: 1px solid rgb(255, 232, 57);
	width: 400px;
	margin: auto;
}
</style>
<title>Products</title>
</head>
<body>
	<section>
		<div class="container">
			<h1 style="text-align: center">
				新增商品資料
			</h1>
		</div>
	</section>
	<hr
		style="height: 1px; border: none; color: #333; background-color: #333;">
	<section class="container">
		<!--       三個地方要完全一樣 -->
		<form:form method='POST' modelAttribute="itemBean"
			class='form-horizontal' enctype="multipart/form-data">
			<fieldset>
				<div class="form-group">
					<label class="control-label col-lg-2 col-lg-2" for='name'>
						商品名稱 </label>
					<div class="col-lg-10">
						<form:input id="name" path="name" type='text'
							class='form:input-large' />
					</div>
				</div>


<!-- 				<div class="form-group"> -->
<!-- 					<label class="control-label col-lg-2 col-lg-2" for='category'> -->
<!-- 						商品分類 </label> -->
<!-- 					<div class="col-lg-10"> -->
<%-- 						<form:input id="category" path="category" type='text' --%>
<%-- 							class='form:input-large' /> --%>
<!-- 					</div> -->
<!-- 				</div> -->

				<div class="form-group">
					<label class='control-label col-lg-2 col-lg-2' for="category">
						分類 </label>
					<div class='col-lg-10'>
						<form:select path="category">
							<form:option value="-1">
								請挑選
							</form:option>
							<form:options items="${categoryList }" />
						</form:select>
					</div>
				</div>

				<div class="form-group">
					<label class="control-label col-lg-2 col-lg-2" for='store_id'>
						商店名稱 (store_id)</label>
					<div class="col-lg-10">
						<form:input id="store_id" path="store_id" type='text'
							class='form:input-large' />
					</div>
				</div>

				<div class="form-group">
					<label class='control-label col-lg-2 col-lg-2' for="reserve">
						庫存數量
					</label>
					<div class='col-lg-10'>
						<form:input id="reserve" path="reserve" type='text'
							class='form:input-large' />
					</div>
				</div>

				<div class="form-group">
					<label class='control-label col-lg-2 col-lg-2' for="price">
						價格
					</label>
					<div class='col-lg-10'>
						<form:input id="price" path="price" type='text'
							class='form:input-large' />
					</div>
				</div>
				
				<div class="form-group">
					<label class="control-label col-lg-2 col-lg-2" for='detail'>
						商品說明 </label>
					<div class="col-lg-10">
						<form:input id="detail" path="detail" type='text'
							class='form:input-large' />
					</div>
				</div>

				<div class="form-group">
					<label class='control-label col-lg-2 col-lg-2' for="productImage">
						商品圖片
					</label>
					<div class='col-lg-10'>
						<form:input id="productImage" path="productImage" type='file'
 							class='form:input-largt' /> 
					</div>
				</div>

				<div class="form-group">
					<div class='col-lg-offset-2 col-lg-10'>
						<input id="btnAdd" type='submit' class='btn btn-primary'
							value="送出" />
					</div>
				</div>
			</fieldset>
		</form:form>
	</section>
</body>
</html>
