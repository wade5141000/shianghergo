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
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/res/static/css/main.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/res/layui/css/layui.css">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/res/layui/layui.js"></script>
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
<meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">
<head>
<script src="https://cdn.staticfile.org/jquery/3.2.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>我建立的合購</title>
<style type="text/css">
.table1 {
	border: 1px solid #ddd;
	width: 900px;
}

thead {
	background-color: lightblue;
}
</style>
</head>
<body>
<jsp:include page="eric/header.jsp" />
	<div class="main-nav" style="padding-bottom: 500px;">
		<ul class="layui-nav " lay-filter="" id="top">
			<li class="layui-nav-item"><a href="Member002"><i class="layui-icon layui-icon-star"></i>我購買的商品</a></li>
			<li class="layui-nav-item layui-this"><a href="Member003"><i class="layui-icon layui-icon-star"></i>我建立的合購</a></li>
			<li class="layui-nav-item"><a href="Member004"><i class="layui-icon layui-icon-star"></i>我參與的合購</a></li>
			<li class="layui-nav-item "><a href="getMyMessage"><i class="layui-icon layui-icon-star"></i>我的留言板</a></li>
<!-- 			<li class="layui-nav-item"><a href="goRegisterPage">加入會員</a></li> -->
			<li class="layui-nav-item "><a href="MyMessage"><i class="layui-icon layui-icon-star"></i>寄件備份</a></li>
			<li class="layui-nav-item "><a href="Member001"> <img
					src="<c:url value='getmemberPicture/${loginOK.id}'/>" class="layui-nav-img">${loginOK.name}
			</a></li>
			<li class="layui-nav-item"><a href="logout"><i class="layui-icon layui-icon-star"></i>登出</a></li>
		</ul>
		<div style="padding-left: 350px;padding-right: 350px;">
			<table class="layui-table">
				<tr id='borderA' height='50'>
					<th id='borderA' align="center"colspan="8">由 ${loginOK.name}發起的合購團</th>
				</tr>
				<tr id='borderA' height='36'>
					<th id='borderA'>合購編號</th>
					<th id='borderA'>開始時間</th>
					<th id='borderA'>截止時間</th>
					<th id='borderA'>團名</th>
					<th id='borderA'>簡介</th>
					<th id='borderA'>付款方式</th>
					<th id='borderA'>我的團員</th>
					<th id='borderA'>商品明細</th>
				</tr>
				<c:forEach var="anGroupsBean" items="${MyGroupsList}">
					<TR id='borderA' height='30'>
						<TD id='borderA' align="center" >${anGroupsBean.id}</TD>
						<TD id='borderA' align="center">${anGroupsBean.start_time}</TD>
						<TD id='borderA' align="center">&nbsp;${anGroupsBean.end_time}</TD>
						<TD id='borderA' align="center">${anGroupsBean.name}</TD>
						<TD id='borderA' align="center">&nbsp;${anGroupsBean.detail}</TD>
						<TD id='borderA' align="center">${anGroupsBean.payment}</TD>
						<TD id='borderA' align="center"><a
							href="<c:url value='getMyGroupsPerson?groups_id=${anGroupsBean.id}' />">
								<button type="button" class="layui-btn layui-btn-radius layui-btn-danger">詳情</button> </a></TD>
					<TD id='borderA' align="center"><a
							href="<c:url value='getMyGroupsListD?groups_id=${anGroupsBean.id}' />">
								 <button type="button" class="layui-btn layui-btn-radius layui-btn-danger">詳情</button></a></TD>
					</TR>
				</c:forEach>

			</TABLE>
		</div>
	</div>
	
	<jsp:include page="eric/foot.jsp" />

</body>
</html>