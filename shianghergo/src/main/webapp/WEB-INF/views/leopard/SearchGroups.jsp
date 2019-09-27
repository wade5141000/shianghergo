<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


<form action="showGroups" method="POST">

<select name="sort">

<option value="1">商品</option>
<option value="2">團購商品</option>

</select>

<input type="text" name="name">
<input type="submit" value="查詢"> 

</form>



</body>
</html>