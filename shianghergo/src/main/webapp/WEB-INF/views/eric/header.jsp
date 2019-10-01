<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<script>
	function searchType(id){
		if(id=="ibt"){
			document.getElementById("searchType").value=1;
			document.getElementById("ibt").style.color = "#00db00";
			document.getElementById("gbt").style.color = "#ffffff";
		}else{
			document.getElementById("searchType").value=2;
			document.getElementById("ibt").style.color = "#ffffff";
			document.getElementById("gbt").style.color = "#00db00";
		}
		
	}
</script>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/res/static/css/main.css">

<%-- <script type="text/javascript" src="${pageContext.request.contextPath}/res/layui/layui.js"></script> --%>
<!-- <meta name="viewport" -->
<!-- 	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0"> -->
<!-- <meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1"> -->
<!-- <script src="https://code.jquery.com/jquery-3.4.1.js" -->
<!-- 	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" -->
<!-- 	crossorigin="anonymous"></script> -->
<!-- <script -->
<!-- 	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" -->
<!-- 	integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" -->
<!-- 	crossorigin="anonymous"></script> -->
<!-- <link rel="stylesheet" -->
<!-- 	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" -->
<!-- 	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" -->
<!-- 	crossorigin="anonymous"> -->
<!-- <script -->
<!-- 	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" -->
<!-- 	integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" -->
<!-- 	crossorigin="anonymous"></script> -->
<!-- <link rel="stylesheet" -->
<!-- 	href="https://unpkg.com/bootstrap-table@1.15.4/dist/bootstrap-table.min.css"> -->
<!-- <script -->
<!-- 	src="https://unpkg.com/bootstrap-table@1.15.4/dist/bootstrap-table.min.js"></script> -->
<!-- <script -->
<!-- 	src="https://unpkg.com/bootstrap-table@1.15.4/dist/locale/bootstrap-table-zh-TW.min.js"></script> -->
<!-- <link href="https://fonts.googleapis.com/icon?family=Material+Icons" -->
<!-- 	rel="stylesheet"> -->
<!-- 	<link rel="stylesheet" type="text/css" -->
<%-- 	href="${pageContext.request.contextPath}/res/static/css/header.css"> --%>
<!--  以下 六角bootstrap -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js" integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js" integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k" crossorigin="anonymous"></script>
<!-- wade 購物車 -->
<script src="http://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/res/wade/js/cart.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/res/wade/css/cart.css">
<%-- <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/res/wade/css/groupscart.css"> --%>
<script type="text/javascript" src="${pageContext.request.contextPath}/res/wade/js/groupscart.js"></script>
</head>
<!-- 這段勿刪 wade -->
<script>
var x = 1+1;
var y = x+1;
</script>
<!-- 這段勿刪 wade -->
<body>
	<div class="site-nav-bg" style="height:50px;background-color:#ffa042;">
		<div class="site-nav w1200">
			<div class="sn-quick-menu">
			<div class="login" style="margin-top:10px;"><a href="${pageContext.request.contextPath}/testgok" style="color:#ecffff;">測試gok</a></div>
			<div class="login" style="margin-top:10px;"><a href="${pageContext.request.contextPath}/testhead" style="color:#ecffff;">測試head</a></div>
			<div class="login" style="margin-top:10px;"><a href="${pageContext.request.contextPath}/testfoot" style="color:#ecffff">測試foot</a></div>
      	<div class="login" style="margin-top:10px;"><a href="${pageContext.request.contextPath}/productfile.s" style="color:#ecffff">訂購單</a></div>
      	<div class="login" style="margin-top:10px;"><a href="${pageContext.request.contextPath}/wade/showmap" style="color:#ecffff">google map</a></div>
				<div class="login" style="margin-top:10px;">
					<a href="${pageContext.request.contextPath}/oldindex" style="color:#ecffff">舊index</a>
				</div>
				<div class="login" style="margin-top:10px;">
					<a href="${pageContext.request.contextPath}/goRegisterPage" style="color:#ecffff">註冊</a>
				</div>
				<div class="login" style="margin-top:10px;">
					<a href="${pageContext.request.contextPath}/login" style="color:#ecffff">登入</a>
				</div>
