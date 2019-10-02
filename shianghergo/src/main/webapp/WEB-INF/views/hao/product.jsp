<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
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
			<div class="product-intro layui-clear" style="margin-top:40px">
				<div class="preview-wrap">
					<a href="javascript:;"><img width='350px' height='350px'
						src="<c:url value='/hao/getPicture/${product.id }' />"></a>
				</div>
				<div class="itemInfo-wrap">
					<div class="itemInfo">
						<div class="title">
							<h4>${product.name}</h4>
							<span><i class="layui-icon layui-icon-rate-solid"></i>收藏</span>
						</div>
						<div class="summary" style="height: 250px">
							<p class="reference">
								<span>單&nbsp;&nbsp;&nbsp;&nbsp;價</span> ${product.price}元
							</p>
							<!--          <p class="activity"><span>商品編號</span><strong class="price"><i>￥</i>99.00</strong></p> -->
							<p class="reference">
								<span>類&nbsp;&nbsp;&nbsp;&nbsp;別</span>
								${product.categoryBean.name}
							</p>
							<p class="address-box">
								<span>介&nbsp;&nbsp;&nbsp;&nbsp;紹</span><strong class="address">${product.detail}</strong>
							</p>
							<p class="reference">
								<span>商&nbsp;&nbsp;&nbsp;&nbsp;家</span><a
									href="/shianghergo/hao/store?id=${product.storeBean.id }">${product.storeBean.name }</a>
							</p>
						</div>
						<div class="choose-attrs">
							<div class="number layui-clear">
								<span class="title">數&nbsp;&nbsp;&nbsp;&nbsp;量</span>
								<div class="number-cont">
									<span class="cut btn">-</span><input
										onkeyup="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'')}else{this.value=this.value.replace(/\D/g,'')}"
										onafterpaste="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'')}else{this.value=this.value.replace(/\D/g,'')}"
										maxlength="4" type="" name="" value="1"><span
										class="add btn">+</span>
								</div>
							</div>
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
