<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<meta charset="UTF-8">
<title>Product</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/res/static/css/main.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/res/layui/css/layui.css">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/res/layui/layui.js"></script>
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
<meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">
</head>
<body>
	<jsp:include page="/WEB-INF/views/eric/header.jsp"></jsp:include>

	<div class="content content-nav-base datails-content">
		<div class="main-nav"></div>
		<div class="data-cont-wrap w1200" style="margin-top: 20px;">
			<div class="product-intro layui-clear" style="margin-top: 40px">
				<div class="preview-wrap">
					<a href="javascript:;"><img width='350px' height='350px'
						src="<c:url value='/hao/getPicture/${product.id }' />"></a>
				</div>
				<div class="itemInfo-wrap">
					<div class="itemInfo">
						<div class="title">
							<h2 style="font-weight: bold;">${product.name}</h2>
						</div>
						<div class="summary" style="height: 425px">
							<p class="reference">
								<span>單&nbsp;&nbsp;&nbsp;&nbsp;價</span> ${product.price}元
							</p>
							<!--          <p class="activity"><span>商品編號</span><strong class="price"><i>￥</i>99.00</strong></p> -->
							<p class="address-box">
								<span>優&nbsp;&nbsp;&nbsp;&nbsp;惠</span><strong class="address">

									6入<fmt:formatNumber type="number"
										value="${product.price*6*0.9}" maxFractionDigits="0" />元（9折）
									<p>
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										12入<fmt:formatNumber type="number"
											value="${product.price*12*0.8}" maxFractionDigits="0" />元（8折）
									</p>
									<p>
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										18入<fmt:formatNumber type="number"
											value="${product.price*18*0.7}" maxFractionDigits="0" />元（7折）
									</p>
								</strong>
							</p>
							<p class="reference">
								<span>類&nbsp;&nbsp;&nbsp;&nbsp;別</span>
								${product.categoryBean.name}
							</p>
							<p class="reference">
								<span>介&nbsp;&nbsp;&nbsp;&nbsp;紹</span>${product.detail}
							</p>
							<p class="reference">
								<span>商&nbsp;&nbsp;&nbsp;&nbsp;家</span><a
									href="/shianghergo/hao/getStoreByProduct?id=${product.storeBean.id }">${product.storeBean.name }</a>
							</p>
						</div>

						<div class="choose-btns">
							<button class="layui-btn  layui-btn-danger car-btn">
								<i class="layui-icon layui-icon-cart-simple"></i>加入購物車
							</button>
							<input type="button" value="返回列表"
								onclick="location.href='<spring:url value='/hao/products' />'"
								class="layui-btn  layui-btn-danger car-btn">

						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<jsp:include page="/WEB-INF/views/eric/foot.jsp" />
</body>
</html>
