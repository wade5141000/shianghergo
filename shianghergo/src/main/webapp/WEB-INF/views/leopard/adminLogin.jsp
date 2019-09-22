<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<style>
* {
	margin: 10px;
	padding: 5px;
	
}

.d {

margin-top: 150px;

}

fieldset{

width:400px;
height:400px;
margin-left: auto;
margin-right: auto;
margin-top: 205px;
border-radius: 99px;
border-color: green;

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
	 
	<form action="login.do" method="POST">
		<fieldset>
			<legend>登入</legend>
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