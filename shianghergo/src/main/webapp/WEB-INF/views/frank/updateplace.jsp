<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="icon" href="images/logo4.ico"/>
<meta charset="UTF-8">
<title>編輯</title>
<style>
body {
	margin: 0px;
	padding: 0px;
	background: #fff url('../images/bbg06.png') center center fixed ;　
}
</style>
<body>





<jsp:include page="/WEB-INF/views/eric/header.jsp" />

	<h3>團資料編輯</h3>
	<div class="container">	
	<div class="border border-success"style="padding-left: 300px;padding-right: 300px;">
	<!-- action对应一个action标签，id对应提交时的对应关系 -->
	<form id="saveForm" action="updatetoplace" method="post">
		<input type="hidden" name="pid" value="${updateplace.id}" />
		<input type="hidden" name="gid" value="${updateplace.groupsBean.id}" />
			
<!-- 		<h2>團資訊</h2> -->
		<table style="font-size: :16px"class="rwd-table">
			<tr>
				<td align="center" colspan="2"><h1>修改地址</h1></td>
			</tr>
			
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
	</table>
			<div>

				<input type="submit" value="更新" class="btn btn-primary"/> <a
				class="btn btn-primary"	href="javascript:history.go(-1)">取消 </a>
			</div>
	
	
	
	</form>
	</div>
	</div>
	<script src="//cdn.bootcss.com/canvas-nest.js/1.0.1/canvas-nest.min.js"></script>
</body>
	<jsp:include page="/WEB-INF/views/eric/foot.jsp" />
</html>
