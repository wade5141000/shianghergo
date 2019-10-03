<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	<form:form   method="post" action="updatetogroup_item"
		 enctype="multipart/form-data" modelAttribute="upgroupsitemBean">
		<input type="hidden" name="iid" value="${updategitem.id}" />
		<input type="hidden" name="gid" value="${updategitem.groupsBean.id}" />
234234
		<h2>商品資訊</h2>
		
		<img width='500' height='300'
							src="<c:url value='/frank/getPicture/${updategitem.id }' />" />
		<table style="font-size: :16px">
			<tr>
				<td>商品名稱：</td>
				<td><input type="text" value="${updategitem.name}" name="name" /></td>
			</tr>
			<tr>
				<td>商品說明：</td>
				<td><input type="text" value="${updategitem.detail }"
					name="detail" /></td>
			</tr>
			<tr>
				<td>商品價格：</td>
				<td><input type="text" value="${updategitem.price }"
					name="price" /></td>
			</tr>

			<tr>
				<td>圖片:</td>
				<td><input type="file" id="productImage" name="productImage"
					  /></td>

			</tr>


			<tr>

				<td align="right"><input type="submit" value="更新" /> <a
					href="javascript:history.go(-1)">取消 </a>
			</tr>


		</table>
	</form:form>
</body>
</html>
