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
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/eric/header.jsp"></jsp:include>
	<jsp:include page="../BlackLine.jsp" />
	<div style="padding-bottom: 500px; margin-left: 265px;">
		<div class="card">
			<h1 class="card-header">我的商品列表</h1>
			<div class="card-body">
				<a href="${pageContext.request.contextPath}/hao/products/add" class="btn btn-primary">新增商品</a>
			</div>
		</div>
		<div class="card-deck">
			<c:forEach var='product' items='${products }' varStatus="status">
				<div class="card">
					<img width='140' height='200'
						src="<c:url value='/hao/getPicture/${product.id }' />"
						class="card-img-top" alt="...">
					<div class="card-body">
						<h5 class="card-title">品名:${product.name }</h5>
						<p class="card-text">說明：${product.detail }</p>
						<p class="card-text">說明：${product.id }</p>

					</div>
					<div class="card-footer">
						<a
							href="<spring:url value='/hao/product/Update?id=${product.id }' />"
							class="btn btn-primary"> 修改 </a>
					</div>
				</div>
				<c:if test="${(status.index % 5) == 4}">
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


		<!-- 		<section class="container"> -->
		<!-- 			<div class="row"> -->
		<%-- 				<c:forEach var='product' items='${products }'> --%>
		<!-- 					<div class="col-sm" style="padding-bottom: 30px;"> -->
		<!-- 						<div class="col-sm-6 col-md-3" -->
		<!-- 							style="width: 360px; height: 360px;"> -->
		<!-- 							<div class="thumbnail" -->
		<!-- 								style="width: 250px; height: 340px; border: solid 1px gray;"> -->
		<!-- 								<div style="padding-bottom: 5px; text-align: center;"> -->
		<!-- 									<img width='140' height='200' -->
		<%-- 										src="<c:url value='/hao/getPicture/${product.id }' />" /> --%>
		<!-- 								</div> -->
		<!-- 								<div class="caption" style="text-align: center"> -->
		<!-- 									<p> -->
		<%-- 										<b style='font-size: 16px;'>品名:${product.name }</b> --%>
		<!-- 									</p> -->
		<%-- 									<p>價格：${product.price }</p> --%>
		<%-- 									<p>說明：${product.detail }</p> --%>
		<%-- 									<p>說明：${product.id }</p> --%>
		<!-- 									<p> -->
		<!-- 										<a -->
		<%-- 											href="<spring:url value='/hao/product/Update?id=${product.id }' />" --%>
		<!-- 											class="btn btn-primary"> 修改 </a> -->
		<!-- 									</p> -->
		<!-- 								</div> -->
		<!-- 							</div> -->
		<!-- 						</div> -->
		<!-- 					</div> -->
		<%-- 				</c:forEach> --%>
		<!-- 			</div> -->
		<!-- 		</section> -->
	</div>
	<jsp:include page="/WEB-INF/views/eric/foot.jsp" />
	<!-- 	<tr> -->
	<%-- 		<c:if test="${not empty properList}"> --%>
	<%-- 			<c:forEach var="object" items="${properList}" varStatus="status"> --%>
	<%-- 				<c:if test="${(status.index+1) mod 3 !=1}"> --%>
	<%-- 					<td noWrap class="td_title" width="8%" align="center">${object.propertyName }</td> --%>
	<!-- 					<td class="td_detail"><input type="text" -->
	<%-- 						id="${object.propertyName }" name="${object.propertyName }" /></td> --%>
	<%-- 				</c:if> --%>
	<%-- 				<c:if test="${(status.index+1) mod 3==1}"> --%>
	<!-- 					<tr> -->
	<%-- 						<td noWrap class="td_title" width="8%" align="center">${object.propertyName }</td> --%>
	<!-- 						<td class="td_detail"><input type="text" -->
	<%-- 							id="${object.propertyName }" name="${object.propertyName }" /></td> --%>
	<%-- 				</c:if> --%>
	<%-- 			</c:forEach> --%>
	<%-- 		</c:if> --%>
	<!-- 	</tr> -->
</body>
</html>