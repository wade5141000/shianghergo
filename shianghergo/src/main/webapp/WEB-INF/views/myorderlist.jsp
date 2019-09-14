<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<script src="http://code.jquery.com/jquery-1.12.4.min.js" ></script>
<meta charset="UTF-8">
<title>orderlist</title>
<style>
table {
	margin: 10px;
	padding: 10px;
	border-collapse: collapse;
}

tr{ 
	margin:10px;
 	padding:10px; 
 } 

td{  
 	margin:10px; 
 	padding:10px; 
 } 
span{
 	padding:5px;
 }
</style>
</head>
<body>
<h4><a href="index">回首頁</a></h4>
<table border="1">
<tr>
	<td>訂單編號</td>
	<td>訂購時間</td>
	<td>品項數量</td>
	<td>訂單總額</td>
	<td>訂單狀態</td>
	<td>訂單詳情</td>
</tr>
	<c:forEach var="order" items="${orders}">
		<tr>
			<td>${order.id}</td>
			<td>${order.order_time}</td>
			<td>${order.item_count}</td>
			<td>${order.price}</td>
			<c:if test="${order.status == 1}" var="flag">
				<td>已付款</td>
			</c:if>
			<c:if test="${not flag}">
				<td><a href="order/${order.id}">未付款</a></td>
			</c:if>
			<td><a href="orderdetail/${order.id}">點我查看</a></td>
		</tr>
	</c:forEach>
</table>
</body>
</html>