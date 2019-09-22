<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>新增商品</title>
</head>
<body>

	<form:form action="item" method="POST" modelAttribute="groupsitemBean" >
		<fieldset>
			<legend>商品上架</legend>
			<div class="item">
				<label for="name" class="item-label">標題:</label>
				<form:input type="text" id="name" name="name" path="name" />
			</div>
			<div class="item">
				<label for="detail" class="item-label">商品說明:</label>
				<form:input type="text" id="detail" name="detail" path="detail" />
			</div>
			<div class="item">
				<label for="price" class="item-label">價格:</label>
				<form:input type="text" id="price" name="price" path="price" />
			</div>
		
			<!-- 			<div class="item"> -->
			<!-- 				<label for="status" class="item-label">圖片上傳:</label> -->
			<%-- 				<form:input type="text" id="status" name="status" path="status" /> --%>
			<!-- 			</div> -->

			<input type="submit" value="新增商品">
			<div class="container">
           <p><a href="<spring:url value='/place' />" >新增地址</a></p>
       
      </div>
			

<!-- 			<input type ="button" onclick="javascript:location.href='http://localhost:8080/shianghergo'" value="回到 首頁"></input> -->
			
		</fieldset>
	</form:form>
	
</body>
</html>