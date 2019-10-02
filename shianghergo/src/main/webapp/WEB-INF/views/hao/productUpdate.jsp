<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>商品修改</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/eric/header.jsp" />
	<jsp:include page="../BlackLine.jsp" />
	<!-- 	<section> -->
	<!-- 		<div class="container"> -->
	<!-- 			<h1 style="text-align: center">修改商品資料</h1> -->
	<!-- 		</div> -->
	<!-- 	</section> -->
	<!-- 	<hr -->
	<!-- 		style="height: 1px; border: none; color: #333; background-color: #333;"> -->
	<div style="padding-bottom: 350px;">
		<div style="padding-left: 350px; padding-right: 350px;">
			<section class="container">
				<!--       三個地方要完全一樣 -->
				<form:form method='POST' modelAttribute="itemBean"
					class='form-horizontal' enctype="multipart/form-data">
					<fieldset style="padding-top: 10px; margin-left: 200px;">
						<table class="table table-hover">
							<tr>
								<td align="center" colspan="2"><h1>修改商品</h1></td>
							</tr>
							<tr>
								<td><label class="control-label " for='name'> 商品名稱
								</label></td>
								<td><form:input id="name" path="name" type='text'
										class='form:input-large' value='${product.name}' /></td>
							</tr>
							<tr>
								<td><label class='control-label' for="category_id">
										分類 </label></td>
								<td><form:select path="categoryBean" name="categoryBean">
										<c:forEach var="categorys" items="${category}">
											<option value="${categorys.id}">${categorys.name}</option>
										</c:forEach>
									</form:select></td>


								<!-- 					<div class='col-lg-10'> -->
								<%-- 												<form:select id="category_id" path="category_id"> --%>
								<%-- 													<form:option value="${product.categoryBean.id}"> --%>
								<%-- 														${product.categoryBean.name} --%>
								<%-- 													</form:option> --%>
								<%-- 													<form:options items="${categoryList }" /> --%>
								<%-- 												</form:select> --%>
								<%-- 						<form:select id="category_id" class="form-control" required="required" --%>
								<%-- 							path="category_id"> --%>
								<%-- 							<form:option value="60001" selected="selected">團購美食</form:option> --%>
								<%-- 							<form:option value="60002">保養美妝</form:option> --%>
								<%-- 							<form:option value="60003">服飾配件</form:option> --%>
								<%-- 							<form:option value="60004">育兒親子</form:option> --%>
								<%-- 						</form:select> --%>

								<!-- 					</div> -->
							</tr>
							<tr>
								<td><label class="control-label " for="store_id">
										商店名稱 (store_id)</label></td>
								<td><input type="text" id="store_id" path="store_id"
									class="form:input-large" value="${product.storeBean.id }"
									readonly="readonly" /></td>
							</tr>
							<tr>
								<td><label class='control-label ' for="reserve">
										庫存數量 </label></td>
								<td><form:input id="reserve" path="reserve" type='text'
										class='form:input-large' value='${product.reserve }' /></td>
							</tr>
							<tr>
								<td><label class='control-label ' for="price"> 價格 </label></td>
								<td><form:input id="price" path="price" type='text'
										class='form:input-large' value='${product.price }' /></td>
							</tr>
							<tr>
								<td><label class="control-label" for='detail'> 商品說明
								</label></td>
								<td><form:input id="detail" path="detail" type='text'
										class='form:input-large' value='${product.detail }' /></td>
							</tr>
							<tr>
								<td><label class='control-label ' for="productImage">
										商品圖片 </label></td>
								<td><img width='100' height='150'
									src="<c:url value='/hao/getPicture/${product.id }' />" /> <form:input
										id="productImage" path="productImage" type='file'
										class='form:input-largt' /></td>
							</tr>
						</table>
						<div style="padding-left: 250px;">
							<input id="btnAdd" type='submit' class='btn btn-primary'
								value="確認修改" />
						</div>
					</fieldset>
				</form:form>
			</section>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/eric/foot.jsp" />
</body>
</html>