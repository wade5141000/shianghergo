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
	padding-left: 320px;
}

.bang {
	padding: 100px;
	text-align: left;
	margin: auto;
	display: table;
	padding-top: 40px;
	padding-left: 160px;
}

.form-horizontal {
	width: 280px;
	padding: 20px;
	margin-right: 50px;
	border: 1px #cccccc solid;
	background-color: white;
}

.bg {
	background-image: url('https://i.imgur.com/dqiRiVK.jpg');
	background-repeat: no-repeat;
}

.form-group {
	padding-bottom: 20px;
}
</style>
<title>Products</title>
</head>
<body>

	<jsp:include page="/WEB-INF/views/eric/header.jsp" />
	<div class="bg">
		<section>
			<div class="container" style="padding-top: 15px">
				<h1 style="text-align: center">新增商品資料</h1>
			</div>
		</section>
		<hr
			style="height: 1px; border: none; color: #333; background-color: #333;">
		<section class="container">
			<!--       三個地方要完全一樣 -->
			<form:form method='POST' modelAttribute="itemBean" class='bang'
				enctype="multipart/form-data">
				<div style="border: solid 1px gray; padding-top:20px; padding-left:10px; background-color:rgb(205, 207, 209);">
					<fieldset>
						<div class="form-group">
							<label class="control-label col-lg-4" for='name'> 商品名稱 </label>
							<div class="col-lg-8">
								<form:input id="name" path="name" type='text'
									class='form:input-large' required="required" />
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
							<label class='control-label col-lg-4' for="category_id">
								分類 </label>
							<div class='col-lg-8'>
								<%-- 						<form:select id="category_id" required="required" path="category_id"> --%>
								<%-- 							<form:option value="60001" selected="selected">團購美食</form:option> --%>
								<%-- 							<form:option value="60002">保養美妝</form:option> --%>
								<%-- 							<form:option value="60003">服飾配件</form:option> --%>
								<%-- 							<form:option value="60004">育兒親子</form:option> --%>
								<form:select path="categoryBean" name="categoryBean">
									<c:forEach var="categorys" items="${category}">
										<option value="${categorys.id}">${categorys.name}</option>
									</c:forEach>
								</form:select>
							</div>
						</div>


						<div class="form-group">
							<div class="col-lg-10">
								<form:input id="store_id" path="store_id" type='hidden'
									class='form:input-large' value="${store_id }" />
							</div>
						</div>


						<!-- 				<div class="form-group"> -->
						<!-- 					<label class='control-label col-lg-2 col-lg-2' for="reserve"> -->
						<!-- 						庫存數量 </label> -->
						<!-- 					<div class='col-lg-10'> -->
						<%-- 						<form:input id="reserve" path="reserve" type='text' --%>
						<%-- 							class='form:input-large' /> --%>
						<!-- 					</div> -->
						<!-- 				</div> -->


						<div class="form-group">
							<label class='control-label col-lg-4' for="price"> 價格 </label>
							<div class='col-lg-8'>
								<form:input id="price" path="price" type='text'
									class='form:input-large' required="required" />
							</div>
						</div>


						<div class="form-group">
							<label class="control-label col-lg-4" for='detail'> 商品說明
							</label>
							<div class="col-lg-8">
								<form:input id="detail" path="detail" type='text'
									class='form:input-large' required="required" />
							</div>
						</div>




						<div class="form-group">
							<label class='control-label col-lg-4' for="productImage">
								商品圖片 </label>
							<div class='col-lg-8'>
								<form:input id="productImage" path="productImage" type='file'
									class='form:input-largt' />
							</div>
						</div>


						<div class="form-group" style="padding-top:10px;">
							<div class='col-lg-offset-2 col-lg-10' style="padding-left: 85px">
								<input id="btnAdd" type='submit' class='btn btn-primary'
									value="送出" />
							</div>
						</div>
					</fieldset>
				</div>
			</form:form>
		</section>
	</div>
	<jsp:include page="/WEB-INF/views/eric/foot.jsp" />
</body>
</html>
