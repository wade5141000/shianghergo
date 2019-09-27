<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css">
</head>
<style>
.content{

width:550px;
margin-left:32%;

}

.report{
border-radius:10px;
margin-top: 70px;
background-color: buttonhighlight;
}

.a{

float: left;
width: 20%;
height:70%;

}

.b{

float: right;
width: 20%;
height:70%;

}

.c1{

width:70px;



}


</style>

<body>

	<div class="alert alert-success" role="alert">我是上方導覽列</div>
     
     <div class="a"> 
         
          <img class="c1"
				src="${pageContext.request.contextPath}/resources/images/777.jpg">
			<img class="c1"
				src="${pageContext.request.contextPath}/resources/images/888.jpg">
         
     </div>
     <div class="b"> 我是人氣排行</div>
   

     

	<div class="content">	
	<div class="title">檢舉會員</div>
		<div class="alert alert-warning" role="alert">	您要檢舉的會員ID:${target}</div>
		
		<form action="SaveRM" method="POST" >
			<div class="alert alert-info" role="alert">
				檢舉類別: <select name="category" class="select">
					<c:forEach var='items' items='${list}'>
						<option value="${items.id}">${items.name}</option>
					</c:forEach>
				</select>
			</div>
			<hr>
			<div class="alert alert-success" role="alert">

				檢舉內容:
				<textarea name="contents" rows="5" cols="45"></textarea>
				<hr>
				<input type=hidden value="${target}" name="target">

				<button type="submit" class="btn btn-danger">確認檢舉</button>
				<button type="reset" class="btn btn-success">清除</button>


			</div>
		</form>
	</div>
	
		<div class="alert alert-success" role="alert" style="margin-top: 35% ">
		  <h4>檢舉會員注意事項</h4><hr>
          <p>1.如果您發現有響合購會員涉嫌侵害您的智慧財產權，可以經由智慧財產權保護傘方案 ，提出侵權通知</p><br>
           <p>2.如果您在交易過程中認為某會員誠信不佳，可以善用會員評價功能提出評價；如果您發現有會員已經涉嫌詐欺、或者正企圖進行詐欺，您可以經由詐欺檢舉辦法提出檢舉。</p><br>
           <p>3.如果您發現有響合購會員涉及違反露天拍賣網站政策或法令禁止限制規範項目，可以填妥檢舉表格，向我們提出檢舉。 </p>
	      </div>
</body>
</html>