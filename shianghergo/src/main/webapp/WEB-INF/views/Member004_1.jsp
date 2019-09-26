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
<meta charset="UTF-8">
<script src="https://cdn.staticfile.org/jquery/3.2.1/jquery.min.js"></script>
<title>我參與的合購團明細</title>
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
	<table border="1" class="layui-table">

		<tr id='borderA' height='50' >
			<th id='borderA'  align="center">${loginOK.name}的商品明細</th>
		</tr>
		<tr id='borderA' height='36' >
			<th id='borderA'>訂單編號</th>
			<th id='borderA'>商品編號</th>
			<th id='borderA'>商品名稱</th>
			<th id='borderA'>數量</th>
			<th id='borderA'>價格</th>
		</tr>
		<c:forEach var="anGOrderD"  items="${MyGroupsListD}">
			<TR id='borderA' height='30'>
			<TD id='borderA' width="86" align="center">${anGOrderD.groups_order_info_id}</TD>
			<TD id='borderA' width="80" align="right">${anGOrderD.groups_item_id}</TD>
			<TD id='borderA' width="100" align="center">${anGOrderD.name}</TD>
			<TD id='borderA' width="100" align="left">&nbsp;${anGOrderD.amount}</TD>				
			<TD id='borderA' width="80" align="right">${anGOrderD.price}</TD>
			
		</TR>
		</c:forEach>
		
	</TABLE>

</body>
</html>