<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.gd2 {
	margin: 0 auto;
	padding-left: 810px;
}

/* .gd33 { */
/* 	margin: 0 auto; */
/* 	float: left; */
/* } */

.f3 {
	text-align: center;
}

.f4 {
	margin: 0 auto;
	boder: 10px;
}

table {
	table-layout: auto;
	font-size: 20px;
	width: 800px;
}

.td1 {
	width: 150px;
}
body {
	margin: 0px;
	padding: 0px;
	background: #fff url('../images/bbg06.png') center center fixed ;　
}
</style>

</head>
<body>
<body>


	<!-- action对应一个action标签，id对应提交时的对应关系 -->
	<jsp:include page="/WEB-INF/views/eric/header.jsp"></jsp:include>
	<input type="hidden" name="id" value="${updategroup.id}" />


	<div class="progress"
		style="height: 30px; font-size: 20px; color: black; font-size: 20px;">
		<div class="progress-bar bg-success" role="progressbar"
			style="width: 100%" aria-valuenow="100" aria-valuemin="0"
			aria-valuemax="100">第二步</div>
	</div>
	<br>
	<H1 class="f3">新增商品與地址</H1>
	<br>

	<div>
		<div>
			<img width='600px' height='450' style="display: block; margin: auto;"
				src="<c:url value='/frank/getgroupPicture/${updategroup.id }' />" />
		</div>
		<div>
			<table style="font-size: :50px; word-break: break-all;" class="f4">
				<tr>
					<td>標題：</td>
					<td>${updategroup.name }</td>
					<%-- 			<td id="name">${updategroup.name}</td> --%>
					<%-- 			<td id="btn"><button id="n_u_btn" onclick="chan(this,${updategroup.id})">修改</button></td> --%>
				</tr>
				<tr>
					<td class="td1">開始時間：</td>
					<td>${updategroup.start_time }</td>
				</tr>
				<tr>
				<tr>
					<td class="td1">結束時間：</td>
					<td>${updategroup.end_time }</td>
				</tr>
				<tr>
					<td class="td1">分類：</td>
					<td>${updategroup.categoryBean.name }</td>
				</tr>


				<tr>
					<td class="td1">說明：</td>
					<td style="word-break: break-all;">${updategroup.detail }</td>
				</tr>
				<tr>
					<td class="td1">付款方式：</td>

					<c:if test="${updategroup.payment ==1}">
						<td>面交付款</td>
					</c:if>
					<c:if test="${updategroup.payment ==2}">
						<td>銀行匯款</td>
					</c:if>
					<c:if test="${updategroup.payment ==3}">
						<td>面交付款、銀行匯款</td>
					</c:if>


				</tr>


				<tr>

					<td></td>
					<td><input type="button" value="修改"
						onclick="location.href='updatetogroup?gid=${updategroup.id}'"
						class="btn btn-info"></td>
				</tr>

			</table>
		</div>
	</div>
	<div>


		<div class="gd2">
			<input type="button" value="新增地址"
				onclick="location.href='addplace?gid=${updategroup.id}'"
				class="btn btn-success"> <input type="button" value="新增商品"
				onclick="location.href='additem?gid=${updategroup.id}'"
				class="btn btn-success"> <input type="button" value="完成"
				onclick="location.href='group?gid=${updategroup.id }'"
				class="btn btn-success">


		</div>
		<hr>
	</div>



	<section class="container">
		<!-- 		<div class="row"> -->
		<%-- 			<c:forEach var="item" items="${updategroup.groupsitem}"> --%>
		<!-- 				<div class="col-sm-6 col-md-3" -->
		<!-- 					style="width: 360px; height: 450px; font-size: 16px;"> -->
		<!-- 					<div class="thumbnail" style="width: 320px; height: 400px"> -->
		<!-- 						<img width='500' height='300' -->
		<%-- 							src="<c:url value='/frank/getPicture/${item.id }' />" /> --%>
		<!-- 						<div class="caption"> -->
		<!-- 							<p> -->
		<%-- 								<b style='font-size: 16px;'>${item.name}</b> --%>
		<!-- 							</p> -->
		<%-- 							<p>說明:${item.detail}</p> --%>
		<%-- 							<p>價格: ${item.price} 元</p> --%>

		<div
			style="margin: 0 auto; background-color: #FFE8BF; text-align: center;">
			<h2>商品</h2>
		</div>


		<div class="f2" style="width: 1000px;">
			<c:forEach var="item" items="${updategroup.groupsitem}">

				<div class="card"
					style="width: 210px; display: inline-block; margin: 0 20px;">
					<img width='200' height='150'
						src="<c:url value='/frank/getPicture/${item.id }' />"
						class="card-img-top" alt="...">
					<div class="card-body">
						<h5 class="card-title">${item.name}</h5>

						<p class="card-text">商品說明:${item.detail}</p>
						<p class="card-text">商品價格:${item.price}</p>

						<p>
							<input type="button" value="修改"
								onclick="location.href='updatetogroup_item?gid=${updategroup.id}&iid=${item.id}'"
								class="btn btn-info" style="width: 80px; height: 30px;">
							<input type="button" value="刪除"
								onclick="location.href='deletetogroup_item?gid=${updategroup.id}&iid=${item.id}'"
								class="btn btn-danger" style="width: 80px; height: 30px;">

						</p>

					</div>
				</div>
			</c:forEach>
		</div>
	</section>




	<hr>

	<div
		style="width:1100px;margin: 0 auto; background-color: #FFE8BF; text-align: center;">
		<h2>面交地點</h2>
	</div>
	<section class="container">
		<div>
			<c:forEach var="places" items="${updategroup.place}">
				<div class="gd33" style="width: 250px; height: 200px; font-size: 16px;float: left;">
					<p>地址:${places.address}</p>
					<p>時間:${places.time}</p>
					<input type="button" value="修改"
						onclick="location.href='updatetoplace?gid=${updategroup.id}&pid=${places.id}'"
						class="btn btn-info" style="width: 80px; height: 30px;"> <input
						type="button" value="刪除"
						onclick="location.href='deletetoplace?gid=${updategroup.id}&pid=${places.id}'"
						class="btn btn-danger" style="width: 80px; height: 30px;">


				</div>

			</c:forEach>

		</div>
	</section>
	<br>
	<br>
	<br>
	<br>
	<br>
</body>
<jsp:include page="/WEB-INF/views/eric/foot.jsp"></jsp:include>
<script src="//cdn.bootcss.com/canvas-nest.js/1.0.1/canvas-nest.min.js"></script>

</html>