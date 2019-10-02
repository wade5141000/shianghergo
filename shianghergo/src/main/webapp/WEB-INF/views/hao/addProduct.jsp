<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
<head>
<meta charset="UTF-8">
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
/* 	border: 1px #cccccc solid; */
	background-color: white;
}

.bg {
	background-image: url('https://i.imgur.com/dqiRiVK.jpg');
	background-repeat: no-repeat;
}

.form-group {
	padding-bottom: 20px;
}
form{
	font-family: 微軟正黑體;
}
</style>
<title>Products</title>
</head>
<body>
<jsp:include page="/WEB-INF/views/eric/header.jsp" />
<jsp:include page="../BlackLine.jsp" />

<div  style="padding-bottom: 350px;">
	<div style="padding-left: 350px;padding-right: 350px;">

		<!--       三個地方要完全一樣 -->
		<form:form method='POST' modelAttribute="itemBean"
			class='form-horizontal' enctype="multipart/form-data">
			<fieldset style="margin-left: 350px;">
			<table class="table table-hover">
			<tr>
<!-- 				<td colspan=""></td> -->
				<td align="center" colspan="2"><h1>新增商品</h1></td>
			</tr>
			
			<tr>
				<td><label class="control-label col" for='name'>商品名稱 </label></td>
				<td><form:input id="name" path="name" type='text' class='form:input-large' /></td>
			</tr>
				<!-- 				<div class="form-group"> -->
				<!-- 					<label class="control-label col-lg-2 col-lg-2" for='category'> -->
				<!-- 						商品分類 </label> -->
				<!-- 					<div class="col-lg-10"> -->
				<%-- 						<form:input id="category" path="category" type='text' --%>
				<%-- 							class='form:input-large' /> --%>
				<!-- 					</div> -->
				<!-- 				</div> -->
				<tr>
				<td><label class='control-label col' for="category_id">分類 </label></td>
				<td><form:select path="categoryBean" name="categoryBean">
							<c:forEach var="categorys" items="${category}">
								<option value="${categorys.id}">${categorys.name}</option>
							</c:forEach>
						</form:select></td>
						<%-- 						<form:select id="category_id" required="required" path="category_id"> --%>
						<%-- 							<form:option value="60001" selected="selected">團購美食</form:option> --%>
						<%-- 							<form:option value="60002">保養美妝</form:option> --%>
						<%-- 							<form:option value="60003">服飾配件</form:option> --%>
						<%-- 							<form:option value="60004">育兒親子</form:option> --%>
				</tr>
<!-- 				<tr> -->
<!-- 				<td><label class="control-label col" for='store_id'> -->
<!-- 						商店名稱 (store_id)</label></td> -->
			<form:input id="store_id" path="store_id" type='hidden'
							class='form:input-large' value="${store_id}"  />
<!-- 			</tr> -->
<!-- 				<div class="form-group"> -->
<!-- 					<label class='control-label col-lg-2 col-lg-2' for="reserve"> -->
<!-- 						庫存數量 </label> -->
<!-- 					<div class='col-lg-10'> -->
<%-- 						<form:input id="reserve" path="reserve" type='text' --%>
<%-- 							class='form:input-large' /> --%>
<!-- 					</div> -->
<!-- 				</div> -->
				<tr>
				<td><label class='control-label col' for="price">
						價格 </label></td>
				<td><form:input id="price" path="price" type='text'
							class='form:input-large' /></td>
				</tr>
				<tr>
				<td><label class="control-label col" for='detail'>
						商品說明 </label></td>
				<td><form:input id="detail" path="detail" type='text'
							class='form:input-large' /></td>
				</tr>
				<tr>
				<td><label class='control-label col' for="productImage">
						商品圖片 </label></td>
				<td><form:input id="productImage" path="productImage" type='file'
							class='form:input-largt' /></td>
				</tr>
				</table>
				<div style="padding-left: 180px;padding-top: 10px;">
				<input id="btnAdd" type='submit' class='btn btn-primary'
							value="送出" />
				</div>
			</fieldset>
		</form:form>

	</div>
</div>

	<jsp:include page="/WEB-INF/views/eric/foot.jsp" />
</body>
</html>
