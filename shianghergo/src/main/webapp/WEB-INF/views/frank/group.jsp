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
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/res/static/css/main.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/res/layui/css/layui.css">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/res/layui/layui.js"></script>
<script src="http://code.jquery.com/jquery-1.12.4.min.js"></script>

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

.btn-group{
margin:0 auto;
width:1000px;
}

.f2 {
	margin: 0 auto;
}

.f3 {
	margin: 0 auto;
	padding-left: 810px;
	boder: 10px;
}

.f4 {
	margin: 0 auto;
	width: 1000px;
	font-size: 20px;
	text-align: center;
}

.f5 {
	text-align: center;
	width: 1000px;
	background-color: yellow;
	margin: 0 auto;
}

.td1 {
	background-color: #FFF0D4;
}

.card {
	margin: 20px 20px;
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
	<jsp:include page="/WEB-INF/views/eric/header.jsp"></jsp:include>

	<div class="f5">
		<H1>${group.name}</H1>
	</div>


	<div>
		<table style="font-size: :50px; word-break: break-all;" class="f4">
			<tr>
				<td class="td1">團主</td>
				<td colspan="2"><img width='100px' height='100px'
					style="display: block; margin: auto;"
					src="<c:url value='/getmemberPicture/${group.memberBean.id }' />" />${group.memberBean.name}
					<button type="button" class="btn btn-primary">☠檢舉</button>
					<button type="button" class="btn btn-primary">📜評價</button>
					<button type="button" class="btn btn-primary">📩留言給我</button>
					</td>

			</tr>

			<tr>
				<td class="td1">結束時間</td>
				<td colspan="2">${group.end_time }</td>
			</tr>
			<tr>
				<td class="td1">分類</td>
				<td colspan="2">${group.categoryBean.name }</td>
			</tr>

			<tr>
				<td class="td1">付款方式</td>

				<c:if test="${group.payment ==1}">
					<td colspan="2">面交付款</td>
				</c:if>
				<c:if test="${group.payment ==2}">
					<td colspan="2">面交付款</td>
				</c:if>
				<c:if test="${group.payment ==3}">
					<td colspan="2">面交付款、銀行匯款</td>
				</c:if>
			</tr>
			<!-- 			<tr> -->
			<!-- 				<td class="td1">說明</td> -->
			<%-- 				<td style="word-break: break-all;">${group.detail }</td> --%>
			<!-- 			</tr> -->

			<c:forEach var="places" items="${place}" varStatus="i">

				<tr>
					<c:if test="${i.index==0}">
						<td class="td1" rowspan="10">面交地址</td>
					</c:if>
					<td>${places.address }</td>
					<td>${places.time }</td>
				</tr>
			</c:forEach>
		</table>
	</div>
	<div style="margin:0 auto;text-align:center;">
	<div class="btn-group" role="group" aria-label="Basic example" >
		<button type="button" class="btn btn-secondary">商品與說明</button>
		<button type="button" class="btn btn-secondary">評價</button>
		<button type="button" class="btn btn-secondary">團主的其他合購</button>

	</div>
</div>
	<div class="one">

		<div class="f2" style="width: 1000px;">
			<c:forEach var="item" items="${groups_id}">
				<div class="card" style="width: 200px; display: inline-block;">
					<img width='200' height='150'
						src="<c:url value='/frank/getPicture/${item.id }' />"
						class="card-img-top" alt="...">
					<div class="card-body">
						<h5 class="card-title">${item.name}</h5>

						<p class="card-text">商品說明:${item.detail}</p>
						<p class="card-text">商品價格:${item.price}</p>



						<input type="button" value="🛒加入購物車"
							onclick="addGroupCart(${item.id},${item.groupsBean.id})"
							class="btn btn-warning">

					</div>
				</div>
			</c:forEach>
		</div>

	
	</div>
	<jsp:include page="/WEB-INF/views/eric/foot.jsp"></jsp:include>


</body>
</html>