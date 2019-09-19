<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<ul>
<li> <a href="productfile.do">下載訂購單</a> </li>
<li> <a href="showitem">商品列表</a> </li>
<li> <a href="cart">進購物車</a> </li>
<li> <a href="showgroups">團購列表</a> </li>

</ul>
<form action="uploadimg" method="post" enctype="multipart/form-data">
	name:<input type = text name ="name"><br>
	age:<input type = text name ="age"><br>
	address:<input type = text name ="address"><br>
	category:<input type = text name ="category"><br>
	file:<input type ="file" name = "image" ><br>
	<input type = "submit" value="送出" >
</form>
<img src="showimg" style="width:80px;height:80">
</body>
</html>