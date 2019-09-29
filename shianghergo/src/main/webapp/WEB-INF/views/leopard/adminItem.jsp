<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!doctype html>
<html>
<head>
<meta charset="UTF-8">
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
	integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS"
	crossorigin="anonymous">

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"
	integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"
	integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k"
	crossorigin="anonymous"></script>
<script>
	function delete777() {
		var r = confirm("是否要下架")
		if (r == true) {
			alert('下架成功');
		} else {
			alert('下架取消');
		}
	}
</script>
</head>
<style>
* {
	font-family: 微軟正黑體;
}
</style>

<body>


	<nav class="navbar navbar-expand-lg navbar-light bg-light"
		style="height: 100px;">
		<a class="navbar-brand" href="#">管理員</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarNav" aria-controls="navbarNav"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarNav">
			<ul class="navbar-nav">
				<li class="nav-item "><a class="nav-link"
					href="member.do">會員管理 <span class="sr-only">(current)</span></a></li>
				<li class="nav-item "><a class="nav-link" href="store.do">商店管理</a>
				</li>
				<li class="nav-item active"><a class="nav-link" href="showItem">商品管理</a>
				</li>
				<li class="nav-item"><a class="nav-link" href="showGroups_item">團購商品管理</a>
				</li>
				<li class="nav-item"><a class="nav-link" href="showVM.do">違規處理-會員</a>
				</li>
				
				<li class="nav-item"><a class="nav-link" href="showVS.do">違規處理-商家</a>
				</li>
				<li class="nav-item" style="margin-left: 800px"><a
					class="nav-link" href="login">切換管理員</a></li>

			</ul>
		</div>
	</nav>

	<form class="form-inline" style="margin-left: 700px; margin-top: 20px;">
		<input class="form-control mr-sm-2" type="search" placeholder="Search"
			aria-label="Search">
		<button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
	</form>

	<table class="table"
		style="width: 1400px; margin-left: 150px; margin-top: 50px;">
		<thead class="thead-dark">
			<tr>
				<th scope="col">#</th>
				<th scope="col">商品ID</th>
				<th scope="col">商品名稱</th>
				<th scope="col">商品介紹</th>
				<th scope="col">價格</th>
				<th scope="col">商品數量</th>
				<th scope="col"></th>
				<th scope="col"></th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var='items' items='${item}'>
				<tr>
				<td>O</td>
				<td>${items.id}</td>
				<td>${items.name}</td>
				<td>${items.detail}</td>
				<td>${items.price}</td>
				<td>${items.reserve}</td>

				<td>
					<form action="deletel" method="POST">
						<input type=hidden value="${items.id}" name="id">
						<button type="submit" class="btn btn-info" onclick="delete777()">下架</button>
					</form>

				</td>
			
			</c:forEach>
	</table>

</body>
</html>