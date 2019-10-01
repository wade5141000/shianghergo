<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>跟團結果</title>
<style>
td{
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
	<jsp:include page="/WEB-INF/views/eric/header.jsp"></jsp:include>
	<div style="text-align: center; margin: auto;">
		<h2 style="margin-top:20px;color:#00bb00;font-weight:bold">跟團成功</h2>
		<h6 style="margin-top:20px;">請您提前聯繫主購，並在約定時間進行取貨</h6>
		<table style="margin:30px auto;width:450px;border-collapse: separate;border-spacing: 0;">
			<tr>
				<td style="background-color:#ffa042;color:#2828ff;font-weight:bold">訂單編號</td>
				<td>${order.id}</td>
			</tr>
			<tr>
				<td style="background-color:#ffa042;color:#2828ff;font-weight:bold">訂購時間</td>
				<td>${order.time}</td>
			</tr>
			<tr>
				<td style="background-color:#ffa042;color:#2828ff;font-weight:bold">訂購人</td>
				<td>${order.name}</td>
			</tr>
			<tr>
				<td style="background-color:#ffa042;color:#2828ff;font-weight:bold">聯繫電話</td>
				<td>${order.phone}</td>
			</tr>
			<tr>
				<td style="background-color:#ffa042;color:#2828ff;font-weight:bold">訂單金額</td>
				<td>${order.price}</td>
			</tr>
			<tr>
				<td style="background-color:#ffa042;color:#2828ff;font-weight:bold">付款方式</td>
				<c:if test="${order.payment==1}">
					<td>面交付款</td>
				</c:if>
				<c:if test="${order.payment==2}">
					<td>銀行匯款</td>
				</c:if>
			</tr>
			<tr>
				<td style="background-color:#ffa042;color:#2828ff;font-weight:bold">面交地點</td>
				<td>${order.place.address}</td>
			</tr>
			<tr>
				<td style="background-color:#ffa042;color:#2828ff;font-weight:bold">面交時間</td>
				<td>${order.place.time}</td>
			</tr>

		</table>
		
		<button class="btn btn-primary" type="button" data-toggle="collapse" data-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample">
			團購明細</button>
  		<div class="collapse" id="collapseExample">
  			<table style="margin:15px auto;width:450px;border-collapse: separate;border-spacing: 0;">
				<tr>
					<td>商品名稱</td>
					<td>單價</td>
					<td>數量</td>
				</tr>
				<c:forEach var="item" items="${orderDetail}">
					<tr>
						<td>${item.name}</td>
						<td>${item.price}</td>
						<td>${item.amount}</td>
					</tr>
				</c:forEach>
			</table>
		</div>
		
		
		
		
	</div>
	<jsp:include page="/WEB-INF/views/eric/foot.jsp"></jsp:include>
</body>
</html>