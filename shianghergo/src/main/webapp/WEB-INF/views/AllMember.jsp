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
<title>全部會員列表</title>
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
			<th id='borderA'  align="center">會員列表(留言板)</th>
		</tr>
		<tr id='borderA' height='36' >
			<th id='borderA'>會員id</th>
			<th id='borderA'>帳號</th>
			<th id='borderA'>電話</th>
			<th id='borderA'>email</th>
			<th id='borderA'>地址</th>
		</tr>
		<c:forEach var="Allm"  items="${AllMemberList}">
			<TR id='borderA' height='30'>
			<TD id='borderA'  align="center">
			    <a  href="<c:url value='sendMemberMessage?target=${Allm.id}' />">
				    ${Allm.id}
			    </a>
			</TD>
			<TD id='borderA'  align="center">${Allm.account}</TD>
			<TD id='borderA'  align="center">&nbsp;${Allm.phone}</TD>
			<TD id='borderA'  align="center">${Allm.email}</TD>
			<TD id='borderA'  align="center">${Allm.address}</TD>				
		</TR>
		</c:forEach>
		
	</TABLE>

</body>
</html>