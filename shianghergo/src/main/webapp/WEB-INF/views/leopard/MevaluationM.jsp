<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css">


<script>
	let flag = true;

	document.addEventListener("DOMContentLoaded", function() {

		let stars = document.querySelectorAll("img.s1");

		let starsLength = stars.length;

		for (let i = 0; i < starsLength; i++) {

			stars[i].addEventListener("mouseover", mouseOver);
			stars[i].addEventListener("mouseout", mouseOut);
			stars[i].addEventListener("click", Click);
		}

	});

	function mouseOver() {

		let n = this.id.charAt(4);

		flag = true;

		if (flag == true) {
			for (let i = 0; i < n; i++) {

				document.images[i - 1 + 7].src = '${pageContext.request.contextPath}/resources/images/chngstar.gif'

			}

		}

	}
	function mouseOut() {

		if (flag) {

			for (let i = 0; i < 5; i++) {

				document.images[i - 1 + 7].src = "${pageContext.request.contextPath}/resources/images/star.gif"

			}
		}
	}

	function Click() {

		flag = false;

		let n = this.id.charAt(4);

		for (let i = 0; i < n; i++) {

			document.images[i - 1 + 7].src = "${pageContext.request.contextPath}/resources/images/chngstar.gif"
			document.getElementById("str").innerHTML = "是否要給"+(i + 1)+"分";
			document.getElementById("score").value = i + 1;
		}

	}
</script>

<style>
* {
	font-family: 微軟正黑體;

}

body{

border:3px solid;

}



.a{

border:1px solid;
width:100%;


}

.b{

border:1px solid;
width:100%;
margin-left:10px;
display: block;
}


.c1{
width:300px;

}

.content{

width:3px solid;


}




</style>

</head>
<body>

	<div class="alert alert-success" role="alert">我是上方導覽列</div>
		<div class="content">
		<div class="a">
			<img class="c1"
				src="${pageContext.request.contextPath}/resources/images/777.jpg">
			<img class="c1"
				src="${pageContext.request.contextPath}/resources/images/888.jpg">

	  <div class="b">
	  <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
			人氣排行

				1.干貝 <img class="c1"
					src="${pageContext.request.contextPath}/resources/images/111.jpg">
				

				2.酥炸花枝圈 <img class="c1"
					src="${pageContext.request.contextPath}/resources/images/222.jpg">
				

				3.懷舊排骨<img class="c1"
					src="${pageContext.request.contextPath}/resources/images/333.jpg">
				
				4.酥脆麥克雞塊<img class="c1"
					src="${pageContext.request.contextPath}/resources/images/444.jpg">
	 </div>
	
	  </div>
	  
	  
	    </div>
	  
	  
	  
  
	
	
	
	
	
		


	<div class="content">

			<form action="evaluationMember2" method="POST">

		<!--使用者會員ID -->
		<input type=hidden value="${member_id}" name="member_id">
		<!--被評價的會員ID -->
		<input type=hidden value="${target}" name="target">




			<div class="alert alert-success" role="alert">評分</div>



			<img
				src="${pageContext.request.contextPath}/resources/images/star.gif"
				id="star1" class="s1"> <img
				src="${pageContext.request.contextPath}/resources/images/star.gif"
				id="star2" class="s1"> <img
				src="${pageContext.request.contextPath}/resources/images/star.gif"
				id="star3" class="s1"> <img
				src="${pageContext.request.contextPath}/resources/images/star.gif"
				id="star4" class="s1"> <img
				src="${pageContext.request.contextPath}/resources/images/star.gif"
				id="star5" class="s1">
		<div> 
				<span class="c1" id="str"></span>
			</div>
			<hr>
			<div class="alert alert-success" role="alert">給予評語</div>
			<input type=hidden value="1" name="score" id="score">
			<textarea name="contents" rows="5" cols="45"></textarea>
			<hr>

			<button type="submit" class="btn btn-success">送出評分</button>

		</form>
	</div>

</body>
</html>