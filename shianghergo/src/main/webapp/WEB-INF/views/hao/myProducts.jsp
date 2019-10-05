<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
<head>
<meta charset="UTF-8">
<title>myProducts</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
<meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">
<style>
.bg {
	background-image: url('https://i.imgur.com/a6yD7QT.gif')
}
</style>
<script type="text/javascript">
	function confirmDelete() {
		var msg = "您真的確定要刪除嗎？\n\n請確認！";
		if (confirm(msg) == true) {
			return true;
		} else {
			return false;
		}
	}
</script>

</head>
<body>
	<jsp:include page="/WEB-INF/views/eric/header.jsp"></jsp:include>
	<jsp:include page="../BlackLine.jsp" />
	
	
<div  style="padding-bottom: 350px;">
	<div style="padding-left: 290px; padding-right: 30px;">
	
		<div class="card-body"style="font-family: 微軟正黑體;">
			<h1 class="card-title">商店名稱:${store.name}</h1>
			<p class="card-text">${store.detail}</p>
			<a href="${pageContext.request.contextPath}/hao/products/add" class="btn btn-primary">新增商品</a>
		</div>
	</div>
	<!-- -------------------------- -->
	<div style="padding-left: 290px; padding-right: 30px;">
		<div class="card-deck">
			<c:forEach var='product' items='${products}' varStatus="status">
				<div class="card">
					<img width='140' height='200'
						src="<c:url value='/hao/getPicture/${product.id }' />"
						class="card-img-top" alt="...">
					<div class="card-body">
						<h5 class="card-title">品名:${product.name }</h5>
						<p class="card-text">單價：${product.price }</p>
						<p class="card-text">說明：${product.detail }</p>
						
					</div>
					<div class="card-footer">
						<form action="/shianghergo/hao/product/Update/Delete"
							method="POST">
							<a
								href="<spring:url value='/hao/product/Update?id=${product.id }' />"
								class="btn btn-primary"> 修改 </a> <a
								href="/shianghergo/hao/product/Update/Delete?id=${product.id }">
								<input type="button" name="delete" value="刪除"
								class='btn btn-primary' onclick="return confirmDelete()" />
							</a> <input type="hidden" value="${product.id }" name="id">
							<!-- 							<input type="submit"name="delete" value="刪除" class='btn btn-primary' -->
							<!-- 							onclick="confirmDelete()" /> -->
						</form>
					</div>
				</div>
				<c:if test="${(status.count % 5) == 0}">
		</div>
		<div class="card-deck">
			</c:if>

			<c:if test="${status.last}">
				<c:if test="${(status.index+1) % 5 != 0}">
					<c:forEach var='abc' items='${products}' varStatus="i">
						<c:if test="${i.index < -(((status.index+1)%5) -5)}">
							<div class="card" style="border: 1px solid white"></div>
						</c:if>
					</c:forEach>
				</c:if>
			</c:if>
			</c:forEach>
			<!-- 		</div> -->
		</div>
	</div>
	</div>
	<jsp:include page="/WEB-INF/views/eric/foot.jsp" />
</body>
</html>