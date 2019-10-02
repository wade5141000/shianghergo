<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Document</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
<meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">
</head>
<body>

	<jsp:include page="/WEB-INF/views/eric/header.jsp" />
	<div style="padding-bottom: 400px;">
		<jsp:include page="../BlackLine.jsp" />
		<div style="padding-left: 350px; padding-right: 350px;">
			<form:form modelAttribute="storeBean" enctype="multipart/form-data"
				 method="post">
				<legend>開設商店</legend>
				<table class="table table-hover">
					<form:input type="hidden" id="member_id" path="member_id"
						value="${loginOK.id }" />
					<tr>
						<td><form:input type="text" path="name" id="name"
								lay-verify="required|phone" placeholder="請輸入商店名稱"
								autocomplete="off" /></td>
					</tr>
					<tr>
						<td><form:input id="detail" type="text" path="detail"
								lay-verify="required" placeholder="請輸入商店說明" autocomplete="off" />
						</td>
					</tr>
				</table>
				<div class="">
					<div class="">
						<button class="btn btn-primary">確認送出</button>
					</div>

				</div>
			</form:form>

		</div>
	</div>
	<jsp:include page="/WEB-INF/views/eric/foot.jsp" />
</body>
</html>