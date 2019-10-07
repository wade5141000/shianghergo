<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
<head>
<!-- <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"> -->
<!-- <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script> -->
<!-- <script -->
<!-- 	src="http://static.runoob.com/assets/jquery-validation-1.14.0/lib/jquery.js"></script> -->
<!-- <script -->
<!-- 	src="http://static.runoob.com/assets/jquery-validation-1.14.0/dist/jquery.validate.min.js"></script> -->
<!-- <script -->
<!-- 	src="http://static.runoob.com/assets/jquery-validation-1.14.0/dist/localization/messages_zh.js"></script> -->
<!-- <script -->
<!-- 	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script> -->
<!-- <script -->
<!-- 	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script> -->
<!-- <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> -->
<title>登入</title>
<!-- <meta name="viewport" -->
<!-- 	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0"> -->
<!-- <meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1"> -->
<style>
body {
	margin: 0px;
	padding: 0px;
	background: #fff url('images/rebg10.jpg') center center fixed no-repeat;
	　 background-size: 100%;
	　
}

fieldset {
	width: 750px;
	border: 1px solid gray;
	margin-left: auto;
	margin-right: auto;
	width: 50%;
	background-color: white;
	text-align: left;
	padding: 10px;
	font-family:微軟正黑體;
	border-radius: 5px;
    border-spacing: 0;
}

legend {
	margin: auto;
}

.item {
	height: 46px;
	line-height: 26px;
	margin: 10px;
}

.item .item-label {
	float: left;
	width: 100px;
	text-align: right;
}

.item-text {
	float: left;
	width: 300px;
	height: 26px;
	padding: 9px 25px 9px 5px;
	margin-left: 10px;
	border: 1px solid #ccc;
	overflow: hidden;
}

.item-select {
	float: left;
	height: 34px;
	border: 1px solid #ccc;
	margin-left: 10px;
	font-size: 14px;
	padding: 6px 0px;
}

.item-submit {
	margin-left: 88px;
}

input.error {
	border: 1px solid #E6594E;
}

input.highlight {
	border: 1px solid #7abd54;
}


/* label.error, label.tip { */
/* 	float: left; */
/* 	height: 32px; */
/* 	line-height: 32px; */
/* 	font-size: 14px; */
/* 	text-align: left; */
/* 	margin-left: 5px; */
/* 	padding-left: 20px; */
/* 	color: red; */
/* 	background: url('error.png') no-repeat left center; */
/* } */

/* label.tip { */
/* 	color: #aaa; */
/* 	background: url('tip.png') no-repeat left center; */
/* } */

/* label.valid { */
/* 	background: url('valid.png') no-repeat left center; */
/* 	width: 32px; */
/* } */


</style>
</head>
<body>
	<jsp:include page="eric/header.jsp" />
	<div class="container" style="height: 750; margin-left: 500px;">
		<form role="form" action="login.do" method="post" style="padding-top: 150px" >
			<fieldset >
				<h1 align="center" style="padding-top: 50px">饗合購會員登入</h1>
				<div class="form-group col-lg-5"align="center"style="padding-left: 15px;padding-right: 15px;left: 150px;">
					<label for="account"><img  src="<c:url value='/images/line07.png' />" alt="..." >&nbsp;帳號</label> <input type="text"
						class="form-control" id="account" name="account" placeholder="請輸入帳號">
				</div>
				<div class="form-group col-lg-5"align="center"style="padding-left: 15px;padding-right: 15px;left: 150px;">
					<label for="password"><img  src="<c:url value='/images/line06.png' />" alt="..." >&nbsp;密碼</label> <input type="password"
						class="form-control" id="password" name="password" placeholder="請輸入密碼">
				</div>
				<div style="padding-left: 170px;padding-top: 50px;padding-bottom:50px">
				<button type="submit" class="btn btn-primary btn-sm">提交</button>
				<button type="reset" class="btn btn-primary btn-sm">重置</button>
				<a href="goRegisterPage" class="btn btn-primary btn-sm">加入會員</a>
				</div>
			</fieldset>
		</form>
	</div>
	<jsp:include page="eric/foot.jsp" 	/>

</body>

</html>