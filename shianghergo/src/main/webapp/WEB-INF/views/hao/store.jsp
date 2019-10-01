<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css">
<title>Store</title>
<link rel='stylesheet'
	href='${pageContext.request.contextPath }/css/styles.css'
	type="text/css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/res/static/css/main.css">
<style>
.bang {
	padding: 100px;
	text-align: left;
	margin: auto;
	display: table;
	padding-top: 40px;
	padding-left: 140px;
	font-family: "Arial", "Microsoft YaHei", "黑體", "宋體", sans-serif;
	font-size: 20px;
}

.title {
	text-align: center;
	padding-top: 80px;
	font-size: 50px;
	padding-button: 30px;
	color: transparent;
	background-color: black;
	text-shadow: rgba(255, 255, 255, 0.5) 0 5px 6px,
		rgba(255, 255, 255, 0.2) 1px 3px 3px;
	-webkit-background-clip: text;
}

.buttons {
	text-align: right;
}

.store-bg{
	background-image:url('https://i.imgur.com/dqiRiVK.jpg');
}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/eric/header.jsp"></jsp:include>
	<div class="store-bg">
		<section>
			<div class="title">
				<div>
					<p>商店詳細資料</p>
				</div>
			</div>
		</section>
		<div class="bang">
			<section>
				<div>
					<div>
						<p>商家編號： ${store.id}
						<p>商店名稱： ${store.name}</p>
						<p>商店介紹： ${store.detail}</p>
						<c:set var="status" scope="session" value="${store.status}" />
						<c:if test="${status==1 }">
							<p>商店狀態： 正常</p>
						</c:if>
						<c:if test="${status==2 }">
							<p>商店狀態： 禁用</p>
						</c:if>
						<c:if test="${status==3 }">
							<p>商店狀態： 關閉</p>
						</c:if>

						<p align="right">
							<a href="<spring:url value='store/Update?id=${store.id }' />"
								class="btn btn-primary"> <span
								class="glyphicon-info-sigh glyphicon"></span>修改
							</a> <a href="<spring:url value='/hao/stores' />"
								class="btn btn-default"> <span
								class="glyphicon-hand-left glyphicon"></span>返回
							</a>
						</p>
					</div>
				</div>
			</section>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/eric/foot.jsp"></jsp:include>
</body>
</html>
