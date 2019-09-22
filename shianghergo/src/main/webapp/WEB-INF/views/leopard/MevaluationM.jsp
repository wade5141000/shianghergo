<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<form  action="evaluationMember2"  method="POST">

                            <!--使用者會員ID -->
		<input type=hidden value="${member_id}" name="member_id"> 
	                        <!--被評價的會員ID -->
		<input type=hidden value="${target}" name="target">
		

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

</body>
</html>