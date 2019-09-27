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

</head>



<script>
function Notification()
  {
  var r=confirm("是否要警告")
  if (r==true)
    {
	  alert('警告成功');
    }
  else
    {
	  alert('警告取消');
    }
  }

function stop()
{
var r=confirm("是否要停權")
if (r==true)
  {
	  alert('停權成功');
  }
else
  {
	  alert('停權取消');
  }
}

function recovery()
{
var r=confirm("是否恢復權限")
if (r==true)
  {
	  alert('恢復權限成功');
  }
else
  {
	  alert('恢復權限取消');
  }
}

</script>


<style>
* {
	font-family: 微軟正黑體;
}

.adminlogin {
	float: right;
}

.title {
	color: white;
	text-align:center;
}
</style>

<body>

	<div class="navbar navbar-inverse">
		<h1 class="title">商店管理</h1>
		<span class="adminlogin"><a href="login"
			class="btn btn-default navbar-btn">切換管理員</a></span>




		<ul class="nav nav-pills">
			<li role="presentation"><a href="member.do">會員管理</a></li>
			<li role="presentation" class="active"><a href="store.do">商店管理</a></li>
			<li role="presentation"><a href="showItem">商品管理</a></li>
			<li role="presentation"><a href="showGroups_item">團購商品管理</a></li>
			<li role="presentation"><a href="showVM.do">違規處理-會員</a></li>
			<li role="presentation"><a href="showVS.do">違規處理-商店</a></li>

		</ul>

	</div>
	<div class="content">
		<div class="container">
			<table class="table table-striped">
				<c:forEach var='Stores' items='${Store}'>
					<thead>
						<tr>
							<th>商店名稱</th>
							<th>商店ID</th>
							<th>商店會員ID</th>
							<th>商店介紹</th>
							<th>狀態</th>
							<th></th>
							<th></th>
							<th></th>
							<th></th>
							<th></th>
						</tr>
					</thead>

					<td>${Stores.name}</td>
					<td>${Stores.id}</td>
					<td>${Stores.member_id}</td>
					<td>${Stores.detail}</td>
					<td>${Stores.status}</td>

					<td>
						<form action="reportStore" method="POST">
							<input type=hidden value="${Stores.id}" name="target">
							<button type="submit" class="btn btn-info" >檢舉</button>

						</form>
					</td>

					<td>
						<form action="NotificationStore" method="POST">
							<input type=hidden value="${Stores.id}" name="target">
							<button type="submit" class="btn btn-warning" onclick="Notification()">警告</button>
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
							<button type="submit" class="btn btn-success" onclick="recovery()">恢復權限</button>
						</form>

					</td>




					<td>

						<form action="evaluationStore1" method="POST">
							<input type=hidden value="${Stores.id}" name="Store_id">
							<button type="submit" class="btn btn-success">評價</button>
						</form>

					</td>


				</c:forEach>

			</table>
		</div>
	</div>
</body>
</html>
