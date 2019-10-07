<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
<meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">
<head>
<style type="text/css">
.table {
	margin: auto;
	/*   margin-left: auto; */
	padding-right: 15px;
	padding-left: 15px;
	width: 100%;
	max-width: 1140px;
	/*   // 隨螢幕尺寸而變，當螢幕尺寸 ≥ 1200px 時是 1140px。 */
}
body {
	margin: 0px;
	padding: 0px;
	background: #fff url('images/bbg06.png') center center fixed ;　
}
</style>
</head>
<body>
<jsp:include page="eric/header.jsp" />
<jsp:include page="shianghergo/../BlackLine.jsp" />
<div>
	<div  style="padding-top: 10px;padding-left: 250px;">
		<!-- 内容主体区域 -->
		<form id="saveForm" action="updateMember.do" method="post"  enctype="multipart/form-data">
			<input type="hidden" name="id" value="${Member.id}" /> <input
				type="hidden" name="account" value="${Member.account}" />
			<table  class="table table-hover"style="font-size:16px;">
				<tr>
					<td>姓名：</td>
					<td><input type="text" value="${Member.name }" name="name" class="form-control" /></td>
				</tr>
				<tr>
					<td>密碼：</td>
					<td><input type="text" value="${Member.password }"
						name="password" class="form-control" /></td>
				</tr>
				<tr>
				<tr>
					<td>手機：</td>
					<td><input type="text" value="${Member.phone }" name="phone" class="form-control" /></td>
				</tr>
				<tr>
					<td>Email：</td>
					<td><input type="text" value="${Member.email }" name="email" class="form-control" /></td>
				</tr>
				<tr>
					<td>生日：</td>
					<td><input type="text" value="${Member.birthday }"
						name="birthday" class="form-control" /></td>
				</tr>
				<tr>
					<td>地址：</td>
					<td><input type="text" value="${Member.address }"
						name="address" class="form-control" /></td>
				</tr>
				<tr>
					<td>更換大頭照：</td>
					<td><input type="file" 
						name="image" class="" /></td>
				</tr>
			</table>
				<div >
					<div   style="padding-top: 20px;padding-left: 600px;">
					<input type="submit" value="更新" class="btn btn-success"/> 
					<a href="javascript:history.go(-1)" class="btn btn-danger">取消 </a>
				</div>
				</div>
		</form>
	</div>
	</div>
	<jsp:include page="eric/foot.jsp" />
	<script src="//cdn.bootcss.com/canvas-nest.js/1.0.1/canvas-nest.min.js"></script>
</body>
</body>
</html>
