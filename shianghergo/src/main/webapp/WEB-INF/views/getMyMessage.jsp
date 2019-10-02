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
<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
<script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
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
<div style="padding-left: 350px; padding-right: 350px;">
	<table class="table table-hover">
		<tr id='borderA'  >
			<th id='borderA'>誰給我的留言</th>
		</tr>
		<tr id='borderA'  >
			<th scope="col" id='borderA'>留言編號</th>
			<th scope="col" id='borderA'>誰留言給我</th>
			<th scope="col" id='borderA'>標題</th>
			<th scope="col" id='borderA'>內容	</th>
			<th scope="col" id='borderA'>時間</th>
			<th scope="col" id='borderA'>刪除留言</th>
		</tr>							  
		<c:forEach var="gMyMesg"  items="${getMyMessage}">
			<TR id='borderA' >
			<TD id='borderA'  >&nbsp;${gMyMesg.id}</TD>
			<TD id='borderA'  >
			    <a  href="<c:url value='sendMemberMessage?target=${gMyMesg.memberBean.id}' />">
				    ${gMyMesg.memberBean.name}&nbsp;<button type="button" class="btn btn-primary btn-sm"><span >✉</span> </button>
			    </a>
			</TD>
			<TD id='borderA' >${gMyMesg.title}</TD>
			<TD id='borderA' >&nbsp;${gMyMesg.contents}</TD>
			<TD id='borderA' >${gMyMesg.time}</TD>
			<TD id='borderA'><a  href="<c:url value='deleteMesgByid?id=${gMyMesg.id}' />">
				    <button type="button" class="btn btn-primary btn-sm"><span >刪除</span> </button>
			    </a></TD>				
		</TR>
		</c:forEach>
		
	</TABLE>
</div>
</div>
<jsp:include page="eric/foot.jsp" />
</body>
</html>