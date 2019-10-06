<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<!-- <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script> -->
<!-- <script -->
<!-- 	src="http://static.runoob.com/assets/jquery-validation-1.14.0/lib/jquery.js"></script> -->
<!-- <script -->
<!-- 	src="http://static.runoob.com/assets/jquery-validation-1.14.0/dist/jquery.validate.min.js"></script> -->
<!-- <script -->
<!-- 	src="http://static.runoob.com/assets/jquery-validation-1.14.0/dist/localization/messages_zh.js"></script> -->
<!-- <script -->
<!-- 	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script> -->
<!-- <script -->
<!-- 	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script> -->
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
<meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">
<head>
<script src="https://cdn.staticfile.org/jquery/3.2.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>我參與的合購</title>
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
	<jsp:include page="shianghergo/../BlackLine.jsp" />
	<div style="padding-bottom: 500px;">

		<div style="padding-left: 290px;padding-right: 30px;">
			<table class="table table-hover">

				<tr id='borderA' height='50'>
					<th id='borderA' align="center" colspan="7"><img  src="<c:url value='/images/c02.png' />" alt="..." >&nbsp;由
						${loginOK.name}參與的合購團</th>
				</tr>
				<tr id='borderA' height='36'>
					<th scope="col" id='borderA'>合購團編</th>
					<!-- 			<th id='borderA'>合購團名</th> -->
					<!-- 			<th id='borderA'>電話</th> -->
					<!-- 						<th id='borderA'>團編</th> -->
					<th scope="col" id='borderA'>總金額</th>
					<th scope="col" id='borderA'>下訂單時間</th>
					<th scope="col" id='borderA'>付款方式</th>
					<!-- 			<th id='borderA'>面交地點編號</th> -->
					<th scope="col" id='borderA'>面交地點</th>
					<th scope="col" id='borderA'>面交時間</th>
					<th id='borderA'>合購單詳情</th>
				</tr>
				<c:forEach var="MyGOL" items="${MyGroupsOrderList}">
					<TR id='borderA' height='30'>
						<TD id='borderA' >${MyGOL.id}</TD>
						<%-- 			<TD id='borderA'  align="center">${MyGOL.name}</TD> --%>
						<%-- 			<TD id='borderA'  align="center">${MyGOL.phone}</TD> --%>
						<%-- 							<TD id='borderA' align="center">${MyGOL.groups_id}</TD> --%>
						<TD id='borderA' >&nbsp;${MyGOL.price}</TD>
						<TD id='borderA' >${MyGOL.time}</TD>
						<c:if test="${MyGOL.payment==1}">
						<TD id='borderA' >面交付款</TD>
						</c:if>
						<c:if test="${MyGOL.payment==2}">
						<TD id='borderA' >銀行匯款</TD>
						</c:if>
						<c:if test="${MyGOL.payment==3}">
						<TD id='borderA' >面交付款、銀行匯款</TD>
						</c:if>
						<%-- 			<TD id='borderA'  align="center">${MyGOL.place.id}</TD> --%>
						<TD id='borderA' >${MyGOL.place.address}</TD>
						<TD id='borderA' >${MyGOL.place.time}</TD>
						<TD id='borderA' ><a
							href="<c:url value='getMyGOrderListD?groups_order_info_id=${MyGOL.id}' />">
								<button type="button" class="btn btn-primary btn-sm">詳情</button>
						</a></TD>
					</TR>
				</c:forEach>

			</TABLE>
		</div>
	</div>
	<jsp:include page="eric/foot.jsp" />
</body>
</html>


