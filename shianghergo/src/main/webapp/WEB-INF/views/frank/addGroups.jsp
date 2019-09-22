<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>開團流程</title>
</head>
<body>

	<H1>開團瞜 !!</H1>
	<HR>
	<form:form action="Groups1" method="POST" id="regForm"
		modelAttribute="groupsBean">
		<fieldset>
			<legend>開團</legend>
			<div class="item">
				<label for="name" class="item-label">標題:</label>
				<form:input type="text" id="name" name="name" path="name" />
			</div>
			<div class="item">
<!-- 				<label for="start_time" class="item-label">開始時間:</label> -->
<%-- 				<form:input type="text" id="start_time" name="start_time" path="start_time"  />  --%>
				<input type="hidden" name="start_time" value="${now}" />
			</div>
			<div class="item">
				<label for="end_time" class="item-label">截止時間:</label>
				<form:input type="date" id="end_time" name="end_time"
					path="end_time" />


			</div>
			<div class="item">
				<label for="status" class="item-label">狀態:</label>
				<form:input type="text" id="status" name="status" path="status" />
			</div>
			<div class="item">
				<label for="detail" class="item-label">商品說明:</label>
				<form:textarea style="width:300px;height:300px" id="detail"
					name="detail" path="detail" />
			</div>
			<div class="item">
				<label for="payment" class="item-label">付款方式:</label>
				<form:input type="text" id="payment" name="payment" path="payment" />
			</div>
		

			<input type="submit" value="下一步" id="regForm">
		</fieldset>
		<!-- 			<div class="item"> -->
		<!-- 				<label for="image" class="item-label">上傳圖片:</label>  -->
		<%-- 				<form:input type="file" id="image" name="filename" path="" class="item-file" --%>
		<%-- 					placeholder="" autocomplete="off" tip=""/> --%>
		<!-- 			</div> -->

	</form:form>
	<%-- 	<form:form> --%>
	<!-- 		<fieldset action="place" method="POST" id="regForm"	modelAttribute="placeBean"> -->
	<%-- 		<c:forEach var="groups_idLists" items="${groups_idList}"> --%>
	<!-- 			<legend>面交地址</legend> -->
	<!-- 			<div class="item"> -->
	<!-- 				<label for="name" class="item-label">地址:</label> -->
	<%-- 				<form:input type="text" id="name" name="name" path="name" /> --%>
	<!-- 			</div> -->
	<!-- 		</fieldset> -->
	<%-- 	</form:form> --%>

</body>

</html>