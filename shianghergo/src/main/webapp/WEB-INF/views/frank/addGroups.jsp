<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<!-- <link rel="stylesheet" -->
<!-- 	href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" -->
<!-- 	integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" -->
<!-- 	crossorigin="anonymous"> -->
<!-- <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" -->
<!-- 	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" -->
<!-- 	crossorigin="anonymous"></script> -->
<!-- <script -->
<!-- 	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js" -->
<!-- 	integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut" -->
<!-- 	crossorigin="anonymous"></script> -->
<!-- <script -->
<!-- 	src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js" -->
<!-- 	integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k" -->
<!-- 	crossorigin="anonymous"></script> -->

<meta charset="UTF-8">

<style>

#regForm{

}

.h1{
text-align:center;
}

.divform{
 margin: 0 auto; 
  padding-left:810px;  
/* text-align:center; */

/* background-image:url('images/group.jpg'); */

}


body{
/* 　background-image:url( ' ../images/group.jpg ' ); */
}
</style>

<title>開團流程</title>
</head>
<body >
<jsp:include page="/WEB-INF/views/eric/header.jsp" ></jsp:include>
	<H2 class="h1">填寫開團詳細訊息!!</H2>
	

	


	<div class="progress" style="height:30px;color:black;font-size:20px;">
		<div class="progress-bar bg-success" role="progressbar"
			style="width: 33%" aria-valuenow="33" aria-valuemin="0" 
			aria-valuemax="100">第一步</div>
	</div>
	<br>
	<br>
<!-- <img src="../images/group.jpg" > -->
<div class="divform" >
	<form:form action="Groups1" method="POST" id="regForm"
		modelAttribute="groupsBean" enctype="multipart/form-data" >
		<fieldset>
			
			<div class="item" style="display:block; margin:auto;">
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
			<div class="form-group">
				<label for="categoryBean" class="item-label">分類:</label>
				<div class='col-lg-10'>
					<form:select path="categoryBean" name="categoryBean">
						<c:forEach var="categorys" items="${category}">
							<option value="${categorys.id}">${categorys.name}</option>

						</c:forEach>
					</form:select>
				</div>
			</div>

			<div class="item">

				<input type="hidden" id="status" name="status" path="status"
					value="1" />
			</div>


			<div class="item">
				<label for="detail" class="item-label">商品說明:</label>
				<form:textarea style="width:300px;height:300px" id="detail"
					name="detail" path="detail" />
			</div>
			<div class="item">
				<label for="payment" class="item-label">付款方式:</label><br>
				<%-- 				<form:input type="text" id="payment" name="payment" path="payment" /> --%>

				<input type="checkbox" name="payment" value="1">面交付款<br>
				<input type="checkbox" name="payment" value="2">銀行匯款<br>


			</div>
			<div class="item">
				<label for="productImage" class="item-label">上傳圖片:</label>
				<form:input type="file" id="productImage" name="productImage"
					path="productImage" required="required" />
			</div>


			<input type="submit" value="下一步" id="regForm">
			<br>
		</fieldset>
		<!-- 			<div class="item"> -->
		<!-- 				<label for="image" class="item-label">上傳圖片:</label>  -->
		<%-- 				<form:input type="file" id="image" name="filename" path="" class="item-file" --%>
		<%-- 					placeholder="" autocomplete="off" tip=""/> --%>
		<!-- 			</div> -->

	</form:form>
	
	</div>
	<br><br><br><br>
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