<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    
</head>
<style>
.s1{
width:100px;
}
</style>

<body>

	<form  action="evaluationitem2"  method="POST">

                            <!--使用者會員ID -->
		<input type=hidden value="${member_id}" name="member_id"> 
	                        <!--被評價的商家ID -->
		<input type=hidden value="${item_id}" name="item_id">
		

		<select name="score">
			<option value="1">一顆星</option>
			<option value="2">兩顆星</option>
		    <option value="3">三顆星</option>
			<option value="4">四顆星</option>
		    <option value="5">五顆星</option>
		</select> 
		<hr>
		<textarea name="contents" rows="5" cols="45"></textarea>
		<hr>
		<input type="submit" value="確定檢舉"> 
		<input type="reset"  value="清除">

	</form>

                <img src="${pageContext.request.contextPath}/resources/images/star.gif"  id="star1" class="s1">
                <img src="${pageContext.request.contextPath}/resources/images/star.gif"  id="star2" class="s1">
                <img src="${pageContext.request.contextPath}/resources/images/star.gif"  id="star3" class="s1">
                <img src="${pageContext.request.contextPath}/resources/images/star.gif"  id="star4" class="s1">
                <img src="${pageContext.request.contextPath}/resources/images/star.gif"  id="star5" class="s1">

                 <div>
                    <span class="c1" id="str">打分數中...</span>
                </div>




</body>
</html>