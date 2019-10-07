<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<script src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
<meta charset="UTF-8">
<style>
#regForm {
	
}

.h1 {
	text-align: center;
}

.divform {
	margin: 0 auto;
	padding-left: 810px;
	/* text-align:center; */

	/* background-image:url('images/group.jpg'); */
}

body {
	/* 　background-image:url( ' ../images/group.jpg ' ); */
	
}
</style>
<script>
	$(document).ready(function() {
		$("#num").hide();

		$("#bank").click(function() {
			$("#num").toggle();
		});

	});
</script>
<title>開團流程</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/eric/header.jsp"></jsp:include>
	

	<div class="progress"
		style="height: 30px; color: black; font-size: 20px;">
		<div class="progress-bar bg-success" role="progressbar"
			style="width: 50%" aria-valuenow="33" aria-valuemin="0"
			aria-valuemax="100">第一步</div>
<!-- 			<div class="progress-bar bg-success" role="progressbar" -->
<!-- 			style="width: 100%;background-color:pink;" aria-valuenow="33" aria-valuemin="0" -->
<!-- 			aria-valuemax="100">第二步</div> -->
	</div>
	
	
	<br> 
	<H2 class="h1">填寫開團詳細訊息!!</H2>
	<br>
	<!-- <img src="../images/group.jpg" > -->
	<div class="container">
		<div class="border border-success"
			style="padding-left: 300px; padding-right: 300px;">
			<form:form action="Groups1" method="POST" id="regForm"
				modelAttribute="groupsBean" enctype="multipart/form-data">
				<input type="hidden" name="start_time" value="${now}" />
				<input type="hidden" id="status" name="status" path="status"
					value="1" />
				<table style="font-size: :16px" class="table table-hover">
					<tr>
						<td><label for="name" class="item-label">標題:</label></td>
						<td><form:input type="text" id="name" name="name" path="name" /></td>
						<!-- 			<div class="item" style="display:block; margin:auto;"> -->
						<!-- 			</div> -->
					</tr>
					<!-- 				<label for="start_time" class="item-label">開始時間:</label> -->
					<%-- 				<form:input type="text" id="start_time" name="start_time" path="start_time"  />  --%>

					<!-- 			<div class="item"> -->
					<!-- 			</div> -->
					<tr>
						<td><label for="end_time" class="item-label">截止時間:</label></td>
						<td><form:input type="date" id="end_time" name="end_time"
								path="end_time" /></td>
					</tr>
					<tr>
						<td><label for="categoryBean" class="item-label">分類:</label></td>
						<td><div class='col-lg-10'>
								<form:select path="categoryBean" name="categoryBean">
									<c:forEach var="categorys" items="${category}">
										<option value="${categorys.id}">${categorys.name}</option>

									</c:forEach>
								</form:select>
							</div></td>
					</tr>
					<tr>
						<td><label for="detail" class="item-label">商品說明:</label></td>
						<td><form:textarea style="width:300px;height:300px"
								id="detail" name="detail" path="detail" /></td>
					</tr>
					<tr>
						<td><label for="payment" class="item-label">付款方式:</label><br></td>
						<td><input type="checkbox" name="payment" value="1">面交付款<br>
							<input type="checkbox" name="payment" value="2" id="bank">銀行匯款<br>
							<div id="num">
								<label>銀行卡號</label> 
								<form:input type="text" name="banknumber" id="banknumber" path="banknumber" />
							</div></td>

						<%-- 				<form:input type="text" id="payment" name="payment" path="payment" /> --%>
					</tr>
					<tr>
						<td><label for="productImage" class="item-label">上傳圖片:</label></td>
						<td><form:input type="file" id="productImage"
								name="productImage" path="productImage" required="required" /></td>
					</tr>
				</table>
				<div style="padding-left: 150px; padding-top: 10px;">
					<input type="submit" value="下一步" id="regForm"
						class="btn btn-primary" />
				</div>
				<!-- 			<div class="item"> -->
				<!-- 				<label for="image" class="item-label">上傳圖片:</label>  -->
				<%-- 				<form:input type="file" id="image" name="filename" path="" class="item-file" --%>
				<%-- 					placeholder="" autocomplete="off" tip=""/> --%>
				<!-- 			</div> -->

			</form:form>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/eric/foot.jsp"></jsp:include>
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