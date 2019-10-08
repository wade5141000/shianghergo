<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<script src="http://code.jquery.com/jquery-1.12.4.min.js" ></script>
<meta charset="UTF-8">
<title>付款結果</title>
<style>
td{
	border:1px solid gray;
}

tr:first-child td:first-child{
  border-top-left-radius: 5px;
}

tr:first-child td:last-child{
  border-top-right-radius: 5px;
}

tr:last-child td:first-child{
  border-bottom-left-radius: 5px;
}

tr:last-child td:last-child{
  border-bottom-right-radius: 5px;
}
body {
	margin: 0px;
	padding: 0px;
	background: #fff url('http://localhost:8080/shianghergo/images/bbg06.png') center center fixed ;　
}
</style>

</head>
<body style="background-color: #fffaf4;">
<jsp:include page="/WEB-INF/views/eric/header.jsp"></jsp:include>

<div style="text-align: center; margin: auto;">
		<h2 style="margin-top:20px;font-weight:bold">付款結果：<span style="color:#00bb00;font-weight:bold">成功</span></h2>
		<table style="margin:30px auto;width:450px;border-collapse: separate;border-spacing: 0;">
			<tr>
				<td style="background-color:#ffa042;color:#2828ff;font-weight:bold">訂單編號</td>
				<td>${order.id}</td>
			</tr>
			<tr>
				<td style="background-color:#ffa042;color:#2828ff;font-weight:bold">訂購時間</td>
				<td>${order.order_time}</td>
			</tr>
			<tr>
				<td style="background-color:#ffa042;color:#2828ff;font-weight:bold">訂單金額</td>
				<td>${order.price}</td>
			</tr>
			<tr>
				<td style="background-color:#ffa042;color:#2828ff;font-weight:bold">付款方式</td>
				<td>${order.payment}</td>
			</tr>

		</table>
	</div>



<jsp:include page="/WEB-INF/views/eric/foot.jsp"></jsp:include>
<script src="//cdn.bootcss.com/canvas-nest.js/1.0.1/canvas-nest.min.js"></script>
</body>
</html>