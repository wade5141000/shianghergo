<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
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


<style>
.s1 {
	width: 50px;
}

* {
	font-family: 微軟正黑體;
}
</style>
<script>
	
function Notification(target,type){
	
	var x = confirm("是否要警告ID[" + target +"]會員");
	if (x) {
		alert('警告成功');
		var httpRequest = new XMLHttpRequest();
		httpRequest.open('GET', 'http://localhost:8080/shianghergo/leopard/NotificationMember?target='+target+'&type='+type, true);
		httpRequest.send();
	
		setTimeout("history.go(0);",100);

	}else {	
		alert('警告取消');	
	}	

	
}

function stop(target,type){
	
	var x = confirm("是否要停權ID[" + target +"]會員");
	if (x) {
		alert('停權成功');
		var httpRequest = new XMLHttpRequest();
		httpRequest.open('GET', 'http://localhost:8080/shianghergo/leopard/stopMember?target='+target+'&type='+type, true);
		httpRequest.send();
	
		setTimeout("history.go(0);",100);

	}else {	
		alert('停權取消');	
	}	

	
}

function recovery(target,type){
	
	var x = confirm("是否要恢復ID[" + target + "]會員權限");
	if (x) {
		alert('恢復權限成功');
		var httpRequest = new XMLHttpRequest();
		httpRequest.open('GET', 'http://localhost:8080/shianghergo/leopard/recoveryMember?target='+target+'&type='+type, true);
		httpRequest.send();
	
		setTimeout("history.go(0);",100);

	}else {	
		alert('恢復權限取消');	
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
		<a class="navbar-brand" href="#">管理員功能</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarNav" aria-controls="navbarNav"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarNav">
			<ul class="navbar-nav">
				<li class="nav-item active"><a class="nav-link"
					href="member.do">會員管理 <span class="sr-only">(current)</span></a></li>
				<li class="nav-item"><a class="nav-link" href="store.do">商店管理</a>
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


	<div style="margin-left: 150px; margin-top: 15px">


		<h3>會員</h3>



		<form action="memberStatus" method="POST">
			<div class="alert alert-primary" role="alert" style="width:250px;">
				<select name="status">
					<option value="1">一般會員</option>
					<option value="2">停權會員</option>
				</select>
			<button type="submit" class="btn btn-primary">search</button>
			</div>
		</form>
	</div>
	<table class="table"
		style="width: 1400px; margin-left: 150px; margin-top: 50px;">
		<thead class="thead-dark">
			<tr>
				<th scope="col">狀態</th>
				<th scope="col">會員ID</th>
				<th scope="col">會員帳號</th>
				<th scope="col">會員名稱</th>
				<th scope="col">會員信箱</th>
				<th scope="col">會員電話</th>
				<th scope="col">會員地址</th>
				<th scope="col"></th>
				<th scope="col"></th>
				<th scope="col"></th>


			</tr>
		</thead>
		<tbody>
			<c:forEach var='members' items='${Member}'>
				<tr>
					<c:choose>

						<c:when test="${members.status eq '2'}">

							<td class="alert alert-danger" role="alert"></td>

						</c:when>
						<c:when test="${members.status eq '1'}">

							<td class="alert alert-success" role="alert"></td>

						</c:when>

					</c:choose>
					<td>${members.id}</td>
					<td>${members.account}</td>
					<td>${members.name}</td>
					<td>${members.email}</td>
					<td>${members.phone}</td>
					<td>${members.address}</td>


					<td><button type="button" class="btn btn-warning"
							onclick="Notification(${members.id},1)">❗❗</button></td>

					<td><button type="button" class="btn btn-danger"
							onclick="stop(${members.id},1)">X</button></td>

					<td><button type="button" class="btn btn-success"
							onclick="recovery(${members.id},1)">O</button></td>

				</tr>
			</c:forEach>

		</tbody>
	</table>
	<a href="reportAndevaMember">檢舉評價會員</a>
	<a href="reportAndevaStore">檢舉評價商家</a>
	<a href="reportAndevaItem">評價商品</a>
</body>
</html>
