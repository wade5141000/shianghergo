<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="icon" href="images/logo4.ico"/>
<meta charset="UTF-8">
<title>資料編輯e</title>
<style type="text/css">
.table table-hover td {
	width: 100px;
	height: 100px;
}
body {
	margin: 0px;
	padding: 0px;
	background: #fff url('../images/bbg06.png') center center fixed ;　
}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/eric/header.jsp" />
	<jsp:include page="../BlackLine.jsp" />
	<div class="container" style="padding-bottom: 250px;">
		<div >
			<!-- action对应一个action标签，id对应提交时的对应关系 -->
			<form:form method="post" action="updatetogroup_item(mb)"
				enctype="multipart/form-data" modelAttribute="upgroupsitemBean"
				class="row">
				<input type="hidden" name="iid" value="${updategitem.id}" />
				<input type="hidden" name="gid" value="${updategitem.groupsBean.id}" />
				<div class="col-4" style="align: center;">
							<img
								src="<c:url value='/frank/getPicture/${updategitem.id }' />"
								alt="..." class="img-thumbnail">
				</div>
				<div class="col-8">
					<div class="card text-center">
						<div class="card-header">商品資訊</div>
							<div class="card-body">
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
								<td><input type="file" id="productImage"
									name="productImage" /></td>

							</tr>

						</table>
						</div>
						
				<div style="padding-top: 10px;"class="card-footer text-muted">
					<input type="submit" value="更新" class="btn btn-primary" /> <a
						class="btn btn-primary" href="javascript:history.go(-1)">取消 </a>
				</div>
						
					</div>
				</div>
			</form:form>
		</div>
	</div>
<jsp:include page="/WEB-INF/views/eric/foot.jsp"></jsp:include>
<script src="//cdn.bootcss.com/canvas-nest.js/1.0.1/canvas-nest.min.js"></script>
</body>
</html>
