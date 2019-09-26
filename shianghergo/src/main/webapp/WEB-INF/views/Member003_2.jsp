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
	<table border="1" class="layui-table">

		<tr id='borderA' height='50' >
			<th id='borderA'  align="center">團員資料</th>
		</tr>
		<tr id='borderA' height='36' >
			<th id='borderA'>會員id</th>
			<th id='borderA'>會員姓名</th>
			<th id='borderA'>會員電話</th>
			<th id='borderA'>金額</th>
			<th id='borderA'>付款時間</th>
			<th id='borderA'>付款方式</th>
			<th id='borderA'>面交地點</th>
			<th id='borderA'>面交時間</th>
		</tr>
		<c:forEach var="MyGP"  items="${getMyGroupsPerson}">
			<TR id='borderA' height='30'>
			<TD id='borderA'  align="center">
			    <a  href="<c:url value='sendMemberMessage?target=${MyGP.member_id}' />">
				    ${MyGP.member_id}<br><span class="layui-badge">連絡他</span>
			    </a>
			</TD>
			<TD id='borderA' width="100" align="center">${MyGP.name}</TD>
<%-- 			<TD id='borderA' width="100" align="center">${MyGP.name}</TD> --%>
			<TD id='borderA' width="100" align="center">${MyGP.phone}</TD>				
			<TD id='borderA' width="100" align="center">${MyGP.price}</TD>
			<TD id='borderA' width="100" align="center">${MyGP.time}</TD> 
			<TD id='borderA' width="100" align="center">${MyGP.payment}</TD>
			<TD id='borderA' width="100" align="center">${MyGP.place.address}</TD>
			<TD id='borderA' width="100" align="center">${MyGP.place.time}</TD>
			
			
<!-- 			<TD id='borderA' width="100" align="center"><a -->
<%-- 					href="<c:url value='getMyGroupsplace?place_id=${MyGP.place.id}' />"> --%>
<%-- 						${MyGP.place.id} </a></TD> --%>
<!-- 		</TR> -->
		</c:forEach>
		
	</TABLE>

</body>
</html>