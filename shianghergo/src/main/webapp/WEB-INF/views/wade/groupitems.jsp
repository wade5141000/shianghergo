<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<script src="http://code.jquery.com/jquery-1.12.4.min.js" ></script>
<meta charset="UTF-8">
<script>

function addGroupCart(item_id,groups_id){
	$.ajax({
		url:"addtocart?id="+item_id+"&gid="+groups_id,
		type:"get",
		success:function(data){
			if(data==1){
				alert("添加成功");
			}else{
				alert("不可添加其他團商品");
			}
		},
	})
}


</script>


<title>group items</title>
</head>
<body>
<a href="../groupcart">進購物車</a>
<!-- <a href="orderlist">我的訂單 </a> -->
<c:forEach var="item" items="${set}">
<div style="border:1px solid;margin:5px;padding:3px;">

<p>${item.name} ; ${item.price} ; ${item.detail}</p>
<button onclick="addGroupCart(${item.id},${item.groupsBean.id})">加入購物車</button>
<%-- <button onclick="goCart(${item.id})">加入購物車</button> --%>

</div>
</c:forEach>

<!-- <div style="border:1px solid; width:auto; height:auto;" id="cart"> -->

<!-- </div> -->

</body>
</html>