<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/res/wade/css/orderform.css">
<title>填寫跟團資料</title>
</head>
<body>

	<!-- 要給姓名 電話 付款方式 面交地點 -->
	<div class="formdiv">
	<h2>輸入你的基本資料，讓主購人方便聯繫你</h2>
		<form action="orderform" method="post">
			<input type="hidden" name="oId" value="${order.id}">
			姓名:<input type="text" name="name" ><br>
			電話:<input type="text" name="phone" ><br>
			
			付款方式:
			<c:if test="${payment == 1}">
				面交付款<input type="radio" name="pay" value="1" checked><br>
			</c:if>
			<c:if test="${payment == 2}">
				銀行匯款<input type="radio" name="pay" value="2" checked><br>
			</c:if>
			<c:if test="${payment == 3}">
				面交付款<input type="radio" name="pay" value="1" checked><br>
				銀行匯款<input type="radio" name="pay" value="2"><br>
			</c:if>
			面交地點:
			<c:forEach var="place" items="${places}"  varStatus='i'>
				<c:if test="${i.index == 0}" var="flag">
					${place.address}|${place.time}<input type="radio" name="place" value="${place.id}"  checked><br>
				</c:if>
				<c:if test="${not flag}">
					${place.address}|${place.time}<input type="radio" name="place" value="${place.id}"><br>
				</c:if>
			</c:forEach>
			<input type="submit" value="送出" >
		</form>

	</div>
</body>
</html>