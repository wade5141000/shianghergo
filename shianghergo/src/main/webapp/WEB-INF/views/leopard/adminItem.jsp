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

<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.0/jquery.min.js"></script>

<script>
function  delete777()
  {
  var r=confirm("是否要下架")
  if (r==true)
    {
	  alert('下架成功');
    }
  else
    {
	  alert('下架取消');
    }
  }


</script>


</head>

<style>
* {
	font-family: 微軟正黑體;

}

.adminlogin {
	float: right;
}

.title {
	color: white;
}
</style>

<body>



	<div class="navbar navbar-inverse">
		<h1 class="title">商品管理</h1>
		<span class="adminlogin"><a href="login"
			class="btn btn-default navbar-btn">管理員登入</a></span>




		<ul class="nav nav-pills">
			<li role="presentation"><a href="member.do">會員管理</a></li>
			<li role="presentation"><a href="store.do">商店管理</a></li>
			<li role="presentation" class="active"><a href="showItem">商品管理</a></li>
			<li role="presentation" ><a href="showGroups_item">團購商品管理</a></li>
			<li role="presentation"><a href="showVM.do">違規處理-會員</a></li>
			<li role="presentation"><a href="showVS.do">違規處理-商店</a></li>

		</ul>

	</div>

<div id="update">
<div class="content">
	<div class="container">
		<table class="table table-striped">	
			<c:forEach var='items' items='${item}'>

<thead>
					<tr>
						<th>商品名稱</th>
						<th>商品ID</th>
						<th>商品數量</th>
						<th>商品價錢</th>
						<th>商品介紹</th>
				       	<th></th>
				  	    <th></th>
					</tr>
				</thead>
						<td>${items.name}</td>
						<td>${items.id}</td>
						<td>${items.reserve}</td>
						<td>${items.price}</td>
					    <td>${items.detail}</td>





<td>
				<form action="deletel" method="POST">
					<input type=hidden value="${items.id}" name="id"> 
					 <button type="submit" class="btn btn-info" onclick="delete777()">下架</button>
				</form>
			</td>
			
			<td>
					<form action="evaluationItem1" method="POST">
						<input type=hidden value="${items.id}" name="item_id"> 
				    <button type="submit" class="btn btn-success">評價</button> 
					</form>
	
			</td>
		
		

			</c:forEach>
</table>
	</div>
	</div>
	</div>
</body>
</html>