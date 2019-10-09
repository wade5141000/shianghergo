<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<link rel="icon" href="images/logo4.ico"/>
<meta charset="UTF-8">
<title>新增商品</title>
<style>
body {
	margin: 0px;
	padding: 0px;
	background: #fff url('../images/bbg06.png') center center fixed ;　
}

</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/eric/header.jsp" />
	<jsp:include page="../BlackLine.jsp" />
	<div class="container" style="padding-bottom: 250px;">
		<div style="padding-left: 150px; padding-right: 150px;">
			<form:form action="additem(mb)" method="POST"
				modelAttribute="groupsitemBean" enctype="multipart/form-data">
				<fieldset>
					<!-- 			<legend>新增商品上架</legend> -->
					<input type="hidden" name="gid" value="${gid}" />
					<div class="card text-center">
						<div class="card-header">新增商品上架</div>
						<div class="card-body">
							<table style="font-size: :16px" class="rwd-table">
								<tr>
									<td><label for="name" class="item-label">商品名稱:</label></td>
									<td><form:input type="text" id="name" name="name"
											path="name" /></td>
								</tr>
								<tr>
									<td><label for="detail" class="item-label">商品說明:</label></td>
									<td><form:input type="text" id="detail" name="detail"
											path="detail" /></td>
								</tr>
								<tr>
									<td><label for="price" class="item-label">價格:</label></td>
									<td><form:input type="text" id="price" name="price"
											path="price" required="required" /></td>
								</tr>
								<tr>
									<td><label for="productImage" class="item-label">上傳圖片:</label></td>
									<td><form:input type="file" id="productImage"
											name="productImage" path="productImage" required="required" /></td>
								</tr>

							</table>
						</div>
					</div>
					<div class="card-footer text-muted"
						style="padding-left: 250px; padding-top: 10px;">
						<input type="submit" value="新增商品" class="btn btn-primary">
						<a class="btn btn-primary" href="javascript:history.go(-1)">取消</a>
					</div>
				</fieldset>
			</form:form>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/eric/foot.jsp"></jsp:include>
<script src="//cdn.bootcss.com/canvas-nest.js/1.0.1/canvas-nest.min.js"></script>
</body>
</html>