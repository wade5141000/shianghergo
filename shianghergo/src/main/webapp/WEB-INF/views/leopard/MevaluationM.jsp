<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css">

<style>
* {
	font-family: 微軟正黑體;


}

.content {
	width: 600px;
	margin-left: auto;
	margin-right: auto;
}

.a {
	float: left;
	width: 300px;
	height: 500px;
    margin-left: 50px;

}

.b {
	border: 3px ridge;
	border-radius: 10px;
	width: 300px;
	height: 550px;
	float: right;
	padding: 15px;
	font-size: 20px;
	font-weight: 20px;
margin-right: 50px;
}

.c1 {
	padding: 10px;
	width: 300px;
}

.i1 {
	width: 80px;
}
</style>

</head>
<body>



	<div class="alert alert-success" role="alert">我是上方導覽列</div>
	<div class="a">

		<img class="c1"
			src="${pageContext.request.contextPath}/resources/images/777.jpg">
		<img class="c1"
			src="${pageContext.request.contextPath}/resources/images/888.jpg">
	</div>

	<div class="b">
		<div class="alert alert-danger" role="alert">
			<span class="glyphicon glyphicon-search" aria-hidden="true"></span>
			人氣排行
		</div>




		1.干貝 <img class="i1"
			src="${pageContext.request.contextPath}/resources/images/111.jpg">
		<hr>

		2.酥炸花枝圈 <img class="i1"
			src="${pageContext.request.contextPath}/resources/images/222.jpg">
		<hr>

		3.懷舊排骨<img class="i1"
			src="${pageContext.request.contextPath}/resources/images/333.jpg">
		<hr>
		4.酥脆麥克雞塊<img class="i1"
			src="${pageContext.request.contextPath}/resources/images/444.jpg">
		<hr>



	</div>

	<div class="content">

		<form action="evaluationMember2" method="POST">

			<!--使用者會員ID -->
			<input type=hidden value="${member_id}" name="member_id">
			<!--被評價的會員ID -->
			<input type=hidden value="${target}" name="target">

		<div>
			<img class="c1"
				src="${pageContext.request.contextPath}/resources/images/555.png">要幫我評五顆星唷!
	
	                                
	<img class="i1"
				src="${pageContext.request.contextPath}/resources/images/chngstar.gif">
	   </div>
	
	
	
	
	<div class="alert alert-success" role="alert">評分</div>
	<select name="score">
		<option value="1">一顆星</option>
		<option value="2">兩顆星</option>
		<option value="3">三顆星</option>
		<option value="4">四顆星</option>
		<option value="5">五顆星</option>
	</select>

	<hr>
	<div class="alert alert-success" role="alert">給予評語</div>

	<textarea name="contents" rows="5" cols="45"></textarea>
	<hr>

	<button type="submit" class="btn btn-success">送出評分</button>

	</form>
	</div>

</body>
</html>