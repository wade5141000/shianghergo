<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
<meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">
<title>Store</title>
<style type="text/css">
/* #DIV1 { */
/* 	-moz-border-image: url("/`images/01.png") 30 30 round; /* 給 Firefox 看*/

	/* 	-webkit-border-image: url("/images/01.png") 30 30 round; */
	/* 	/* 給 Safari 與 Chrome 看*/  
	/* 	border-image: url("/images/01.png") 30 30 round; */
	/* } */ 
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

	<%-- 		<img  src="<c:url value='/images/t02.png' />" alt="..." > --%>

	<div style="padding-bottom: 350px;">
		<div style="padding-left: 350px; padding-right: 350px;" id="DIV1">
			<div class="card-header"
				style="margin-top: 25px; margin-top: 10px; box-shadow: 3px 3px 12px #FF7F24; width: 1100px; line-height: 100px; text-align: center;">
				<h1 style="font-family: 微軟正黑體;">
					<img src="<c:url value='/images/t02.jpg' />" alt="...">&nbsp;商店資訊
				</h1>
			</div>
			<br> <img src="<c:url value='/images/01.png' />" alt="...">
			<br>
			<div class="card-body"style="font-family: 微軟正黑體;">
				<h1 class="card-text"><img  src="<c:url value='/images/line08.png' />" alt="..." >&nbsp;商家編號：<small class="text-muted">${store.id}</small></h1>
				<h1 class="card-text"><img  src="<c:url value='/images/line08.png' />" alt="..." >&nbsp;商店名稱:<small class="text-muted">&nbsp;${store.name}</small></h1>
				<h1 class="card-text"><img  src="<c:url value='/images/line08.png' />" alt="..." >&nbsp;商店介紹：<small class="text-muted">&nbsp;${store.detail}</small></h1>
				<h1 class="card-text">
					<c:set var="status" scope="session" value="${store.status}" />
					<c:if test="${status==1 }">
						<h1><img  src="<c:url value='/images/line08.png' />" alt="..." >&nbsp;商店狀態：<small class="text-muted">正常</small></h1>
					</c:if>
					<c:if test="${status==2 }">
						<h1><img  src="<c:url value='/images/line08.png' />" alt="..." >&nbsp;商店狀態：<small class="text-muted">禁用</small></h1>
					</c:if>
					<c:if test="${status==3 }">
						<h1><img  src="<c:url value='/images/line08.png' />" alt="..." >&nbsp;商店狀態：<small class="text-muted">關閉</small></h1>
					</c:if>
			</div>
			<br>
			<br> <img src="<c:url value='/images/01.png' />" alt="...">
			<br>
			<div
				style="padding-left: 20px; padding-top: 30px; box-shadow: 3px 3px 12px #FF7F24; width: 1100px; line-height: 100px; text-align: center;"
				class="card-footer text-muted">
				<%-- 				<h3>商家編號：${store.id}</h3> --%>
				<%-- 				<p>商店名稱:：${store.name}</p> --%>
				<%-- 				<p>商店介紹： ${store.detail}</p> --%>
				<c:if test="${status==1 }">
					<a href="<spring:url value='store/Update?id=${store.id }' />"
						class="btn btn-primary">修改 </a>
				</c:if>
			</div>

		</div>

	</div>

	<jsp:include page="/WEB-INF/views/eric/foot.jsp" />
	<script src="//cdn.bootcss.com/canvas-nest.js/1.0.1/canvas-nest.min.js"></script>
</body>
</html>
