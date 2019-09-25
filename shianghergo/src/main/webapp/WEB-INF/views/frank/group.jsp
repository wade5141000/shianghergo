<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>group</title>
<style>
.gd1 {
	background-color: yellow;
	display: inline-block;
}
</style>

</head>
<body>
	<section>
		<div>
			<div>

				<h2>團資料</h2>

			</div>

		</div>

	</section>

	<section>
		<!-- 	<div> -->

		<%-- 	<img width="100" heigth="150" src="<c:url value='/Picture/${group.groupId}'/>"/> --%>
		<!-- 	</div> -->

		<div>
			<h2>${group.name}</h2>
			<p>商品說明:${group.detail}</p>
			<p>付款方式:${group.payment}</p>
			<p>截止時間:${group.end_time}</p>


			<P><a href="<spring:url value='memberdata?mmid=${member_id.id}' />" >團主:${member_id.name} </a></P>

			<div>
				<c:forEach var="places" items="${place}">
					<div class="gd1" style="width: 250px;height:200px;">
						<p>地址:${places.address}</p>
						<p>時間:${places.time}</p>

					</div>
				</c:forEach>
			</div><br><br><br>
			<div style="height:180px;" >
				<c:forEach var="item" items="${groups_id}">
					<div class="gd1" style="width: 250px;height:250px;">
					<div>
				<img width='100' height='100' src="<c:url value='/frank/getPicture/${item.id }' />"/>
					</div>
						<p>商品名稱:${item.name}</p>
						<p>商品說明:${item.detail}</p>
						<p>商品價格:${item.price}</p>
					</div>
				</c:forEach>
			</div>
		</div>

	</section>

</body>
</html>