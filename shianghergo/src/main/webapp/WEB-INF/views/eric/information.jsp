<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Document</title>
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/res/static/css/main.css">
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/res/layui/css/layui.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/res/static/css/footer.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/res/static/css/header.css">
  <script type="text/javascript" src="${pageContext.request.contextPath}/res/layui/layui.js"></script>
  <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
  <meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">
  
  <script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
  
  <link rel="stylesheet" href="https://unpkg.com/bootstrap-table@1.15.4/dist/bootstrap-table.min.css">
  <script src="https://unpkg.com/bootstrap-table@1.15.4/dist/bootstrap-table.min.js"></script>
  <script src="https://unpkg.com/bootstrap-table@1.15.4/dist/locale/bootstrap-table-zh-TW.min.js"></script>

  <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

</head>
<body>

  <div class="site-nav-bg" style="height: 30px">
		<div class="site-nav w1200">
			<div class="sn-quick-menu">
				<div class="login">
					<a href="oldindex">舊index</a>
				</div>
				<div class="login">
					<a href="goRegisterPage">註冊</a>
				</div>
				<div class="login">
					<a href="login.jsp">登入</a>
				</div>
				<div class="sp-cart">
					<a href="shopcart.jsp">購物車</a><span>2</span>
				</div>
			</div>
		</div>
	</div>
	<nav class="navbar navbar-expand-lg navbar-light bg-light"
		style="width: 100%">
		<a href="index.jsp"> <img src="${pageContext.request.contextPath}/res/static/img/logo4.png"
			width="100" height="100">
		</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active"><a class="nav-link" href="#">首頁
						<span class="sr-only">(current)</span>
				</a></li>
				<li class="nav-item"><a class="nav-link" href="hao/products">所有商品</a></li>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="frank/groups"
					id="navbarDropdown" role="button" data-toggle="dropdown"
					aria-haspopup="true" aria-expanded="false">今日團購 </a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdown">
						<a class="dropdown-item" href="#">下拉表單1</a> <a
							class="dropdown-item" href="#">下拉表單2</a>
						<div class="dropdown-divider"></div>
					</div></li>
				<li class="nav-item"><a class="nav-link" href="#">我要開團</a></li>

			</ul>
			<form action='<c:url value="/Search.controller" />' method="get"
				class="form-inline my-2 my-lg-0">
				<input class="form-control mr-sm-2" type="text" name="title"
					value="${param.title}" autocomplete="off" placeholder="請輸入需要的商品"
					aria-label="Search">
				<button class="btn btn-outline-success my-2 my-sm-0" type="submit">GO</button>
			</form>
		</div>
	</nav>

  <div class="content content-nav-base information-content">
    <div class="info-list-box">
      <div class="info-list w1200">
			<div class="SearchDiv">
				
				<table data-toggle="table"
					   data-sortable="true"
					   data-pagination="true"
					   data-page-size="10"
					   data-page-list="[10, 20, all]"
					   data-search="true"
					   data-search-on-enter-key="true"
					   >
			      <thead>
			        <tr>
			          <th data-field="img" data-align="center">商品圖片</th>
			          <th data-field="name">商品名稱</th>
			          <th data-field="price" data-sortable="true">商品價位</th>
			          <th data-field="detail">商品描述</th>
			        </tr>
			      </thead>
			      <tbody>
			      
			      	<c:forEach varStatus="stVar" var="anSearch" items="${searchList}">
				        <tr>
				          <td><img src="${pageContext.request.contextPath}/res/static/img/temp.png" height="100"></td>
<%-- 				          <td><img src="${pageContext.request.contextPath}/res/static/img/${anSearch.FileName}.jsp" height="100"></td> --%>
				          <td>${anSearch.name}</td>
				          <td>${anSearch.price}</td>
				          <td>${anSearch.detail}</td>
				        </tr>
			        </c:forEach>
			        
			      </tbody>
			    </table>
				
			</div>
      		     

        <!-- <div id="demo0" style="text-align: center;"></div> -->
      </div>
    </div>
  </div>
<jsp:include page="/WEB-INF/views/eric/foot.jsp"></jsp:include>


</body>
</html>