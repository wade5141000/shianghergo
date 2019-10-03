<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<script src="http://code.jquery.com/jquery-1.12.4.min.js" ></script>
<meta charset="UTF-8">
<title>訂單詳情</title>
<style>

.tdd{
	border:1px solid gray;
}

tr:first-child td:first-child{
  border-top-left-radius: 5px;
}

tr:first-child td:last-child{
  border-top-right-radius: 5px;
}

tr:last-child td:first-child{
  border-bottom-left-radius: 5px;
}

tr:last-child td:last-child{
  border-bottom-right-radius: 5px;
}

</style>
</head>
<body style="background-color: #fffaf4;">

<jsp:include page="/WEB-INF/views/eric/header.jsp" ></jsp:include>

<%-- <h2>訂單：<span style="color:#ff7575">${order_id}</span> 已建立。</h2> --%>

<%-- <h4>您可以選擇<a href="order/${order_id}">立刻結帳</a>或稍後至<a href="">用戶中心</a>結帳</h4> --%>

<div style="text-align: center; margin: auto;">

		<h2 style="margin-top:20px;font-weight:bold">訂單：<span style="color:#ff7575">${order.id}</span> 已建立。</h2>
		
		<h3 style="font-weight:bold">您可以選擇<a href="order/${order.id}" class="badge badge-success" style="margin:10px">立刻結帳</a>或<a href="${pageContext.request.contextPath}/hao/products" class="badge badge-info" style="margin:10px">回到商城</a>繼續購買。</h3>
		<table style="margin:15px auto;width:450px;border-collapse: separate;border-spacing: 0;">
			<tr>
				<td class="tdd" style="background-color:#ffa042;color:#2828ff;font-weight:bold;">訂單編號</td>
				<td class="tdd">${order.id}</td>
			</tr>
			<tr>
				<td class="tdd" style="background-color:#ffa042;color:#2828ff;font-weight:bold">訂購時間</td>
				<td class="tdd">${order.order_time}</td>
			</tr>
			<tr>
				<td class="tdd" style="background-color:#ffa042;color:#2828ff;font-weight:bold">訂單金額</td>
				<td class="tdd">${order.price}</td>
			</tr>
			<tr>
				<td class="tdd" style="background-color:#ffa042;color:#2828ff;font-weight:bold">付款方式</td>
				<td class="tdd">${order.payment}</td>
			</tr>
		</table>
		
		
		<button class="btn btn-primary" type="button" data-toggle="collapse" data-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample">
			查看商品明細</button>
  		<div class="collapse" id="collapseExample">
  			<table style="margin:15px auto;width:450px;border-collapse: separate;border-spacing: 0;">
				<tr style="background-color:#ffd2d2">
					<td class="tdd">商品名稱</td>
					<td class="tdd">單價</td>
					<td class="tdd">數量</td>
				</tr>
				<c:forEach var="item" items="${details}">
					<tr>
						<td class="tdd">${item.name}</td>
						<td class="tdd">${item.price}</td>
						<td class="tdd">${item.amount}</td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>
	
	
	
	
<jsp:include page="/WEB-INF/views/eric/foot.jsp" ></jsp:include>
</body>
</html>