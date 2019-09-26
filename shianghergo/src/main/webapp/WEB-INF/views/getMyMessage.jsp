<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" ></script>
<script src="http://static.runoob.com/assets/jquery-validation-1.14.0/lib/jquery.js"></script>
<script src="http://static.runoob.com/assets/jquery-validation-1.14.0/dist/jquery.validate.min.js"></script>
<script src="http://static.runoob.com/assets/jquery-validation-1.14.0/dist/localization/messages_zh.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" ></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" ></script>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/res/static/css/main.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/res/layui/css/layui.css">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/res/layui/layui.js"></script>
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
<meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">
<head>
<script src="https://cdn.staticfile.org/jquery/3.2.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>我的留言</title>
<style type="text/css">
.table1 {
	border: 1px solid #ddd;
	width: 900px;
}

thead {
	background-color: lightblue;
}
</style>
</head>
<body >
	<table class="layui-table">

		<tr id='borderA' height='50' >
			<th id='borderA'  align="center">誰給我的留言</th>
		</tr>
		<tr id='borderA' height='36' >
			<th id='borderA'>留言編號</th>
			<th id='borderA'>誰留言給我</th>
			<th id='borderA'>標題</th>
			<th id='borderA'>內容	</th>
			<th id='borderA'>時間</th>
		</tr>							  
		<c:forEach var="gMyMesg"  items="${getMyMessage}">
			<TR id='borderA' height='30'>
			<TD id='borderA'  align="center">&nbsp;${gMyMesg.id}</TD>
			<TD id='borderA'  align="center">
			    <a  href="<c:url value='sendMemberMessage?target=${gMyMesg.memberBean.id}' />">
				    ${gMyMesg.memberBean.name}
			    </a>
			</TD>
			<TD id='borderA'  align="center">${gMyMesg.title}</TD>
			<TD id='borderA'  align="center">&nbsp;${gMyMesg.contents}</TD>
			<TD id='borderA'  align="center">${gMyMesg.time}</TD>				
		</TR>
		</c:forEach>
		
	</TABLE>

</body>
</html>