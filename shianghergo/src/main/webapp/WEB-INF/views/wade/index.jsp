<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Cache-Control" content="no-cache">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" ></script>
<script src="http://static.runoob.com/assets/jquery-validation-1.14.0/lib/jquery.js"></script>
<script src="http://static.runoob.com/assets/jquery-validation-1.14.0/dist/jquery.validate.min.js"></script>
<script src="http://static.runoob.com/assets/jquery-validation-1.14.0/dist/localization/messages_zh.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" ></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" ></script>
<title>index</title>
</head>
<body>
<!-- <h5><a href="test">index</a></h5> -->
<!-- <h5><a href="test1">buytoday</a></h5> -->
<!-- <h5><a href="test2">commodity</a></h5> -->
<!-- <h5><a href="test3">detail</a></h5> -->
<!-- <h5><a href="test4">group</a></h5> -->
<!-- <h5><a href="test5">information</a></h5> -->
<!-- <h5><a href="test6">login</a></h5> -->
<h5><a href="cart">shopcart</a></h5>
<table border='1' style="border-collapse:collapse">
<tr>
<td style="padding:10px"><a href="productfile.s">商店下載訂購單</a></td>
<td style="padding:10px"><a href="showitem">商品列表</a></td>
</tr>
<tr>
<td style="padding:10px"><a href="cart">進購物車</a></td>
<td style="padding:10px"><a href="showgroups">團購列表</a></td>
</tr>
<tr>
<td style="padding:10px"> <a href="showmap">Google Map</a></td>
<td style="padding:10px"><a href="productfile.g">團下載訂購單</a></td>
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
<hr>
<jsp:include page="../top.jsp" />
<hr>
奕鴻
<form action='<c:url value="/Search.controller" />' method="get"  class="layui-form" novalidate>
            <input type="text" name="title" value="${param.title}" required  lay-verify="required" autocomplete="off" class="layui-input" placeholder="請輸入需要的商品" >
            <button class="layui-btn" lay-submit lay-filter="formDemo" type="submit">
                <i class="layui-icon layui-icon-search"></i>
            </button>
            <input type="submit" name="" value="">
          </form>

</body>
</html>