<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>跟團成功，請您提前聯繫主購，並在約定時間進行取貨</h3>
<h3>訂單明細${order.id}</h3>
<h3>訂購人:${order.name}</h3>
<h3>聯繫電話:${order.phone}</h3>
<h3>價格:${order.price}</h3>
<h3>payment:${order.payment}</h3>
<h3>地址:${order.place.address}</h3>
<h3>時間:${order.place.time}</h3>

<a href="index">回首頁</a>
</body>
</html>