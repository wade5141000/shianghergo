<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table border='1' style="border-collapse:collapse">
<tr>
<td style="padding:10px"><a href="productfile.do">下載訂購單</a></td>
<td style="padding:10px"><a href="showitem">商品列表</a></td>
</tr>
<tr>
<td style="padding:10px"><a href="cart">進購物車</a></td>
<td style="padding:10px"><a href="showgroups">團購列表</a></td>
</tr>
<tr>
<td style="padding:10px"> <a href="wade/showmap">Google Map</a></td>
<td style="padding:10px"><p>---</p></td>
</tr>
</table>

<form action="uploadimg" method="post" enctype="multipart/form-data">
	file:<input type ="file" name = "image" ><br>
	<input type = "submit" value="送出" >
</form>
<img src="showimg" style="width:80px;height:80">
<hr>
<h1 style="text-align:center">Products(浩瑜)</h1>
	<table border="1" style="margin: 0px auto;">
		<tr height="52" bgcolor="lightblue" align="center">
			<td width="350"><p align="left"/>
				<a href='hao/products/add'>新增產品資料</a><BR>
			</td>
			<td width="350"><p align="left"/>
				<a href="hao/products">所有產品資料</a><BR>
			</td>
		</tr>
		<tr height="52" bgcolor="lightblue" align="center">
			<td width="350"><p align="left"/>
				<a href='hao/buildStore'>開立商家</a><BR>
			</td>
			<td width="350"><p align="left"/>
				<a href="hao/stores">所有商家資料</a><BR>
			</td>
		</tr>
	</table>
	<hr>
	<h1 style="text-align: center"><a href="leopard/login">登入(家翔)</a></h1>
	<hr>
	<h1 style="text-align: center">MVC Exercise(士權)</h1>
	<table border="1" style="margin: 0px auto;">
		<tr height="52" bgcolor="lightblue" align="center">
			<td width="350"><p align="left" /> <a href="frank/admin">登入</a><br></td>
		</tr>
	</table>
	<hr>
<div>
</div>

</body>
</html>