<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Document</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/res/static/css/main.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/res/layui/css/layui.css">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/res/layui/layui.js"></script>
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
<meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">

<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>

<style>
*{

font-family: 微軟正黑體;
}

</style>

</head>
<body>

	<jsp:include page="/WEB-INF/views/eric/header.jsp"></jsp:include>


	<table class="table table-hover"
		style="width: 1100px; margin-left: 320px; margin-top: 50px;">

		<thead>
		 <p style="margin-left:320px">查詢[${name}]取得${size}筆資料</p>
			<tr>
				<th data-field="name"  class="alert alert-primary" role="alert">商品名稱</th>
				<th data-field="img" data-align="center" class="alert alert-primary" role="alert">商品圖片</th>
				<th data-field="price" data-sortable="true" class="alert alert-primary" role="alert">商品價位</th>
				<th data-field="detail" class="alert alert-primary" role="alert">商品描述</th>
			</tr>
		</thead>
		<tbody>

			<c:forEach varStatus="stVar" var="anSearch" items="${searchList}">
				<tr>
					<td>${anSearch.name}</td>
					<td><a
						href="http://localhost:8080/shianghergo/hao/product?id=${anSearch.id}">
							<img src="<c:url value='/hao/getPicture/${anSearch.id}' />"
							height="100">
					</a></td>
					<td>${anSearch.price}</td>
					<td>${anSearch.detail}</td>
				</tr>
			</c:forEach>

		</tbody>
	</table>

	<jsp:include page="/WEB-INF/views/eric/foot.jsp"></jsp:include>

</body>
</html>