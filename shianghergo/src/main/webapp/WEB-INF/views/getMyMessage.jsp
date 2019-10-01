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
<jsp:include page="eric/header.jsp" />	
		<div class="main-nav" style="padding-bottom: 500px;">
			<ul class="layui-nav " lay-filter="" id="top">
				<li class="layui-nav-item"><a href="Member002"><i
						class="layui-icon layui-icon-star"></i>我購買的商品</a></li>
				<li class="layui-nav-item "><a href="Member003"><i
						class="layui-icon layui-icon-star"></i>我建立的合購</a></li>
				<li class="layui-nav-item "><a href="Member004"><i
						class="layui-icon layui-icon-star"></i>我參與的合購</a></li>
				<li class="layui-nav-item layui-this"><a href="getMyMessage"><i
						class="layui-icon layui-icon-star"></i>我的留言板</a></li>
				<!-- 			<li class="layui-nav-item"><a href="goRegisterPage">加入會員</a></li> -->
				<li class="layui-nav-item "><a href="MyMessage"><i
						class="layui-icon layui-icon-star"></i>寄件備份</a></li>
				<li class="layui-nav-item "><a href="Member001"> <img
						src="<c:url value='getmemberPicture/${loginOK.id}'/>"
						class="layui-nav-img">${loginOK.name}
				</a></li>
				<li class="layui-nav-item"><a href="logout"><i
						class="layui-icon layui-icon-star"></i>登出</a></li>
			</ul>
<div style="padding-left: 350px; padding-right: 350px;">
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
				    ${gMyMesg.memberBean.name}&nbsp;<button type="button" class="layui-btn layui-btn-sm layui-btn-radius layui-btn-danger"><i class="layui-icon layui-icon-dialogue"></i> </button>
			    </a>
			</TD>
			<TD id='borderA'  align="center">${gMyMesg.title}</TD>
			<TD id='borderA'  align="center" >&nbsp;${gMyMesg.contents}</TD>
			<TD id='borderA'  align="center">${gMyMesg.time}</TD>				
		</TR>
		</c:forEach>
		
	</TABLE>
</div>
</div>
<jsp:include page="eric/foot.jsp" />
</body>
<script type="text/javascript">
	//注意：导航 依赖 element 模块，否则无法进行功能性操作
	layui.use('element', function() {
		var element = layui.element(); //导航的hover效果、二级菜单等功能，需要依赖element模块
	});
</script>
</html>