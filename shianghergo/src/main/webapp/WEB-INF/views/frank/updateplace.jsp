<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h3>團資料編輯</h3>

	<br />
	<br />
	<!-- action对应一个action标签，id对应提交时的对应关系 -->
	<form id="saveForm" action="updatetoplace" method="post">
		<input type="hidden" name="pid" value="${updateplace.id}" />
		<input type="hidden" name="gid" value="${updateplace.groupsBean.id}" />
			
		<h2>團資訊</h2>
		<table style="font-size: :16px">
			<tr>
				<td>標題：</td>
				<td><input type="text" value="${updateplace.address }"
					name="address" /></td>
			</tr>
			<tr>
				<td>時間：</td>
				<td><input type="text" value="${updateplace.time }"
					name="time" /></td>
			</tr>

			<tr>

				<td align="right"><input type="submit" value="更新" /> <a
					href="javascript:history.go(-1)">取消 </a>
			</tr>
	
	
		</table>
	</form>
</body>
</html>
