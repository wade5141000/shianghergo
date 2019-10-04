<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>我購買的商品</title>
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
<body >
<jsp:include page="eric/header.jsp" />
	<div  style="padding-bottom: 300px;">
	<jsp:include page="shianghergo/../BlackLine.jsp" />

	<div style="padding-left: 350px;padding-right: 350px;">
		<table class="table table-hover">
		<tr id='borderA'>
			<th id='borderA' colspan="7">我的站內通知</th>
		</tr>
		<tr id='borderA'>
			<th scope="col" id='borderA'>通知信編號</th>
			<th scope="col" id='borderA'>標題</th>
			<th scope="col" id='borderA'>內容</th>
			<th scope="col" id='borderA'>通知時間</th>
		</tr>
<!-- 		 varStatus="i" -->
		<c:forEach var="annoti"  items="${getMyNotification}">
			<TR id='borderA'>
			<TD id='borderA'  align="center">${annoti.id} </TD>
			<TD id='borderA'>${annoti.title}</TD>
			<TD id='borderA'>${annoti.contents}</TD>
			<TD id='borderA'>${annoti.time}</TD>				
		</TR>
		</c:forEach>
	</TABLE>
	</div>
	</div>
	<jsp:include page="eric/foot.jsp" />
</body>
</html>