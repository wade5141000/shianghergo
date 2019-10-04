<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<!-- <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" ></script> -->
<!-- <script src="http://static.runoob.com/assets/jquery-validation-1.14.0/lib/jquery.js"></script> -->
<!-- <script src="http://static.runoob.com/assets/jquery-validation-1.14.0/dist/jquery.validate.min.js"></script> -->
<!-- <script src="http://static.runoob.com/assets/jquery-validation-1.14.0/dist/localization/messages_zh.js"></script> -->
<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" ></script> -->
<!-- <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" ></script> -->
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
<jsp:include page="eric/header.jsp" />
		<div style="padding-bottom: 500px;">
			<jsp:include page="shianghergo/../BlackLine.jsp" />
	<div style="padding-left: 290px;padding-right: 30px;">
	<table class="table table-hover">
		<tr id='borderA'>
			<th id='borderA' >我的留言(寄件備份)</th>
		</tr>
		<tr id='borderA' >
<!-- 			<th scope="col" id='borderA'>留言編號</th> -->
<!-- 			<th scope="col" id='borderA'>留言者</th> -->
			<th scope="col" id='borderA'>標題</th>
			<th scope="col" id='borderA'>收件人</th>
			<th scope="col" id='borderA'>內容	</th>
			<th scope="col" id='borderA'>時間</th>
		</tr>
		<c:forEach var="MyMesg"  items="${MyMessage}">
			<TR id='borderA' >
<%-- 			<TD id='borderA' >&nbsp;${MyMesg.id}</TD> --%>
<!-- 			<TD id='borderA' > -->
<%-- 			    <a  href="<c:url value='sendMemberMessage?target=${MyMesg.memberBean.id}' />"> --%>
<%-- 				    ${MyMesg.memberBean.id} --%>
<!-- 			    </a> -->
<!-- 			</TD> -->
			<TD id='borderA' >${MyMesg.title}</TD>
			<TD id='borderA' >${MyMesg.target.memberBean.name}</TD>
			<TD id='borderA' >&nbsp;${MyMesg.contents}</TD>
			<TD id='borderA' >${MyMesg.time}</TD>			
		</TR>
		</c:forEach>
	</TABLE>
</div>
</div>
<jsp:include page="eric/foot.jsp" />
</body>
</html>