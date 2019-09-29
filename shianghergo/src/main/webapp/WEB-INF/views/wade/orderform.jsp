<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>填寫跟團資料</title>
</head>
<body style="background-color:#fffaf4;"> 
<jsp:include page="/WEB-INF/views/eric/header.jsp" ></jsp:include>

	<!-- 要給姓名 電話 付款方式 面交地點 -->
	<div style="width:700px;margin:50px auto;">
	<div style="text-align:center">
		<h2>輸入您的基本資料</h2>
	</div>
	<form action="orderform" method="post">
		<input type="hidden" name="oId" value="${order.id}">
		<div class="form-group">
			<label for="exampleFormControlInput1">請輸入姓名:</label>
			<input type="text" class="form-control" id="exampleFormControlInput1" name="name">
  	  	</div>
  	  	<div class="form-group">
			<label for="exampleFormControlInput1">請輸入聯繫電話：</label>
			<input type="text" class="form-control" id="exampleFormControlInput1" name="phone">
  	  	</div>
  		<div class="form-group">
		    <label for="exampleFormControlSelect1">選擇付款方式：</label>
		    <c:if test="${payment == 1}">
				<input type="radio" name="pay" value="1" checked>面交付款
			</c:if>
			<c:if test="${payment == 2}">
				<input type="radio" name="pay" value="2" checked>銀行匯款
			</c:if>
			<c:if test="${payment == 3}">
				<input type="radio" name="pay" value="1" checked>面交付款
				<input type="radio" name="pay" value="2">銀行匯款
			</c:if>
  		</div>
  		<div class="form-group">
    		<label for="exampleFormControlSelect2">選擇面交地點與時間：</label>
    		<select multiple class="form-control" id="exampleFormControlSelect2" name="place">
			      <c:forEach var="place" items="${places}"  varStatus='i'>
				      <option value="${place.id}">地址：${place.address}。<br>時間：${place.time}。</option>
			      </c:forEach>
    		</select>
  		</div>
  		<div style="text-align:center">
  			<button type="submit" class="btn btn-info">送出</button>
  			<button type="reset" class="btn btn-secondary">重置</button>
  		</div>
	</form>
	</div>
	
	<jsp:include page="/WEB-INF/views/eric/foot.jsp"></jsp:include>
</body>
</html>