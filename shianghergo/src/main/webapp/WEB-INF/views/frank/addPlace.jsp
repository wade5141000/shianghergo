<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>新增地址</title>
</head>
<body>

	<form:form action="place" method="POST" modelAttribute="placeBean" >
		<fieldset>
			<legend>新增地址</legend>
			<div class="item">
				<label for="address" class="item-label">地址:</label>
				<form:input type="text" id="address" name="address" path="address" />
			</div>
			<div class="item">
				<label for="time" class="item-label">時間:</label>
				<form:input type="text" id="time" name="time" path="time" />
			</div>
	
		
			<!-- 			<div class="item"> -->
			<!-- 				<label for="status" class="item-label">圖片上傳:</label> -->
			<%-- 				<form:input type="text" id="status" name="status" path="status" /> --%>
			<!-- 			</div> -->

			<input type="submit" value="新增地址">
			<input type ="button" onclick="javascript:location.href='http://localhost:8080/shianghergo'" value="回到 首頁"></input>
		</fieldset>
	</form:form>
	
</body>
</html>