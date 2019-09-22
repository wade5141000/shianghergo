<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
</script>

</head>
<body>

	<h3>團資料編輯</h3>

	<br />
	<br />
	<!-- action对应一个action标签，id对应提交时的对应关系 -->
	<form id="saveForm" action="updatetogroup" method="post">
		<input type="hidden" name="id" value="${updategroup.id}" />
		<h2>團資訊</h2>
		<table style="font-size: :16px">
			<tr>
				<td>標題：</td>
				<td><input type="text" value="${updategroup.name }" name="name" /></td>
				<%-- 			<td id="name">${updategroup.name}</td> --%>
				<%-- 			<td id="btn"><button id="n_u_btn" onclick="chan(this,${updategroup.id})">修改</button></td> --%>
			</tr>
			<tr>
				<td>開始時間：</td>
				<td>${updategroup.start_time }</td>
			</tr>
			<tr>
			<tr>
				<td>結束時間：</td>
				<td><input type="text" value="${updategroup.end_time }"
					name="end_time" /></td>
			</tr>
			<tr>
				<td>說明：</td>
				<td><textarea  name="detail">${updategroup.detail }</textarea></td>
			</tr>
			<tr>
				<td>付款方式：</td>
				<td><input type="text" value="${updategroup.payment }"
					name="payment" /></td>
			</tr>

<!-- 		</table> -->
<!-- 		<table> -->

			<!-- 		<h2>商品資訊</h2> -->
			<!-- 		<table style="font-size: :16px"> -->
			<!-- 			<tr> -->
			<!-- 				<td>商品名稱：</td> -->
			<%-- 				<td><input type="text" value="${updategroup.groupsitem.name }" name="name" /></td> --%>
			<!-- 			</tr> -->
			<!-- 			<tr> -->
			<!-- 				<td>商品說明：</td> -->
			<%-- 				<td><input type="text" value="${updategroup.groupsitem.detail }"name="detail" /></td> --%>
			<!-- 			</tr> -->
			<!-- 			<tr> -->
			<!-- 			<tr> -->
			<!-- 				<td>價格：</td> -->
			<%-- 				<td><input type="text" value="${updategroup.groupsitem.price }"	name="price" /></td> --%>
			<!-- 			</tr> -->

			<tr>

				<td align="right"><input type="submit" value="更新" /> <a
					href="javascript:history.go(-1)">取消 </a>
			</tr>
		
	</form>
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


</body>
</html>
