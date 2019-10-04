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
<script src="https://cdn.staticfile.org/jquery/3.2.1/jquery.min.js"></script>
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

	<div style="padding-left: 290px;padding-right: 30px;">
		<table class="table table-hover">
		<tr id='borderA'>
			<th id='borderA' colspan="7">${loginOK.name}的訂購紀錄</th>
		</tr>
		<tr id='borderA'>
			<th scope="col" id='borderA'>訂單編號</th>
<!-- 			<th id='borderA'>商店名</th> -->
			<th scope="col" id='borderA'>購買品項種類</th>
			<th scope="col" id='borderA'>金額</th>
			<th scope="col" id='borderA'>訂單時間</th>
			<th scope="col" id='borderA'>付款方式</th>
			<th scope="col" id='borderA'>付款時間</th>
			<th scope="col" id='borderA'>訂單詳情</th>
		</tr>
<!-- 		 varStatus="i" -->
		<c:forEach var="anOrderBean"  items="${MyOrderList}">
			<TR id='borderA'>
			<TD id='borderA'  align="center">${anOrderBean.id} </TD>
<%-- 			<TD id='${i.index}'  align="center"></TD> --%>
<%-- 			<TD id='borderA' align="center">&nbsp;${anOrderBean.OrderDetailBean.name}</TD> --%>
			<TD id='borderA'>&nbsp;${anOrderBean.item_count}</TD>
			<TD id='borderA'>${anOrderBean.price}</TD>
			<TD id='borderA'>${anOrderBean.order_time}</TD>
			<TD id='borderA'>&nbsp;${anOrderBean.payment}</TD>
			<TD id='borderA'>${anOrderBean.pay_time}</TD>
			<TD id='borderA' ><a  href="<c:url value='getMyOrderListD?order_id=${anOrderBean.id}' />">
				<button type="button" class="btn btn-primary btn-sm">詳情</button>
			    </a></TD>				
		</TR>
		</c:forEach>
<%-- 		<c:forEach var="item"  items="${it}" varStatus="i"> --%>
<!-- 			<script> -->
<%--  				$("#"+"${i.index}").html("${item}"); --%>
<!-- 			</script> -->
<%-- 		</c:forEach> --%>
	</TABLE>
	</div>
	</div>
	<jsp:include page="eric/foot.jsp" />
</body>
</html>