<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<link rel="icon" href="images/logo4.ico"/>
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

				<h2>我的開團列表</h2>

			</div>

		</div>

	</section>


	<table>
		<tr>
			<td>團ID</td>
			<!-- 			<td>商品說明</td> -->
			<td>團名</td>
			<td>付款方式</td>
			<td>處理方式</td>

		</tr>


		<c:forEach var="mygroups" items="${mygroups}">
			<tr>
				<td>${mygroups.id}</td>
				<td>${mygroups.name}</td>
				<td>${mygroups.payment}</td>
				<td><a href="showgroup?gid=${mygroups.id}">修改</a></td>
				 
				 
			</tr>
		</c:forEach>

	</table>


</body>
</html>