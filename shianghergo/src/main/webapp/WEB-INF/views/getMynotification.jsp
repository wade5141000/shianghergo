<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>系統通知訊息</title>
<style type="text/css">
.table1 {
	border: 1px solid #ddd;
	width: 900px;
}

thead {
	background-color: lightblue;
}
</style>
<script type="text/javascript">
	function confirmDelete() {
		var msg = "您真的確定要刪除嗎？\n\n請確認！";
		if (confirm(msg) == true) {
			return true;
		} else {
			return false;
		}
	}
</script>
</head>
<body >
<jsp:include page="eric/header.jsp" />
	<div  style="padding-bottom: 300px;">
	<jsp:include page="shianghergo/../BlackLine.jsp" />

	<div style="padding-left: 290px;padding-right: 30px;">
		<table class="table table-hover">
		<tr id='borderA'>
			<th id='borderA' colspan="7">我的系統通知</th>
		</tr>
		<tr id='borderA'>
<!-- 			<th scope="col" id='borderA'>通知信編號</th> -->
			<th scope="col" id='borderA'>標題</th>
			<th scope="col" id='borderA'>內容</th>
			<th scope="col" id='borderA'>通知時間</th>
			<th scope="col" id='borderA'>刪除系統通知</th>
		</tr>
<!-- 		 varStatus="i" -->
		<c:forEach var="annoti"  items="${getMyNotification}">
			<TR id='borderA'>
<%-- 			<TD id='borderA'  align="center">${annoti.id} </TD> --%>
			<TD id='borderA'>${annoti.title}</TD>
			<TD id='borderA'>${annoti.contents}</TD>
			<TD id='borderA'>${annoti.time}</TD>
			<TD id='borderA'><a  href="<c:url value='deletenotiByid?id=${annoti.id}' />">
				    <button type="button" onclick="return confirmDelete()" class="btn btn-primary btn-sm"><span >刪除</span> </button>
			    </a></TD>				
		</TR>
		</c:forEach>
	</TABLE>
	</div>
	</div>
	<jsp:include page="eric/foot.jsp" />
</body>
</html>