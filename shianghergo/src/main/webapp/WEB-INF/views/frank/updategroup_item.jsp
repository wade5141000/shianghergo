<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="icon" href="images/logo4.ico"/>
<meta charset="UTF-8">
<title>資料編輯</title>
<style type="text/css">
.table table-hover td{
	width: 100px;
	height:100px; 
}
body {
	margin: 0px;
	padding: 0px;
	background: #fff url('images/bbg06.png') center center fixed ;　
}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/eric/header.jsp" />
	
	<h3>團資料編輯</h3>
	<br />
	<br />

	<div class="container">
		<div class="border border-success">
			<!-- action对应一个action标签，id对应提交时的对应关系 -->
			<form:form method="post" action="updatetogroup_item"
				enctype="multipart/form-data" modelAttribute="upgroupsitemBean"
				class="row">
				<input type="hidden" name="iid" value="${updategitem.id}" />
				<input type="hidden" name="gid" value="${updategitem.groupsBean.id}" />


				<!-- 		<h2>商品資訊</h2> -->
				<div class="col-4" style="align:center;">
					<table >
						<tr>
							<td style="padding-left: 70px;padding-top: 70px;"><img
								src="<c:url value='/frank/getPicture/${updategitem.id }' />"
								alt="..." class="img-thumbnail"></td>
						</tr>
					</table>
				</div>
				<div class="col-8">
					<table style="font-size: :16px" class="table table-hover">
						<tr>
							<td align="center" colspan="2"><h1>商品資訊</h1></td>
						</tr>
						<tr>
							<td style="padding-left: 0.30px;">商品名稱：</td>
							<td><input type="text" value="${updategitem.name}"
								name="name" /></td>
						</tr>
						<tr>
							<td style="padding-left: 0.30px;">商品說明：</td>
							<td><input type="text" value="${updategitem.detail }"
								name="detail" /></td>
						</tr>
						<tr>
							<td style="padding-left: 0.30px;">商品價格：</td>
							<td><input type="text" value="${updategitem.price }"
								name="price" /></td>
						</tr>

						<tr>
							<td style="padding-left: 0.30px;">圖片:</td>
							<td><input type="file" id="productImage" name="productImage" /></td>

						</tr>

					</table>
				</div>
				<div style="padding-top: 10px;margin-left: 500px;">
					<input type="submit" value="更新" class="btn btn-primary" /> <a
						class="btn btn-primary" href="javascript:history.go(-1)">取消 </a>
				</div>



			</form:form>
		</div>
	</div>
	<script src="//cdn.bootcss.com/canvas-nest.js/1.0.1/canvas-nest.min.js"></script>
</body>
	<jsp:include page="/WEB-INF/views/eric/foot.jsp" />
</html>
