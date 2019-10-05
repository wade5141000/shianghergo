<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" ></script>
<script src="http://static.runoob.com/assets/jquery-validation-1.14.0/lib/jquery.js"></script>
<script src="http://static.runoob.com/assets/jquery-validation-1.14.0/dist/jquery.validate.min.js"></script>
<script src="http://static.runoob.com/assets/jquery-validation-1.14.0/dist/localization/messages_zh.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" ></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" ></script>
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
<meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">
<head>
<meta charset="UTF-8">
<script src="https://cdn.staticfile.org/jquery/3.2.1/jquery.min.js"></script>
<title>我的面交地點</title>
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
<div>
<!-- 	<table border="1" class="table1"> -->
<jsp:include page="eric/header.jsp" />
	<div style="padding-bottom: 500px;">
		<jsp:include page="shianghergo/../BlackLine.jsp" />
<div style="padding-left: 290px;padding-right: 30px;">
	<table class="table table-hover">
		<tr id='borderA' height='50' >
			<th scope="col" id='borderA'  align="center">面交地點</th>
		</tr>
		<tr id='borderA' height='36' >
			<th scope="col" id='borderA'>地點編號</th>
			<th scope="col" id='borderA'>地址</th>
			<th scope="col" id='borderA'>時間</th>
		</tr>
		<c:forEach var="Myplace"  items="${getMyPlace}">
			<TR id='borderA' height='30'>
			<TD id='borderA' width="100" align="center">${Myplace.id}</TD>
			<TD id='borderA' width="100" align="center">${Myplace.address}</TD>
			<TD id='borderA' width="100" align="center">${Myplace.time}</TD>				
		</TR>
		</c:forEach>
	</TABLE>
</div>
</div>
</div>
<jsp:include page="eric/foot.jsp" />
</body>
</html>