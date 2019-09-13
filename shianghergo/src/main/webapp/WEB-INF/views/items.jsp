<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<script src="http://code.jquery.com/jquery-1.12.4.min.js" ></script>
<meta charset="UTF-8">
<title>Items</title>
<script type="text/javascript">

	function goCart(x){
		$.ajax({
			url:"gocart?id="+x,
			type:"get",
			success:function(data){
				updateCart();
			},
			
		})
	}
	
	function updateCart(){
		$.ajax({
			url:"updatecart",
			type:"get",
			success:function(data){
				list = JSON.parse(data);
				$("#cart").html("<p>品名&emsp;單價&emsp;數量</p>")
				for(i=0;i<list.length;i++){
					$("#cart").append("<p>"+list[i].name+"&emsp;"+list[i].price+"&emsp;"+list[i].amount+"</p>")
				}
			}
		})
	}

</script>
</head>
<body>
<a href="cart">進購物車</a>

<c:forEach var="item" items="${items}">
<div style="border:1px solid;margin:5px;padding:3px;">

<p>${item.name} ; ${item.reserve} ; ${item.price} ; ${item.detail}</p>
<button onclick="goCart(${item.id})">加入購物車</button>

</div>
</c:forEach>

<div style="border:1px solid; width:auto; height:auto;" id="cart">

</div>
</body>
</html>