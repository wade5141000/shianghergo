<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<script src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/res/wade/css/groupscart.css">
	<script type="text/javascript" src="${pageContext.request.contextPath}/res/wade/js/groupscart.js"></script>
<meta charset="UTF-8">
<title>groups cart</title>
</head>
<body>
	<div class="cartdiv">
		<table class="tb">
			<tr>
				<th>我想團...</th>
				<th>數量</th>
				<th>單價</th>
				<th>小計</th>
				<th>操作</th>
			</tr>
			<c:forEach var="item" items="${cartitems}">
				<tr>
					<td>${item.name}</td>
					<td><button class="btn1" onclick="changeAmount(${item.id},2)">-</button ><span id="${item.id}">${item.amount}</span><button onclick="changeAmount(${item.id},1)" class="btn2">+</button>&nbsp;&nbsp;</td>
					<td>${item.price}</td>
					<td><span id="${item.id}a" style="color:red;"></span></td>
					<td><button onclick="deletetr(this,${item.id})">刪除</button></td>
					<script>
					var a = ${item.price} * ${item.amount};
					$("#"+${item.id}+"a").text(a);
					</script>
				</tr>
			</c:forEach>
			<tr>
				<td/>
				<td/>
				<td/>
				<td><span class="total">Total:</span><span id="total" class="total" style="color:red;">${total}</span></td>
				<td><a href="addgrouporder?gid=${cartitems[0].groups_id}">確認跟團</a></td>
			</tr>
		</table>
		<a href="index">回首頁</a>
	</div>
</body>
</html>