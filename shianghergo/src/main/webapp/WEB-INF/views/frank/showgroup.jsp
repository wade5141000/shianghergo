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
.gd1 {
	/*  border-radius: 20PX; */
	background-color: yellow;
	float: left;
	padding:20px;
	margin:20px;
/*  	display: inline-block;  */
/* 	width: 250px; */
/* 	height: 200px; */
}
.gd2{
float: left;
}
</style>

</head>
<body>
<body>

	<!-- action对应一个action标签，id对应提交时的对应关系 -->
	
		<input type="hidden" name="id" value="${updategroup.id}" />
		<h2>團資訊</h2>
		<table style="font-size: :16px">
			<tr>
				<td>標題：</td>
				<td>${updategroup.name }</td>
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
				<td>${updategroup.end_time }</td>
			</tr>
			<tr>
				<td>分類：</td>
				<td>${updategroup.categoryBean.name }</td>
			</tr>
			
			
			<tr>
				<td>說明：</td>
				<td>${updategroup.detail }</td>
			</tr>
			<tr>
				<td>付款方式：</td>
				<td>${updategroup.payment }</td>
			</tr>

			<tr>

				<td><a href="updatetogroup?gid=${updategroup.id}">修改 </a></td>
			</tr>

		</table>

	<div>
		<div class="gd2">
			<a href="addplace?gid=${updategroup.id}">新增地址</a>
			<a href="additem?gid=${updategroup.id}">新增商品</a>
			<a href="<c:url value='mygroups'/> ">完成 </a>
			</div>
			<c:forEach var="item" items="${updategroup.groupsitem}">
				<div class="gd1" style="width: 300px; height: 250px;">
				<div>
				<img width='100' height='100' src="<c:url value='/frank/getPicture/${item.id }' />"/>
					</div>
					<p>地址:${item.name}</p>
					<p>說明:${item.detail}</p>
					<p>價格:${item.price}</p>
					
					
					<a href="updatetogroup_item?gid=${updategroup.id}&iid=${item.id}">修改</a>
					<a href="deletetogroup_item?gid=${updategroup.id}&iid=${item.id}">刪除</a>
				</div>
			</c:forEach>
		</div>

		<div>
			<c:forEach var="places" items="${updategroup.place}">
				<div class="gd2" style="width: 250px; height: 200px;">
					<p>地址:${places.address}</p>
					<p>時間:${places.time}</p>
					<a href="updatetoplace?gid=${updategroup.id}&pid=${places.id}">修改</a>
					<a href="deletetoplace?gid=${updategroup.id}&pid=${places.id}">刪除</a>
				</div>
			</c:forEach>
		
	</div>
	
</body>
</html>