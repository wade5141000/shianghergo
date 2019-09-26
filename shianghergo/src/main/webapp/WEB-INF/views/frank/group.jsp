<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>group</title>
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/res/static/css/main.css">
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/res/layui/css/layui.css">
  <script type="text/javascript" src="${pageContext.request.contextPath}/res/layui/layui.js"></script>
<script src="http://code.jquery.com/jquery-1.12.4.min.js" ></script>

<style>
.gd1 {
	background-color: yellow;
	display: inline-block;
}

.group {
	position: relative;
	left: 50%;
	margin-left: -380px; /* 760 除以 -2 */
	width: 760px;
}
</style>
<script>

function addGroupCart(item_id,groups_id){
	$.ajax({
		url:"../addtocart?itemid="+item_id+"&gid="+groups_id,
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
</head>
<body>

	<div>
		<div>

			<h2>${group.name}</h2>
		</div>

	</div>




	<!-- 	<div> -->

	<%-- 	<img width="100" heigth="150" src="<c:url value='/Picture/${group.groupId}'/>"/> --%>
	<!-- 	</div> -->

	<div style="align: center">

		<P>
			<a href="<spring:url value='memberdata?mmid=${member_id.id}' />">團主:${member_id.name}
			</a>
		</P>

		<p>付款方式:${group.payment}</p>
		<p>截止時間:${group.end_time}</p>
		<p>商品說明:${group.detail}</p>



		<div>
<!-- 			<img width='600' height='450' -->
<%-- 				src="<c:url value='/frank/getgroupPicture/${group.id }' />" /> --%>
		</div>


		<div>
			<c:forEach var="places" items="${place}">
				<div class="gd1" style="width: 250px; height: 200px;">
					<p>地址:${places.address}</p>
					<p>時間:${places.time}</p>

				</div>
			</c:forEach>
		</div>
		<br> <br> <br>
		<div style="height: 280px;">
			<c:forEach var="item" items="${groups_id}">
				<div class="gd1" style="width: 250px; height: 300px;">
					<div>
<!-- 						<img width='100' height='100' -->
<%-- 							src="<c:url value='/frank/getPicture/${item.id }' />" /> --%>
					</div>
					<p>商品名稱:${item.name}</p>
					<p>商品說明:${item.detail}</p>
					<p>商品價格:${item.price}</p>
					<button style="width:140px;height:40px;" onclick="addGroupCart(${item.id},${item.groupsBean.id})"><i class="layui-icon layui-icon-cart-simple" ></i>加入購物車</button>
				</div>
			</c:forEach>
			<a href="../groupcart">進購物車</a>
		</div>
	</div>



</body>
</html>