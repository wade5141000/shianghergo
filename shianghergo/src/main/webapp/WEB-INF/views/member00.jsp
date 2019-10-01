<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script
	src="http://static.runoob.com/assets/jquery-validation-1.14.0/lib/jquery.js"></script>
<script
	src="http://static.runoob.com/assets/jquery-validation-1.14.0/dist/jquery.validate.min.js"></script>
<script
	src="http://static.runoob.com/assets/jquery-validation-1.14.0/dist/localization/messages_zh.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
<meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">
<head>
<style type="text/css">
.container {
	margin: auto;
	/*   margin-left: auto; */
	padding-right: 15px;
	padding-left: 15px;
	width: 100%;
	max-width: 1140px;
	/*   // 隨螢幕尺寸而變，當螢幕尺寸 ≥ 1200px 時是 1140px。 */
}
</style>
</head>
<body>
<jsp:include page="eric/header.jsp" />
<jsp:include page="shianghergo/../BlackLine.jsp" />
<div  style="padding-bottom: 500px;">
	<div  style="padding-top: 190px;padding-left: 500px;">
		<!-- 内容主体区域 -->
		<form id="saveForm" action="updateMember.do" method="post" class="layui-form"  enctype="multipart/form-data">
			<input type="hidden" name="id" value="${Member.id}" /> <input
				type="hidden" name="account" value="${Member.account}" />
			<table  class="table table-hover"style="font-size: :16px">
				<tr>
					<td>姓名：</td>
					<td><input type="text" value="${Member.name }" name="name" class="layui-input" /></td>
				</tr>
				<tr>
					<td>密碼：</td>
					<td><input type="text" value="${Member.password }"
						name="password" class="layui-input" /></td>
				</tr>
				<tr>
				<tr>
					<td>手機：</td>
					<td><input type="text" value="${Member.phone }" name="phone" class="layui-input" /></td>
				</tr>
				<tr>
					<td>Email：</td>
					<td><input type="text" value="${Member.email }" name="email" class="layui-input" /></td>
				</tr>
				<tr>
					<td>生日：</td>
					<td><input type="text" value="${Member.birthday }"
						name="birthday" class="layui-input" /></td>
				</tr>
				<tr>
					<td>地址：</td>
					<td><input type="text" value="${Member.address }"
						name="address" class="layui-input" /></td>
				</tr>
				<tr>
					<td>更換大頭照：</td>
					<td><input type="file" 
						name="image" class="layui-input" /></td>
				</tr>
			</table>
				<div class="layui-btn-group">
					<div align="right" class="layui-btn-group" style="padding-left: 50px;padding-top: 20px;">
					<input type="submit" value="更新" class="layui-btn"/> 
					<a href="javascript:history.go(-1)" class="layui-btn">取消 </a>
				</div>
				</div>
		</form>
	</div>
	</div>
	<jsp:include page="eric/foot.jsp" />
</body>
</body>
</html>
