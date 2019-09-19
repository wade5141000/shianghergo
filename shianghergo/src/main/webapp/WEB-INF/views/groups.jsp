<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<script src="http://code.jquery.com/jquery-1.12.4.min.js" ></script>
<meta charset="UTF-8">
<title>groups</title>
</head>
<body>
<h3><a href="groupcart">跟團購物車</a></h3>
<c:forEach var="group" items="${groups}">
<div style="border:1px solid;margin:5px;padding:3px;">

<h3>${group.name}(<c:if test="${group.status == 1}" var="flag">
				<td>揪團中</td></c:if><c:if test="${not flag}"><td>已結束</td></c:if>)</h3>
<h4><a href="group/${group.id}">看詳情</a></h4>

</div>
</c:forEach>
</body>
</html>