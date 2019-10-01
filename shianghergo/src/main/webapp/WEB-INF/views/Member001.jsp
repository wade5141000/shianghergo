<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<style type="text/css">
.table1 {
	border: 1px solid #ddd;
	width: 700px;
}

thead {
	background-color: lightblue;
}
.layui-table td, .layui-table th {
	position: relative;
	padding: 5px 20px;
	min-height: 15px;
	line-height: 15px;
	font-size: 20px;
}
.img {
    width: 350;
    height: 250;
}

</style>
</head>
<body>
<jsp:include page="eric/header.jsp" />
		<div class="main-nav" style="padding-bottom: 500px;">
			<ul class="layui-nav " lay-filter="" id="top">
				<li class="layui-nav-item"><a href="Member002"><i
						class="layui-icon layui-icon-star"></i>我購買的商品</a></li>
				<li class="layui-nav-item "><a href="Member003"><i
						class="layui-icon layui-icon-star"></i>我建立的合購</a></li>
				<li class="layui-nav-item "><a href="Member004"><i
						class="layui-icon layui-icon-star"></i>我參與的合購</a></li>
				<li class="layui-nav-item "><a href="getMyMessage"><i
						class="layui-icon layui-icon-star"></i>我的留言板</a></li>
				<!-- 			<li class="layui-nav-item"><a href="goRegisterPage">加入會員</a></li> -->
				<li class="layui-nav-item "><a href="MyMessage"><i
						class="layui-icon layui-icon-star"></i>寄件備份</a></li>
				<li class="layui-nav-item layui-this"><a href="Member001"> <img
						src="<c:url value='getmemberPicture/${loginOK.id}'/>"
						class="layui-nav-img">${loginOK.name}
				</a></li>
				<li class="layui-nav-item"><a href="logout"><i
						class="layui-icon layui-icon-star"></i>登出</a></li>
				<li class="layui-nav-item "><a href="hao/buildStore"><i
						class="layui-icon layui-icon-star"></i>我要開店</a></li>
				<li class="layui-nav-item "><a href="hao/products/add"><i
						class="layui-icon layui-icon-star"></i>我要上架商品</a></li>
			</ul>
<div style="padding-left: 400px; padding-right: 400px;padding-top: 50px;">
	<input type="hidden" name="id" value="${loginOK.id}" />
	<table border="1" class="layui-table">
		<tbody>
			<tr>
				<td rowspan="10" align="center"><img  class="img" width="700" height="150" alt="" src="<c:url value='getmemberPicture/${loginOK.id}'/>"/></td>
			
			</tr>
			
			<tr>
				<td >帳號</td>
				<td align="center">${loginOK.account}</td>
			</tr>
			<tr>
				<td >密碼</td>
				<td align="center">${loginOK.password}</td>
			</tr>
			<tr>
				<td >姓名</td>
				<td align="center">${loginOK.name}</td>
			</tr>
			<tr>
				<td >手機</td>
				<td align="center">${loginOK.phone}</td>
			</tr>
			<tr>
				<td >Email</td>
				<td align="center">${loginOK.email}</td>
			</tr>
			<tr>
				<td >生日</td>
				<td align="center">${loginOK.birthday}</td>
			</tr>
			<tr>
				<td >地址</td>
				<td align="center">${loginOK.address}</td>
			</tr>
			<tr>
				<td >修改</td>
				<td align="center">
				<a href="Practice/../doupdate?account=${loginOK.account}"><img
						src="images/01.jpg" width="30"></a></td>
			</tr>
		</tbody>
	</table>
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
