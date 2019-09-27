<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
<head>
<meta charset="UTF-8">
<!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css">
<!-- 可选的 Bootstrap 主题文件（一般不用引入） -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap-theme.min.css">
<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"></script>


<body>


   
    <table class="table table-striped">
				<c:forEach var='GroupsG' items='${Groups}'>

					<thead>
						<tr>
							<th>揪團列表</th>
							<th>揪團開始時間</th>
							<th>揪團截止時間</th>
							<th>揪團商品說明</th>
						
						</tr>
					</thead>



					<td>${GroupsG.name}</td>
					<td>${GroupsG.start_time}</td>
					<td>${GroupsG.end_time}</td>
					<td>${GroupsG.detail}</td>
				
    
    </c:forEach>
</table>
</body>
</html>