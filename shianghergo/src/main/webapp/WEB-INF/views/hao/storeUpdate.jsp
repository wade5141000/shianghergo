<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
<meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">
<title>商家修改</title>
<script>
	function close() {
		var r = confirm("是否關閉商店")
		if (r == true) {
			alert('成功關閉商店');
		} else {
			alert('取消關閉商店');
		}
	}
</script>
<style type="text/css">
/* fieldset{ */
/* border:2px; */
/* } */

</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/eric/header.jsp" />

	<jsp:include page="../BlackLine.jsp" />
	<div style="padding-bottom: 350px;">
		<div style="padding-left: 350px; padding-right: 350px;">
			<!--       三個地方要完全一樣 -->
			<form:form method='POST' modelAttribute="storeBean"
				class='form-horizontal' enctype="multipart/form-data">
				<fieldset>
					<table class="table table-hover">
						<tr>
							<td align="center" colspan="2"><h1>修改商家資料</h1></td>
						</tr>
						<tr>
							<td><label class="control-label " for='name'> 商店名稱 </label></td>
							<td><form:input id="name" path="name" type='text'
									class='form:input-large' value='${store.name}' /></td>
						</tr>
						<tr>
							<td><input type="hidden" id="id" path="id"
								class="form:input-large" value="${store.id }"
								readonly="readonly" /></td>
						</tr>
						<tr>
							<td><label class='control-label ' for="detail"> 商店介紹
							</label></td>
							<td><form:input id="detail" path="detail" type='text'
									style="width:400px;height:120px;" class='form:input-large'
									value='${store.detail }' /></td>
						</tr>
					</table>
					<div class="form-group">
						<div class='col-lg-offset-2 col-lg-10'>
							<input id="btnAdd" type='submit' class='btn btn-primary'
								value="確認修改" />
							<form action="closeStore" method="POST">
								<input type=hidden value="${store.id}" name="id">
								<button type="submit" class="btn btn-success" onclick="close()">關閉商店</button>
							</form>
							<input type="button" class="btn btn-success"
								onclick="history.back()" value="回到上一頁"></input>
						</div>
					</div>
				</fieldset>
			</form:form>
		</div>

	</div>
	<jsp:include page="/WEB-INF/views/eric/foot.jsp" />
</body>
</html>