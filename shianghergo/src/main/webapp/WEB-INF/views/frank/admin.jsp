<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<style>
* {
	margin: 10px;
	padding: 5px;
	background: silver;
}

.d {
	margin-left: auto;
	margin-right: auto;
	margin-top: 50px;
	width: 350px;
	height: 200px;
}

fieldset{

width:500px;
height:600px;
margin-left: auto;
margin-right: auto;
}

img{
width:250px;
margin-left: 105px;

}

</style>

<meta charset="UTF-8">
<title>管理員登入</title>
</head>
<body>
	 
	<form action="login" method="POST">
		<fieldset>
            <img alt="照片出現異常" src="resource/images/admin.png">
			<legend>管理員登入</legend>
			<div class="d">
				<label>帳號 </label> 
				<input type="text" name="account" /><br> 
				<label>密碼</label>
				<input type="password" name="password" /><br> 
				<input type="submit" value="登入"> 
				<input type="reset" value="清除">
			</div>
		</fieldset>
	</form>






</body>
</html>