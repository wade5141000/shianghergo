<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member</title>

<body>
	<section>
		<div>

			<div>
				<h1>團主資料</h1>
	
			</div>
		</div>

	</section>
	<section>

	<div>
		<p>團主:${member.name}</p>
		<p>信箱:${member.email}</p>
		<p>電話:${member.phone}</p>
	
	</div>
	</section>
	
	

</body>
</html>