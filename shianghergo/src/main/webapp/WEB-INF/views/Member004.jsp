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
<body >
	<table class="table table-hover">

		<tr id='borderA' height='50' >
			<th id='borderA'  align="center">由 ${loginOK.name}參與的合購團</th>
		</tr>
		<tr id='borderA' height='36' >
			<th id='borderA'>合購團編</th>
			<th id='borderA'>電話</th>
			<th id='borderA'>總金額</th>
			<th id='borderA'>時間</th>
			<th id='borderA'>付款方式</th>
			<th id='borderA'>面交地點編號</th>
		</tr>
		<c:forEach var="MyGOL"  items="${MyGroupsOrderList}">
			<TR id='borderA' height='30'>
			<TD id='borderA'  align="left">
			    <a  href="<c:url value='getMyGOrderListD?groups_order_info_id=${MyGOL.id}' />">
				    ${MyGOL.id}
			    </a>
			</TD>
			<TD id='borderA'  align="center">${MyGOL.phone}</TD>
			<TD id='borderA'  align="center">&nbsp;${MyGOL.price}</TD>
			<TD id='borderA'  align="center">${MyGOL.time}</TD>
			<TD id='borderA'  align="center">&nbsp;${MyGOL.payment}</TD>
			<TD id='borderA'  align="center">${MyGOL.place.id}</TD>				
		</TR>
		</c:forEach>
		
	</TABLE>

</body>
</html>