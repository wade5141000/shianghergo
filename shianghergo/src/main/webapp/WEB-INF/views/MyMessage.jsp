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
	<table class="table table-hover">

		<tr id='borderA' height='50' >
			<th id='borderA'  align="center">我的留言</th>
		</tr>
		<tr id='borderA' height='36' >
			<th id='borderA'>留言編號</th>
			<th id='borderA'>留言者</th>
			<th id='borderA'>標題</th>
			<th id='borderA'>內容	</th>
			<th id='borderA'>時間</th>
		</tr>
		<c:forEach var="MyMesg"  items="${MyMessage}">
			<TR id='borderA' height='30'>
			<TD id='borderA'  align="center">&nbsp;${MyMesg.id}</TD>
			<TD id='borderA'  align="left">
			    <a  href="<c:url value='sendMemberMessage?target=${MyMesg.member_id}' />">
				    ${MyMesg.member_id}
			    </a>
			</TD>
			<TD id='borderA'  align="center">${MyMesg.title}</TD>
			<TD id='borderA'  align="center">&nbsp;${MyMesg.contents}</TD>
			<TD id='borderA'  align="center">${MyMesg.time}</TD>				
		</TR>
		</c:forEach>
		
	</TABLE>

</body>
</html>