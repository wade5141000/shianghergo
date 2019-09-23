<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" ></script>
<script src="http://static.runoob.com/assets/jquery-validation-1.14.0/lib/jquery.js"></script>
<script src="http://static.runoob.com/assets/jquery-validation-1.14.0/dist/jquery.validate.min.js"></script>
<script src="http://static.runoob.com/assets/jquery-validation-1.14.0/dist/localization/messages_zh.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" ></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" ></script>
<head></head>
<body>

	<h3>會員編輯</h3>

	<br />
	<br />
	<!-- action对应一个action标签，id对应提交时的对应关系 -->
	<form id="saveForm"
		action="updateMember.do"
		method="post">
		<input type="hidden" name="id" value="${Member.id}" />
		<input type="hidden" name="account" value="${Member.account}" />
		<table style="font-size: :16px">
			<tr>
				<td>姓名：</td>
				<td><input type="text" value="${Member.name }" name="name" /></td>
			</tr>
			<tr>
				<td>密碼：</td>
				<td><input type="text" value="${Member.password }" name="password" /></td>
			</tr>
			<tr>
			<tr>
				<td>手機：</td>
				<td><input type="text" value="${Member.phone }" name="phone" /></td>
			</tr>
			<tr>
				<td>Email：</td>
				<td><input type="text" value="${Member.email }"
					name="email" /></td>
			</tr>
			<tr>
				<td>生日：</td>
				<td><input type="text" value="${Member.birthday }"
					name="birthday" /></td>
			</tr>
			<tr>
				<td>地址：</td>
				<td><input type="text" value="${Member.address }"
					name="address" /></td>
			</tr>
			<tr>

				<td align="right"><input type="submit" value="更新" />
			    <a href="javascript:history.go(-1)">取消 </a>
			</tr>
		</table>
	</form>
<!-- 	<tr> -->

<!--                 <td align="right"><a -->
<!--                     href="javascript:document.getElementById('saveForm').submit()">保存</a> -->
<!--                     &nbsp;&nbsp; <a href="javascript:history.go(-1)">退回 </a></td> -->
<!--      </tr> -->
          
</body>
</html>
