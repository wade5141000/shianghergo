<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div style="text-align: center">
		<h1>請依照團ID來選擇</h1>
		<c:forEach var="groups_id" items="${groups_idList}">
		<a href="items/{groups_id}">${groups_id}</a><br>
		</c:forEach>
	</div>
</body>
</html>