<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<script src="http://code.jquery.com/jquery-1.12.4.min.js" ></script>
<meta charset="UTF-8">
<title>cart</title>
<style>
table {
	margin: 10px;
	padding: 10px;
	border-collapse: collapse;
}

tr{ 
	margin:10px;
 	padding:10px; 
 } 

td{  
 	margin:10px; 
 	padding:10px; 
 } 
span{
 	padding:5px;
 }
</style>
<script>

	function changeAmount(id,types){
		if($("#"+id).text()==1 && types ==2){
			alert("商品數量不可低於1")
		}else{
			var total2 = $("#total").text();
			$.ajax({
				url:"changeAmount?id="+id+"&type="+types+"&total="+total2,
				type:"get",
				success:function(data){
					list = data.split(",");
					$("#total").text(list[0]);
					$("#"+list[2]).html(list[1]);
					$("#"+id+"a").text(list[3]);
				},
			})
		}
	}
	
	function deletetr(it,id){
		if(confirm("是否刪除商品?")){
			$.ajax({
				url:"delete?id="+id,
				type:"get",
				success:function(data){
					$(it.parentNode.parentNode).remove();
					$("#total").text($("#total").text()-data);
				},
			})
			
		}
		
	}

</script>
</head>
<body>
	<table border="1">
		<tr>
			<td>品名</td>
			<td>數量</td>
			<td>單價</td>
			<td>小計</td>
			<td>操作</td>
		</tr>
		<c:forEach var="item" items="${cartitems}">
		<tr>
			<td>${item.name}</td>
			<td><span id="${item.id}">${item.amount}</span><button onclick="changeAmount(${item.id},1)">+</button>&nbsp;&nbsp;<button onclick="changeAmount(${item.id},2)">-</button></td>
			<td>${item.price}</td>
			<td><span id="${item.id}a"></span></td>
			<td><button onclick="deletetr(this,${item.id})">刪除</button></td>
			<script>
				var a = ${item.price} * ${item.amount};
				$("#"+${item.id}+"a").text(a);
			</script>
		</tr>
		</c:forEach>
	</table>
	<h2>total:<span id="total">${total}</span></h2>
	<button>確認結帳</button>
</body>
</html>