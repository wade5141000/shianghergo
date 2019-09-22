<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css">
</head>
<style>
.nav {
	height: 600px;
	width: 300px;
	margin-top: 0px;
	position: fixed;
}

.u {
	margin-top: 300px;
	margin-right: 50px;
}

.li {
	font-size: 40px;
}
</style>

<body>
	

			<form action="SaveRM" method="POST">

				<select name="category">
					<c:forEach var='items' items='${list}'>
						<option value="${items.id}">${items.name}</option>
					</c:forEach>
				</select>

				<p>檢舉內容</p>
				<textarea name="contents" rows="5" cols="45"></textarea>
				<hr>
				<input type=hidden value="${target}" name="target"> <input
					type="submit" value="確定檢舉"> <input type="reset" value="清除">

			</form>
	
</body>
</html>