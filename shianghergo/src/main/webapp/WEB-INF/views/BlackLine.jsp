<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script
	src="http://static.runoob.com/assets/jquery-validation-1.14.0/lib/jquery.js"></script>
<script
	src="http://static.runoob.com/assets/jquery-validation-1.14.0/dist/jquery.validate.min.js"></script>
<script
	src="http://static.runoob.com/assets/jquery-validation-1.14.0/dist/localization/messages_zh.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
<meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">
<head>
<script src="https://cdn.staticfile.org/jquery/3.2.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>會員黑條(共同)</title>
<!--  六角bootstrap -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
	integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"
	integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"
	integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k"
	crossorigin="anonymous"></script>
<style>
li {
	line-height: 1em;
}
</style>
</head>
<body>
	<div style="float: left; width: 250px">
		<ul class="list-group" id="top">
			<li
				class="list-group-item list-group-item-action list-group-item-info"
				style="background-color: #ffffdf; border-style: dashed;"><a
				href="${pageContext.request.contextPath}/Member002"
				style="color: #ff8000; font-family: 微軟正黑體;">我購買的商品</a></li>
			<li
				class="list-group-item list-group-item-action list-group-item-info"
				style="background-color: #ffffdf; border-style: dashed;"><a
				href="${pageContext.request.contextPath}/Member003"
				style="color: #ff8000; font-family: 微軟正黑體;"> 我建立的合購</a></li>
			<li
				class="list-group-item list-group-item-action list-group-item-info"
				style="background-color: #ffffdf; border-style: dashed;"><a
				href="${pageContext.request.contextPath}/Member004"
				style="color: #ff8000; font-family: 微軟正黑體;"> 我參與的合購</a></li>
			<li
				class="list-group-item list-group-item-action list-group-item-info"
				style="background-color: #ffffdf; border-style: dashed;"><a
				href="${pageContext.request.contextPath}/getMyMessage"
				style="color: #ff8000; font-family: 微軟正黑體;"> 我的留言板</a></li>

			<li
				class="list-group-item list-group-item-action list-group-item-info"
				style="background-color: #ffffdf; border-style: dashed;"><a
				href="${pageContext.request.contextPath}/MyMessage"
				style="color: #ff8000; font-family: 微軟正黑體;"> 寄件備份</a></li>
			<li
				class="list-group-item list-group-item-action list-group-item-info"
				style="background-color: #ffffdf; border-style: dashed;"><a
				href="${pageContext.request.contextPath}/Member001"
				style="color: #ff8000; font-family: 微軟正黑體;"> <img
					src="<c:url value='${pageContext.request.contextPath}/getmemberPicture/${loginOK.id}'/>">${loginOK.name}
			</a></li>
			<li
				class="list-group-item list-group-item-action list-group-item-info"
				style="background-color: #ffffdf; border-style: dashed;"><a
				href="${pageContext.request.contextPath}/logout"
				style="color: #ff8000; font-family: 微軟正黑體;"> 登出</a></li>
			<li
				class="list-group-item list-group-item-action list-group-item-info"
				style="background-color: #ffffdf; border-style: dashed;"><a
				href="${pageContext.request.contextPath}/hao/buildStore"
				style="color: #ff8000; font-family: 微軟正黑體;"> 我的商店</a></li>
			<li
				class="list-group-item list-group-item-action list-group-item-info"
				style="background-color: #ffffdf; border-style: dashed;"><a
				href="${pageContext.request.contextPath}/hao/products/add"
				style="color: #ff8000; font-family: 微軟正黑體;"> 新增商品</a></li>
			<li
				class="list-group-item list-group-item-action list-group-item-info"
				style="background-color: #ffffdf; border-style: dashed;"><a
				href="${pageContext.request.contextPath}/hao/myProducts"
				style="color: #ff8000; font-family: 微軟正黑體;">我的商品列表</a></li>
			<li
				class="list-group-item list-group-item-action list-group-item-info"
				style="background-color: #ffffdf; border-style: dashed;"><a
				href="${pageContext.request.contextPath}/hao/products"
				style="color: #ff8000; font-family: 微軟正黑體;"> 4</a></li>
			<li
				class="list-group-item list-group-item-action list-group-item-info"
				style="background-color: #ffffdf; border-style: dashed;"><a
				href="${pageContext.request.contextPath}/hao/productUpdate"
				style="color: #ff8000; font-family: 微軟正黑體;"> 5</a></li>
				
			<li
				class="list-group-item list-group-item-action list-group-item-info"
				style="background-color: #ffffdf; border-style: dashed;"><a
				href="${pageContext.request.contextPath}/hao/store"
				style="color: #ff8000; font-family: 微軟正黑體;"> ${loginOK.id}</a></li>
			<li
				class="list-group-item list-group-item-action list-group-item-info"
				style="background-color: #ffffdf; border-style: dashed;"><a
				href="${pageContext.request.contextPath}/hao/stores"
				style="color: #ff8000; font-family: 微軟正黑體;"> ${store.member_id}</a></li>
		</ul>

	</div>
</body>
</html>