<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<style>
body {
	margin: 0px;
	padding: 0px;
	background: #fff url('../images/bbg06.png') center center fixed ;　
}
</style>
<script>
// function getLatLong() {
// 	var apiKey = "AIzaSyDOg4gokNHM20oe8VUQN_O5HRQ9Nw6w3Yg";
// 	var api = "https://maps.googleapis.com/maps/api/geocode/json";
// 	var location = document.getElementById("address").value;
// 	alert("地址是: " + location);
	
// 	jQuery.get(api, {
// 		"key" : apiKey,
// 		"language" : "zh_tw",
// 		"address" : location
// 	}, getResult, "text");
// }
// function getResult(data) {
// 	// console.log(data);
// 	var info = JSON.parse(data);
// 	var location = document.getElementById("address").value;
// 	var lat = info.results[0].geometry.location.lat;
// 	var lng = info.results[0].geometry.location.lng;
	
// 	var t=setTimeout(function(){
// 		$.ajax({
// 			url:"http://localhost:8080/shianghergo/setLatLng?lat="+lat+"&lng="+lng+"&loca="+location,
// 			type:"get",
// 			success:function(data){
				
// 			},
// 		})
// 	},5000);
	
// 	alert("緯度" + lat + "\n" + "經度" + lng);
// }
</script>

<meta charset="UTF-8">
<title>新增地址</title>
</head>
<body>
<jsp:include page="/WEB-INF/views/eric/header.jsp" />

	<div class="container">
		<div class="border border-success"
			style="padding-left: 300px; padding-right: 300px;">
	<form:form action="addplace" method="POST" modelAttribute="placeBean">
		<fieldset>
<!-- 			<legend>新增地址</legend> -->
<%-- 			<input type="hidden" name="iid" value="${updategitem.id}" /> --%>
			<input type="hidden" name="gid" value="${gid}" />
			
		<table style="font-size: :16px" class="table table-hover">
		<tr>
		<td align="center" colspan="2"><h1>新增地址</h1></td>
		</tr>
		<tr>
		<td><label for="address" class="item-label">地址:</label></td>
		<td><form:input type="text" id="address" name="address" path="address" /></td>
			</tr>
			<tr>
			<td><label for="time" class="item-label">時間:</label></td>
			<td><form:input type="text" id="time" name="time" path="time" /></td>
			</tr>

			<!-- 			<div class="item"> -->
			<!-- 				<label for="status" class="item-label">圖片上傳:</label> -->
			<%-- 				<form:input type="text" id="status" name="status" path="status" /> --%>
			<!-- 			</div> -->

		</table>
		<div style="padding-left: 150px;padding-top: 10px;">
			<input type="submit" value="新增地址" class="btn btn-primary">
			<a class="btn btn-primary"	href="javascript:history.go(-1)">取消 </a>
			</div>
		</fieldset>
	</form:form>
	</div>
	</div>
<script src="//cdn.bootcss.com/canvas-nest.js/1.0.1/canvas-nest.min.js"></script>
</body>
</html>