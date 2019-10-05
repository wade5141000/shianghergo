<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>團資料更新</title>
<script src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
<script>
	// var val;
	// var nVal;
	// var gid;
	// function chan(it,ggid){
	// 	gid = ggid;
	// 	if((it.id)=="n_u_btn"){
	// 		val = $("#name").text();
	// 		$("#name").html("<input id='inname' type='text' value='"+val+"'></input>");
	// 		$(it).remove();
	// 		$("#btn").html("<button onclick='comm()'>確認</button> <button onclick='nono()'>取消</button>");
	// 	}
	// }

	// function comm(){
	// 	 nVal = $("#inname").val();
	// 	 $.ajax({
	// 	 	url: "updatename?name="+nVal+"&id="+gid,
	// 		type:"GET",
	// 		success:function(data){
	// 			$("#name").text(data);
	// 			$("#btn").html('<button onclick="chan(this)">修改</button>');
	// 		}
	// 	})

	// }

	// function nono(){
	// 	$("#name").text(val);
	// 	$("#btn").html('<button id="n_u_btn" onclick="chan(this)">修改</button>');
	// }

	$(document).ready(function() {
		$("#num1").hide();

		$("#bank1").click(function() {
			$("#num1").toggle();
		});

		$("#bank2").click(function() {
			$("#num2").toggle();
		});
	
		$("#bank3").click(function() {
			$("#num3").toggle();
		});
	});
</script>

</head>
<body>
	<jsp:include page="/WEB-INF/views/eric/header.jsp" />

	<h3>團資料編輯</h3>

	<div class="container">
		<!-- action对应一个action标签，id对应提交时的对应关系 -->
		<div class="border border-success"
			style="padding-left: 300px; padding-right: 300px;">
			<form:form id="saveForm" action="updatetogroup" method="post"
				enctype="multipart/form-data" modelAttribute="upgroupsBean">
				<input type="hidden" name="id" value="${updategroup.id}" />

				<h2>團資訊</h2>
				<img width='275' height='250'
					src="<c:url value='/frank/getgroupPicture/${updategroup.id }' />">
				<table style="font-size: :16px">

					<tr>
						<td>標題：</td>
						<td><input type="text" value="${updategroup.name }"
							name="name" /></td>

					</tr>
					<tr>
						<td>開始時間：</td>
						<td>${updategroup.start_time }</td>
					</tr>
					<tr>
					<tr>
						<td>結束時間：</td>
						<td><input type="date" value="${updategroup.end_time }"
							name="end_time" /></td>
					</tr>

					<tr>
						<td>分類:</td>
						<td><select name="categoryBean">
								<c:forEach var="categorys" items="${category}">

									<option value="${categorys.id}">${categorys.name}</option>
								</c:forEach>
						</select></td>
					</tr>

					<tr>
						<td>說明：</td>
						<td><textarea name="detail">${updategroup.detail }</textarea></td>
					</tr>
					<tr>
						<td>付款方式：</td>

						<td>
						<c:if test="${updategroup.payment == 1}">
							<input type="checkbox" name="payment" value="1" checked>面交付款
				 			<input type="checkbox" name="payment" value="2" id="bank1">銀行匯款<br>
						<div id="num1">
										<label>銀行卡號</label>
										<form:input type="text" name="banknumber" id="banknumber"
										path="banknumber" value="${updategroup.banknumber}" />
									</div>
						</c:if> 
							<c:if test="${updategroup.payment == 2}">
								<input type="checkbox" name="payment" value="1">面交付款
				 				<input type="checkbox" name="payment" value="2" checked id="bank2">銀行匯款<br>
								<div id="num2">
										<label>銀行卡號</label>
										<form:input type="text" name="banknumber" id="banknumber"
										path="banknumber" value="${updategroup.banknumber}" />
									</div>	
							</c:if> 
							<c:if test="${updategroup.payment == 3}">
								<input type="checkbox" name="payment" value="1" checked>面交付款
				 				<input type="checkbox" name="payment" value="2" checked id="bank3">銀行匯款<br>
							<div id="num3">
										<label>銀行卡號</label>
										<form:input type="text" name="banknumber" id="banknumber"
										path="banknumber" value="${updategroup.banknumber}" />
									</div>
							</c:if>
							
							</td>
					</tr>

					<tr>
						<td>圖片:</td>
						<td><input type="file" id="productImage" name="productImage" /></td>

					</tr>

				</table>

				<div style="padding-left: 150px; padding-top: 10px;">
					<input class="btn btn-primary" type="submit" value="更新" /> <a
						class="btn btn-primary" href="javascript:history.go(-1)">取消 </a>
				</div>

			</form:form>
		</div>
	</div>
	<%-- 	<c:forEach var="place" items="${updategroup.place}"> --%>
	<!-- 			<tr> -->
	<!-- 			<td>地址:</td> -->
	<%-- 			<td><input type="text" value="${place.address}" id="address"+"${place.id}"  /></td> --%>
	<!-- 			<td><a href="aaa?"></a><input type="button" value="修改" /></td> -->

	<!-- 			</tr> -->
	<%-- 		</c:forEach> --%>


	<!-- 	<tr> -->

	<!--                 <td align="right"><a -->
	<!--                     href="javascript:document.getElementById('saveForm').submit()">保存</a> -->
	<!--                     &nbsp;&nbsp; <a href="javascript:history.go(-1)">退回 </a></td> -->
	<!--      </tr> -->

	<jsp:include page="/WEB-INF/views/eric/foot.jsp" />
</body>
</html>
