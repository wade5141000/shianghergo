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
<head>
<meta charset="UTF-8">
<script src="https://cdn.staticfile.org/jquery/3.2.1/jquery.min.js"></script>
<title>我建立合購團明細</title>
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
	<table border="1" class="table1">

		<tr id='borderA' height='50' >
			<th id='borderA'  align="center">由${loginOK.name}建立合購團明細</th>
		</tr>
		<tr id='borderA' height='36' >
			<th id='borderA'>合購團編</th>
			<th id='borderA'>商品編號</th>
			<th id='borderA'>單價</th>
			<th id='borderA'>數量</th>
			<th id='borderA'>商品名稱</th>
		</tr>
		<c:forEach var="anGroupsD"  items="${MyGroupsListD}">
			<TR id='borderA' height='30'>
			<TD id='borderA' width="100" align="center">${anGroupsD.groups_id}</TD>
			<TD id='borderA' width="100" align="center">${anGroupsD.groups_item_id}</TD>
			<TD id='borderA' width="100" align="center">${anGroupsD.price}</TD>				
			<TD id='borderA' width="100" align="center">${anGroupsD.amount}</TD>
			<TD id='borderA' width="100" align="center">${anGroupsD.name}</TD>
		</TR>
		</c:forEach>
		
	</TABLE>

</body>
</html>