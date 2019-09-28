<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>您的購物車</title>
<script src="http://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/res/wade/js/cart.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/res/wade/css/cart.css">

</head>




<body>
<jsp:include page="/WEB-INF/views/eric/header.jsp" ></jsp:include>


<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">
  Launch demo modal
</button>

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
			<td><img src="<c:url value='wade/getPicture/${item.item_id}' />" width="50px" height="50px"></td>
			<td>${item.name}</td>
			<td><button class="btn btn-outline-danger btn1" onclick="changeAmount(${item.id},2)">-</button ><span id="${item.id}">${item.amount}</span><button onclick="changeAmount(${item.id},1)" class="btn btn-outline-success btn2">+</button>&nbsp;&nbsp;</td>
			<td>${item.price}</td>
			<td><span id="${item.id}a" style="color:red;"></span></td>
			<td><button onclick="deletetr(this,${item.id})">刪除</button></td>
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
        <a class="btn btn-primary" href="addorder" role="button">加入訂單</a>
      </div>
    </div>
  </div>
</div>




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
			<td><img src="<c:url value='wade/getPicture/${item.item_id}' />" width="50px" height="50px"></td>
			<td>${item.name}</td>
			<td><button class="btn1" onclick="changeAmount(${item.id},2)">-</button ><span id="${item.id}">${item.amount}</span><button onclick="changeAmount(${item.id},1)" class="btn2">+</button>&nbsp;&nbsp;</td>
			<td>${item.price}</td>
			<td><span id="${item.id}a" style="color:red;"></span></td>
			<td><button onclick="deletetr(this,${item.id})">刪除</button></td>
			<script>
				var a = ${item.price} * ${item.amount};
				$("#"+${item.id}+"a").text(a);
			</script>
		</tr>
		</c:forEach>
		<tr><td/><td/><td/><td/>
		<td><span class="total">Total:</span><span id="total" class="total" style="color:red;">${total}</span></td>
		<td><a href="addorder">加入訂單</a></td>
		</tr>
	</table>
	<a href="index">回首頁 </a>
	</div>
	
	<jsp:include page="/WEB-INF/views/eric/foot.jsp" ></jsp:include>
</body>
</html>