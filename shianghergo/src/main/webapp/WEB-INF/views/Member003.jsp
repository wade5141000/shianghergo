<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<!-- <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script> -->
<!-- <script -->
<!-- 	src="http://static.runoob.com/assets/jquery-validation-1.14.0/lib/jquery.js"></script> -->
<!-- <script -->
<!-- 	src="http://static.runoob.com/assets/jquery-validation-1.14.0/dist/jquery.validate.min.js"></script> -->
<!-- <script -->
<!-- 	src="http://static.runoob.com/assets/jquery-validation-1.14.0/dist/localization/messages_zh.js"></script> -->
<!-- <script -->
<!-- 	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script> -->
<!-- <script -->
<!-- 	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script> -->
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
<meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">
<head>
<script src="https://cdn.staticfile.org/jquery/3.2.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>我建立的合購</title>
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
<body>
<jsp:include page="eric/header.jsp" />
	<div  style="padding-bottom: 350px;">
		<jsp:include page="shianghergo/../BlackLine.jsp" />
		<div style="padding-left: 290px;padding-right: 30px;">
			<table class="table table-hover">
				<tr id='borderA' height='50'>
					<th id='borderA' align="center"colspan="8">由 ${loginOK.name}發起的合購團</th>
				</tr>
				<tr id='borderA' >
					<th scope="col" id='borderA'style="padding-right: 10px;padding-left: 10px;">合購編號</th>
					<th scope="col" id='borderA'>開始時間</th>
					<th scope="col" id='borderA'>截止時間</th>
					<th scope="col" id='borderA'>團名</th>
					<th scope="col" id='borderA'>簡介</th>
					<th scope="col" id='borderA'>付款方式</th>
					<th scope="col" id='borderA'>我的團員</th>
					<th scope="col" id='borderA'>商品明細</th>
				</tr>
				<c:forEach var="anGroupsBean" items="${MyGroupsList}">
					<TR id='borderA' >
						<TD id='borderA' align="center" >${anGroupsBean.id}</TD>
						<TD id='borderA' align="center">${anGroupsBean.start_time}</TD>
						<TD id='borderA' align="center">&nbsp;${anGroupsBean.end_time}</TD>
						<TD id='borderA' align="center">${anGroupsBean.name}</TD>
						<TD id='borderA' align="center" style="word-break:break-all">&nbsp;${anGroupsBean.detail}</TD>
						<c:if test="${anGroupsBean.payment==1}">
						<TD id='borderA' align="center">面交付款</TD>
						</c:if>
						<c:if test="${anGroupsBean.payment==2}">
						<TD id='borderA' align="center">銀行匯款</TD>
						</c:if>
						<c:if test="${anGroupsBean.payment==3}">
						<TD id='borderA' align="center">面交付款、銀行匯款</TD>
						</c:if>
						<TD id='borderA' align="center"><a
							href="<c:url value='getMyGroupsPerson?groups_id=${anGroupsBean.id}' />">
								<button type="button" class="btn btn-primary btn-sm">詳情</button> </a></TD>
					<TD id='borderA' align="center"><a
							href="<c:url value='/frank/showgroup(mb)?gid=${anGroupsBean.id}' />">
								 <button type="button" class="btn btn-primary btn-sm">詳情</button></a></TD>
					</TR>
				</c:forEach>

			</TABLE>
		</div>
	</div>
	
	<jsp:include page="eric/foot.jsp" />

</body>
</html>