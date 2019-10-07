<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<!-- <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" ></script> -->
<!-- <script src="http://static.runoob.com/assets/jquery-validation-1.14.0/lib/jquery.js"></script> -->
<!-- <script src="http://static.runoob.com/assets/jquery-validation-1.14.0/dist/jquery.validate.min.js"></script> -->
<!-- <script src="http://static.runoob.com/assets/jquery-validation-1.14.0/dist/localization/messages_zh.js"></script> -->
<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" ></script> -->
<!-- <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" ></script> -->
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
<jsp:include page="eric/header.jsp" />
<jsp:include page="BlackLine.jsp" />
<div  style="padding-bottom: 500px;">
	<div style="padding-left: 290px;padding-right: 30px;">
	<table class="table table-hover">
		<tr id='borderA' height='50' >
			<th id='borderA'  colspan="5"><img  src="<c:url value='/images/c02.png' />" alt="..." >&nbsp;合購訂單編號${id}的商品明細   </th>
		</tr>
		<tr id='borderA' height='36' >
<!-- 			<th scope="col" id='borderA'>訂單編號</th> -->
<!-- 			<th scope="col" id='borderA'>商品編號</th> -->
			<th scope="col" id='borderA'>商品名稱</th>
			<th scope="col" id='borderA'>數量</th>
			<th scope="col" id='borderA'>單價</th>
		</tr>
		<c:forEach var="anGOrderD"  items="${MyGroupsListD}">
			<TR id='borderA' >
<%-- 			<TD id='borderA'  >${anGOrderD.groups_order_info_id}</TD> --%>
<%-- 			<TD id='borderA' width="80" >${anGOrderD.groups_item_id}</TD> --%>
			<TD id='borderA'  >${anGOrderD.name}</TD>
			<TD id='borderA'  >${anGOrderD.amount}</TD>				
			<TD id='borderA'  >${anGOrderD.price}</TD>
			
		</TR>
		</c:forEach>
		
	</TABLE>
	</div>
</div>
</body>
</html>