<!-- 				<div class="sp-cart"> -->
<%-- 					<a href="${pageContext.request.contextPath}/cart" style="color:#ecffff">購物車</a><span>2</span> --%>
<!-- 				</div> -->
				<div class="login" style="margin-top:10px;">
				<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">
  					購物車<span id="its">${its}件商品</span></button>
  					</div>
  				<div class="login" style="margin-top:10px;">
				<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal2">
  					團購物車<span id=""></span></button>
  					</div>
			</div>
		</div>
	</div>
<!-- 	====  -->
	<nav class="navbar navbar-expand-lg navbar-light bg-light"
		style="width: 100%;margin-bottom: 0px;background-color:#b9b9ff;" >
		<a href="${pageContext.request.contextPath}/index"> <img src="${pageContext.request.contextPath}/res/static/img/logo4.png"
			width="130" height="130">
		</a>
<!-- 		<button class="navbar-toggler" type="button" data-toggle="collapse" -->
<!-- 			data-target="#navbarSupportedContent" -->
<!-- 			aria-controls="navbarSupportedContent" aria-expanded="false" -->
<!-- 			aria-label="Toggle navigation"> -->
<!-- 			<span class="navbar-toggler-icon"></span> -->
<!-- 		</button> -->

		<div class="collapse navbar-collapse" id="navbarSupportedContent" style="margin-left:120px">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/index" style="margin-right:25px;font-weight:bold">首頁</a></li>
				
				<li class="nav-item dropdown">
					<a class="nav-link dropdown-toggle" href="" id="navbarDropdown1" role="button" data-toggle="dropdown"
					aria-haspopup="true" aria-expanded="false" style="margin-right:25px;font-weight:bold">瀏覽商品</a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdown1" style="text-align:center;">
						<a class="dropdown-item" href="${pageContext.request.contextPath}/hao/products">所有商品</a>
						<c:forEach var="category" items="${categoryList}">
							<a class="dropdown-item" href="">${category.name}</a> 
						</c:forEach>
<!-- 						<div class="dropdown-divider"></div> -->
					</div>
				</li>
				
				<li class="nav-item dropdown">
					<a class="nav-link dropdown-toggle" href="" id="navbarDropdown2" role="button" data-toggle="dropdown"
						aria-haspopup="true" aria-expanded="false" style="margin-right:25px;font-weight:bold">瀏覽團購 </a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdown2" style="text-align:center;">
						<a class="dropdown-item" href="${pageContext.request.contextPath}/frank/groups">所有團購</a>
						<c:forEach var="category" items="${categoryList}">
							<a class="dropdown-item" href="">${category.name}</a> 
						</c:forEach>
<!-- 						<div class="dropdown-divider"></div> -->
					</div>
				</li>
					
				<li class="nav-item"><a class="nav-link" href="frank/Groups1" style="margin-right:25px;font-weight:bold">我要開團</a></li>

			</ul>
			
			
			
<%-- 			<form action="${pageContext.request.contextPath}/leopard/showGroups"  method="POST" --%>
<!-- 				class="form-inline my-2 my-lg-0"> -->
<!-- 				<select name="sort"> -->
<!-- 					<option value="1">找商品</option> -->
<!-- 					<option value="2">找團</option> -->
<!-- 				</select> -->
<!-- 				<input class="form-control mr-sm-2" type="text" name="name" -->
<!-- 					autocomplete="off" placeholder="您要搜尋團購還是商品？" -->
<!-- 					aria-label="Search" style="width:300px"> -->
<!-- 				<button class="btn btn-outline-success my-2 my-sm-0" type="submit">GO</button> -->
<!-- 			</form> -->
			
			
				<div class="btn-toolbar mb-3" role="toolbar" aria-label="Toolbar with button groups">
				  <div class="btn-group mr-2" role="group" aria-label="First group">
				    <button id="ibt" class="btn btn-secondary" onclick="searchType(this.id)">找商品</button>
				    <button id="gbt" class="btn btn-secondary" onclick="searchType(this.id)">找團</button>
				  </div>
				  
				 <form action="${pageContext.request.contextPath}/leopard/showGroups"  method="POST" class="form-inline my-2 my-lg-0">
				  <div class="input-group">
				  	<input type="hidden" value="1" name="sort" id="searchType">
				    <input type="text" class="form-control" name="name" placeholder="您要搜尋團購還是商品？" style="width:300px" aria-label="Input group example" aria-describedby="btnGroupAddon">
				  </div>
				  <button class="btn btn-outline-success my-2 my-sm-0" type="submit" style="margin-left:10px">GO</button>
				  </form>
				</div>
				
				
			
			
			
		</div>
	</nav>
	
	
	<!-- wade購物車 -->

