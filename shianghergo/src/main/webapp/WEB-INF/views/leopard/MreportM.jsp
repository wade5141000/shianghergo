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
* {
	font-family: 微軟正黑體;
}

.content {
	width: 800px;
	height: 500px;
	margin-left: auto;
	margin-right: auto;
	padding: 100px;

}

.a{
float:left;
border:3px solid;
width:300px;
height:500px;
}

.b{
float:right;
border:3px solid;
width:300px;
height:500px;

}

</style>

<body>



	<div class="alert alert-success" role="alert">我是上方導覽列</div>
    <div class="a">放廣告</div>

     <div class="b">放人氣排行</div>


	<div class="content">
		
		<div class="alert alert-warning" role="alert">檢舉會員</div>

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
	
</body>
		<div class="alert alert-warning" role="alert">
		  檢舉會員注意事項<ul>
           <li>如果您發現有響合購會員涉嫌侵害您的智慧財產權，可以經由智慧財產權保護傘方案 ，提出侵權通知</li>
           <li>如果您在交易過程中認為某會員誠信不佳，可以善用會員評價功能提出評價；如果您發現有會員已經涉嫌詐欺、或者正企圖進行詐欺，您可以經由詐欺檢舉辦法提出檢舉。</li>
           <li>如果您發現有響合購會員涉及違反露天拍賣網站政策或法令禁止限制規範項目，可以填妥檢舉表格，向我們提出檢舉。</li>
	      </ul>
	      </div>
</html>