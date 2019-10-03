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
<jsp:include page="/WEB-INF/views/eric/header.jsp" />
<jsp:include page="../BlackLine.jsp" />
<div class="container">	
	<div class="border border-success"style="padding-left: 300px;padding-right: 300px;">
	<form:form action="additem(mb)" method="POST"
		modelAttribute="groupsitemBean" enctype="multipart/form-data">
		<fieldset>
<!-- 			<legend>新增商品上架</legend> -->
			<input type="hidden" name="gid" value="${gid}" />
			<table style="font-size: :16px"class="rwd-table">
			<tr>
			<td align="center" colspan="2"><h1>新增商品上架</h1></td>
			</tr>
			<tr>
			<td><label for="name" class="item-label">標題:</label></td>
			<td><form:input type="text" id="name" name="name" path="name" /></td>
			</tr>
			<tr>
			<td><label for="detail" class="item-label">商品說明:</label></td>
			<td><form:input type="text" id="detail" name="detail" path="detail" /></td>
			</tr>
			<tr>
			<td><label for="price" class="item-label">價格:</label></td>
			<td><form:input type="text" id="price" name="price" path="price" required="required" /></td>
			</tr>
			<tr>
			<td><label for="productImage" class="item-label">上傳圖片:</label></td>
			<td><form:input type="file" id="productImage" name="productImage" path="productImage" required="required"/></td>
			</tr>

			</table>
			<div style="padding-left: 150px;padding-top: 10px;"> 
			<input type="submit" value="新增商品"class="btn btn-primary"	>
			</div>
		</fieldset>
	</form:form>
</div>
</div>
</body>
</html>