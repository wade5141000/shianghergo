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
<script type="text/javascript">
	function confirmDelete() {
		if (confirm("確定刪除此項商品(${product.name})?")) {
			// 			document.forms[0].action="BookDelete.do?pageNo=${param.pageNo}&bookID=${bean.bookId}&bookNo=${bean.bookNo}" ;
			document.forms[0].action = "/shianghergo/hao/product/Update/Delete?id=${product.id}";
			document.forms[0].method = "POST";
			document.forms[0].submit();
		} else {
		}
	}
</script>
</head>
<body>
	<section>
		<div class="container">
			<h1 style="text-align: center">修改商品資料</h1>
		</div>
	</section>
	<hr
		style="height: 1px; border: none; color: #333; background-color: #333;">
	<section class="container">
		<!--       三個地方要完全一樣 -->
		<form:form method='POST' modelAttribute="itemBean"
			class='form-horizontal' enctype="multipart/form-data">
			<fieldset>
				<div class="form-group">
					<label class="control-label col-lg-2 col-lg-2" for='name'>
						商品名稱 </label>
					<div class="col-lg-10">
						<form:input id="name" path="name" type='text'
							class='form:input-large' value='${product.name}' />
					</div>
				</div>
				<div class="form-group">
					<label class='control-label col-lg-2 col-lg-2' for="category_id">
						分類 </label>
					<div class='col-lg-10'>
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
						<form:select path="categoryBean" name="categoryBean">
							<c:forEach var="categorys" items="${category}">
								<option value="${categorys.id}">${categorys.name}</option>
							</c:forEach>
						</form:select>
					</div>
				</div>

				<div class="form-group">
					<label class="control-label col-lg-2 col-lg-2" for="store_id">
						商店名稱 (store_id)</label>
					<div class="col-lg-10">
						<input type="text" id="store_id" path="store_id"
							class="form:input-large" value="${product.storeBean.id }"
							readonly="readonly" />

					</div>
				</div>

				<div class="form-group">
					<label class='control-label col-lg-2 col-lg-2' for="reserve">
						庫存數量 </label>
					<div class='col-lg-10'>
						<form:input id="reserve" path="reserve" type='text'
							class='form:input-large' value='${product.reserve }' />
					</div>
				</div>

				<div class="form-group">
					<label class='control-label col-lg-2 col-lg-2' for="price">
						價格 </label>
					<div class='col-lg-10'>
						<form:input id="price" path="price" type='text'
							class='form:input-large' value='${product.price }' />
					</div>
				</div>

				<div class="form-group">
					<label class="control-label col-lg-2 col-lg-2" for='detail'>
						商品說明 </label>
					<div class="col-lg-10">
						<form:input id="detail" path="detail" type='text'
							class='form:input-large' value='${product.detail }' />
					</div>
				</div>

				<div class="form-group">
					<label class='control-label col-lg-2 col-lg-2' for="productImage">
						商品圖片 </label>
					<div class='col-lg-10'>
						<img width='100' height='150'
							src="<c:url value='/hao/getPicture/${product.id }' />" />
						<form:input id="productImage" path="productImage" type='file'
							class='form:input-largt' />
					</div>
				</div>

				<div class="form-group">
					<div class='col-lg-offset-2 col-lg-10'>
						<input id="btnAdd" type='submit' class='btn btn-primary'
							value="確認修改" /> <input type="button" name="delete" value="刪除"
							onclick="confirmDelete()" />
					</div>
				</div>
			</fieldset>
		</form:form>
	</section>
</body>
</html>