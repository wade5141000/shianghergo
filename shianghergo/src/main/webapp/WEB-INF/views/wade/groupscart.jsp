<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<script src="http://code.jquery.com/jquery-1.12.4.min.js" ></script>
<meta charset="UTF-8">
<title>groups cart</title>
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
			<td>品名</td>
			<td>數量</td>
			<td>單價</td>
		</tr>
		<c:forEach var="item" items="${cartitems}">
		<tr>
			<td>${item.name}</td>
			<td>${item.amount}</td>
			<td>${item.price}</td>
		</tr>
		</c:forEach>
	</table>
	<a href="addgrouporder?gid=${cartitems[0].groups_id}">確認跟團</a>
</body>
</html>