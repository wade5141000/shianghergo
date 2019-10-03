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
<title>header</title>

<!--  以下 六角bootstrap -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js" integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js" integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k" crossorigin="anonymous"></script>
<!-- wade 購物車 -->
<script src="http://code.jquery.com/jquery-1.12.4.min.js" ></script>

<script type="text/javascript" src="${pageContext.request.contextPath}/res/wade/js/cart.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/res/wade/css/cart.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/res/wade/js/groupscart.js"></script>



</head>
<!-- 這段勿刪 wade -->
<script>
var x = 1+1;
var y = x+1;
</script>
<!-- 這段勿刪 wade -->
<body>
<h2>header11:${header11} login:${loginOK.name}</h2>
<ul class="nav justify-content-end" style="height:50px;background-color:#ffa042;">

  <li class="nav-item">
    <a class="nav-link active badge badge-light" href="${pageContext.request.contextPath}/testgok" >測試gok</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" href="${pageContext.request.contextPath}/testhead" style="color:#ecffff;">測試head</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" href="${pageContext.request.contextPath}/testfoot" style="color:#ecffff">測試foot</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" href="${pageContext.request.contextPath}/productfile.s" style="color:#ecffff">訂購單</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" href="${pageContext.request.contextPath}/wade/showmap" style="color:#ecffff">google map</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" href="${pageContext.request.contextPath}/oldindex" style="color:#ecffff">舊index</a>
  </li>
  <li class="nav-item">
    <a class="nav-link"></a>
  </li>
  <li class="nav-item">
    <a class="nav-link"></a>
  </li>
  <li class="nav-item">
    <a class="nav-link"></a>
  </li>
  <li class="nav-item">
    <a class="nav-link"></a>
  </li>
  <li class="nav-item">
    <a class="nav-link"></a>
  </li>
  <li class="nav-item">
    <a class="nav-link"></a>
  </li>
  
  
  <c:if test="${header11 != 2}" >
	  <li class="nav-item">
	    <a class="nav-link" href="${pageContext.request.contextPath}/goRegisterPage" style="color:#ecffff">註冊</a>
	  </li>
	  <li class="nav-item">
	    <a class="nav-link" href="${pageContext.request.contextPath}/login" style="color:#ecffff">登入</a>
	  </li>
  </c:if>
  <c:if test="${header11 == 2}" >
  
  
  <li class="nav-item dropdown">
        <a class="nav-link " href="#" id="barnotification" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="color:#ecffff">
        	  通知
        </a>
        <div class="dropdown-menu" aria-labelledby="barnotification">
        	<c:forEach var="notis" items="${notification}">
          		<span class="dropdown-item">${notis.contents}</span>
          	</c:forEach>
        </div>
      </li>
  
  
  	 	<li class="nav-item">
  	 	<a class="navbar-brand" href="${pageContext.request.contextPath}/memberPage">
    		<img src="${pageContext.request.contextPath}/getmemberPicture/${loginOK.id}" width="30" height="30" alt="">
 	 	</a>
	  </li>
  	 <li class="nav-item">
	    <a class="nav-link" href="${pageContext.request.contextPath}/memberPage" style="color:#ecffff">${loginOK.name}</a>
	  </li>
  
	  <li class="nav-item">
	    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">購物車<span id="its">${its}</span>件商品</button>
	  </li>
	  <li class="nav-item">
	    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal2">團購物車<span id="gits">${gits}</span>件商品</button>
	  </li>
  </c:if>
</ul>


	<nav class="navbar navbar-expand-lg navbar-light bg-light"
		style="width: 100%;margin-bottom: 20px;background-color:#b9b9ff;" >
		<a href="${pageContext.request.contextPath}/index"> <img src="${pageContext.request.contextPath}/res/static/img/logo4.png"
			width="130" height="130">
		</a>
		
		<div class="collapse navbar-collapse" id="navbarSupportedContent" style="margin-left:120px">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/index" style="margin-right:25px;font-weight:bold">首頁</a></li>
				<li class="nav-item dropdown">
					<a class="nav-link dropdown-toggle" href="" id="navbarDropdown1" role="button" data-toggle="dropdown"
					aria-haspopup="true" aria-expanded="false" style="margin-right:25px;font-weight:bold">瀏覽商品</a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdown1" style="text-align:center;">
						<a class="dropdown-item" href="${pageContext.request.contextPath}/hao/products">所有商品</a>
						<div class="dropdown-divider"></div>
						<c:forEach var="category" items="${categoryList}">
							<a class="dropdown-item" href="" style="line-height:2em">${category.name}</a> 
						</c:forEach>
					</div>
				</li>
				
				<li class="nav-item dropdown">
					<a class="nav-link dropdown-toggle" href="" id="navbarDropdown2" role="button" data-toggle="dropdown"
						aria-haspopup="true" aria-expanded="false" style="margin-right:25px;font-weight:bold">瀏覽團購 </a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdown2" style="text-align:center;">
						<a class="dropdown-item" href="${pageContext.request.contextPath}/frank/groups">所有團購</a>
						<div class="dropdown-divider"></div>
						<c:forEach var="category" items="${categoryList}">
							<a class="dropdown-item" href="" style="line-height:2em">${category.name}</a> 
						</c:forEach>
					</div>
				</li>
					
				<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/frank/Groups1" style="margin-right:25px;font-weight:bold">我要開團</a></li>
			</ul>
					
			
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
<c:if test="${header11==2}" >
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content" style="text-align:center;">
<!--       <div class="modal-header"> -->
        <h3 class="modal-title" id="exampleModalLabel" style="margin-top:20px">您的購物車</h3>
<!--         <button type="button" class="close" data-dismiss="modal" aria-label="Close"> -->
<!--           <span aria-hidden="true">&times;</span> -->
<!--         </button> -->
<!--       </div> -->
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
    <div class="modal-content" style="text-align:center">
<!--       <div class="modal-header"> -->
        <h3 class="modal-title" id="exampleModalLabel" style="margin-top:20px">您的團購物車</h3>
<!--         <button type="button" class="close" data-dismiss="modal" aria-label="Close"> -->
<!--           <span aria-hidden="true">&times;</span> -->
<!--         </button> -->
<!--       </div> -->
      <div class="modal-body" style="padding:0px;">
      
      
      
      
      <div class="cartdiv" id="gtable">
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
					<td id="giname">${gitem.name}</td>
					<td><button class="btn btn-outline-danger btn1" onclick="changeGroupAmount(${gitem.id},2)">-</button ><span id="${gitem.id}">${gitem.amount}</span><button onclick="changeGroupAmount(${gitem.id},1)" class="btn btn-outline-success btn2">+</button>&nbsp;&nbsp;</td>
					<td id="giprice">${gitem.price}</td>
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
	</c:if>
<!-- wade 團團團購物車結束 -->


</body>
</html>