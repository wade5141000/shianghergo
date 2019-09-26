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
<div>
<!-- 	<table border="1" class="table1"> -->
		<table class="layui-table">
		<tr id='borderA' height='50' >
			<th id='borderA'  align="center">${loginOK.name}的訂購紀錄</th>
		</tr>
		<tr id='borderA' height='36' >
			<th id='borderA'>訂單編號</th>
<!-- 			<th id='borderA'>商店名</th> -->
			<th id='borderA'>購買品項種類</th>
			<th id='borderA'>金額</th>
			<th id='borderA'>訂單時間</th>
			<th id='borderA'>付款方式</th>
			<th id='borderA'>付款時間</th>
		</tr>
<!-- 		 varStatus="i" -->
		<c:forEach var="anOrderBean"  items="${MyOrderList}">
			<TR id='borderA' height='30'>
			<TD id='borderA'  align="center">
			    <a  href="<c:url value='getMyOrderListD?order_id=${anOrderBean.id}' />">
				    ${anOrderBean.id}
			    </a>
			</TD>
<%-- 			<TD id='${i.index}'  align="center"></TD> --%>
<%-- 			<TD id='borderA' align="center">&nbsp;${anOrderBean.OrderDetailBean.name}</TD> --%>
			<TD id='borderA' align="center">&nbsp;${anOrderBean.item_count}</TD>
			<TD id='borderA'  align="center">${anOrderBean.price}</TD>
			<TD id='borderA'  align="center">${anOrderBean.order_time}</TD>
			<TD id='borderA'  align="center">&nbsp;${anOrderBean.payment}</TD>
			<TD id='borderA'  align="center">${anOrderBean.pay_time}</TD>				
		</TR>
		</c:forEach>
<%-- 		<c:forEach var="item"  items="${it}" varStatus="i"> --%>
<!-- 			<script> -->
<%--  				$("#"+"${i.index}").html("${item}"); --%>
<!-- 			</script> -->
<%-- 		</c:forEach> --%>
	</TABLE>
	</div>
</body>
</html>