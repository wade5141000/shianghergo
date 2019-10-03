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
	<jsp:include page="/WEB-INF/views/eric/header.jsp" />
	<div class="container">
		<div class="border border-success"
			style="padding-left: 300px; padding-right: 300px;">
			<form:form action="place" method="POST" modelAttribute="placeBean">
				<fieldset>
					<table style="font-size: :16px" class="table table-hover">
						<tr>
							<td align="center" colspan="2"><h1>新增地址</h1></td>
						</tr>
						<tr>
							<td><label for="address" class="item-label">地址:</label></td>
							<td><form:input type="text" id="address" name="address"
									path="address" /></td>
						</tr>
						<tr>
							<td><label for="time" class="item-label">時間:</label></td>
							<td><form:input type="text" id="time" name="time"
									path="time" /></td>
						</tr>

						<!-- 			<div class="item"> -->
						<!-- 				<label for="status" class="item-label">圖片上傳:</label> -->
						<%-- 				<form:input type="text" id="status" name="status" path="status" /> --%>
						<!-- 			</div> -->
					</table>
					<div>
						<input class="btn btn-primary" type="submit" value="新增地址">
						<input class="btn btn-primary" type="button"
							onclick="javascript:location.href='http://localhost:8080/shianghergo'"
							value="回到 首頁"></input>
					</div>
				</fieldset>
			</form:form>
		</div>
	</div>
</body>
</html>