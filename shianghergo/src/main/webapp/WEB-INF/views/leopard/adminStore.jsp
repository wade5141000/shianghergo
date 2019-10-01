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
	function Notification() {
		var r = confirm("是否要警告")
		if (r == true) {
			alert('警告成功');
		} else {
			alert('警告取消');
		}
	}

	function stop() {
		var r = confirm("是否要停權")
		if (r == true) {
			alert('停權成功');
		} else {
			alert('停權取消');
		}
	}

	function recovery() {
		var r = confirm("是否恢復權限")
		if (r == true) {
			alert('恢復權限成功');
		} else {
			alert('恢復權限取消');
		}
	}
</script>


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
				<li class="nav-item"><a class="nav-link" href="member.do">會員管理
						<span class="sr-only">(current)</span>
				</a></li>
				<li class="nav-item active"><a class="nav-link" href="store.do">商店管理</a>
				</li>
				<li class="nav-item"><a class="nav-link" href="showItem">商品管理</a>
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
	
	<table class="table"
		style="width: 1400px; margin-left: 150px; margin-top: 50px;">
		<thead class="thead-dark">
			<tr style="padding: 50px">
				<th scope="col">#</th>
				<th scope="col">商店ID</th>
				<th scope="col">會員ID</th>
				<th scope="col">商店名稱</th>
				<th scope="col">商店狀態</th>
				<th scope="col"></th>
				<th scope="col"></th>
				<th scope="col"></th>
				<th scope="col"></th>
				<th scope="col"></th>
				<th scope="col"></th>
			
				
			</tr>
		</thead>
		<tbody>
			<c:forEach var='Stores' items='${Store}'>
				<tr>
					<th scope="row">O</th>
					<td>${Stores.id}</td>
					<td>${Stores.member_id}</td>
					<td>${Stores.name}</td>
					<td>${Stores.status}</td>
					<td></td>
					<td></td>
					<td></td>

					<td>
						<form action="NotificationStore" method="POST">
							<input type=hidden value="${Stores.id}" name="target">
							<button type="submit" class="btn btn-warning"
								onclick="Notification()">警告</button>
						</form>
					</td>
					<td>
						<form action="stopStore" method="POST">
							<input type=hidden value="${Stores.id}" name="target">
							<button type="submit" class="btn btn-danger" onclick="stop()">停權</button>
						</form>
					</td>


					<td>

						<form action="recoveryStore" method="POST">
							<input type=hidden value="${Stores.id}" name="target">
							<button type="submit" class="btn btn-success"
								onclick="recovery()">停權取消</button>
						</form>

					</td>
			</c:forEach>
	</table>

</body>
</html>
