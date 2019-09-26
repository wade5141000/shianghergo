<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>新增商品</title>
</head>
<body>

	<form:form action="additem" method="POST"
		modelAttribute="groupsitemBean" enctype="multipart/form-data">
		<fieldset>
			<legend>新增商品上架</legend>
			<input type="hidden" name="gid" value="${gid}" />
			<div class="item">
				<label for="name" class="item-label">標題:</label>
				<form:input type="text" id="name" name="name" path="name" />
			</div>
			<div class="item">
				<label for="detail" class="item-label">商品說明:</label>
				<form:input type="text" id="detail" name="detail" path="detail" />
			</div>
			<div class="item">
				<label for="price" class="item-label">價格:</label>
				<form:input type="text" id="price" name="price" path="price" required="required" />
			</div>
			<div class="item">
				<label for="productImage" class="item-label">上傳圖片:</label>
				<form:input type="file" id="productImage" name="productImage" path="productImage" required="required"/>
			</div>



			<input type="submit" value="新增商品">
		</fieldset>
	</form:form>

</body>
</html>