<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">您的購物車</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body" style="padding:0px;">
        <div class="cartdiv">
			<table class="tb">
		<tr>
			<th></th>
			<th>品名</th>
			<th>數量</th>
			<th>單價</th>
			<th>小計</th>
			<th>操作</th>
		</tr>
		<c:forEach var="item" items="${cartitems}">
		<tr>
			<td><img src="${pageContext.request.contextPath}/wade/getPicture/${item.item_id}" width="50px" height="50px"></td>
			<td>${item.name}</td>
			<td><button class="btn btn-outline-danger btn1" onclick="changeAmount(${item.id},2)">-</button ><span id="${item.id}">${item.amount}</span><button onclick="changeAmount(${item.id},1)" class="btn btn-outline-success btn2">+</button>&nbsp;&nbsp;</td>
			<td>${item.price}</td>
			<td><span id="${item.id}a" style="color:red;"></span></td>
			<td><button class="btn btn-danger" onclick="deletetr(this,${item.id})">刪除</button></td>
			
			<script>
				var a = ${item.price} * ${item.amount};
				$("#"+${item.id}+"a").text(a);
			</script>
		</tr>
		</c:forEach>
		<tr><td/><td/><td/><td/>
		<td><span class="total">Total:</span><span id="total" class="total" style="color:red;">${total}</span></td>
		<td></td>
		</tr>
	</table>
<!-- 	<a href="index">回首頁 </a> -->
	</div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
<!--         <button type="button" class="btn btn-primary">Save changes</button> -->
        <a class="btn btn-primary" href="${pageContext.request.contextPath}/addorder" role="button">加入訂單</a>
      </div>
    </div>
  </div>
</div>
	
<!-- wade 購物車結束 -->

<!-- wade 團團團購物車 -->

<div class="modal fade" id="exampleModal2" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">您的團購物車</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body" style="padding:0px;">
      
      
      
      
      <div class="cartdiv">
		<table class="tb">
			<tr>
				<th>我想團...</th>
				<th>數量</th>
				<th>單價</th>
				<th>小計</th>
				<th>操作</th>
			</tr>
			<c:forEach var="gitem" items="${gcartitems}">
				<tr>
					<td>${gitem.name}</td>
					<td><button class="btn btn-outline-danger btn1" onclick="changeGroupAmount(${gitem.id},2)">-</button ><span id="${gitem.id}">${gitem.amount}</span><button onclick="changeGroupAmount(${gitem.id},1)" class="btn btn-outline-success btn2">+</button>&nbsp;&nbsp;</td>
					<td>${gitem.price}</td>
					<td><span id="${gitem.id}a" style="color:red;"></span></td>
					<td><button class="btn btn-danger" onclick="gdeletetr(this,${gitem.id})">刪除</button></td>
					<script>
					var a = ${gitem.price} * ${gitem.amount};
					$("#"+${gitem.id}+"a").text(a);
					</script>
				</tr>
			</c:forEach>
			<tr>
				<td/>
				<td/>
				<td/>
				<td><span class="total">Total:</span><span id="gtotal" class="total" style="color:red;">${gtotal}</span></td>
				<td></td>
			</tr>
		</table>
	</div>
      
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <a class="btn btn-primary" href="${pageContext.request.contextPath}/addgrouporder?gid=${gcartitems[0].groups_id}" role="button">確定跟團</a>
      </div>
    </div>
  </div>
</div>
	
<!-- wade 團團團購物車結束 -->
</body>
</html>