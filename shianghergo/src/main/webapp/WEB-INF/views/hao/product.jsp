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
	<div class="site-nav-bg">
		<div class="site-nav w1200">
			<p class="sn-back-home">
				<i class="layui-icon layui-icon-home"></i> <a href="index.jsp">首頁</a>
			</p>
			<div class="sn-quick-menu">
				<div class="login">
					<a href="login.jsp">登入</a>
				</div>
				<div class="sp-cart">
					<a href="shopcart.jsp">購物車</a><span>2</span>
				</div>
			</div>
		</div>
	</div>



	<div class="header">
		<div class="headerLayout w1200">
			<div class="headerCon">
				<h1 class="mallLogo">
					<a href="index.jsp"> <img
						src="${pageContext.request.contextPath}/res/static/img/logo4.png"
						width="100" height="100">
					</a>
				</h1>
				<div class="mallSearch">
					<form action="" class="layui-form" novalidate>
						<input type="text" name="title" required lay-verify="required"
							autocomplete="off" class="layui-input" placeholder="請輸入需要的商品">
						<button class="layui-btn" lay-submit lay-filter="formDemo">
							<i class="layui-icon layui-icon-search"></i>
						</button>
						<input type="hidden" name="" value="">
					</form>
				</div>
			</div>
		</div>
	</div>

	<div class="content content-nav-base buytoday-content">
		<div id="list-cont">
			<div class="main-nav">
				<div class="inner-cont0">
					<div class="inner-cont1 w1200">
						<div class="inner-cont2">
							<a href="commodity.jsp" class="active">所有商品</a> <a
								href="buytoday.jsp">今日團購</a>
						</div>
					</div>
				</div>
			</div>
			<div class="banner-box">
				<div class="banner"></div>
			</div>
		</div>
	</div>
	
	<div class="content content-nav-base datails-content">
    <div class="main-nav">   
    </div>
    <div class="data-cont-wrap w1200" style="margin-top:20px;">
      <div class="product-intro layui-clear">
        <div class="preview-wrap">
          <a href="javascript:;"><img width='350px' height='350px' src="<c:url value='/hao/getPicture/${product.id }' />"></a>
        </div>
        <div class="itemInfo-wrap">
          <div class="itemInfo">
            <div class="title">
              <h4>${product.name} </h4>
              <span><i class="layui-icon layui-icon-rate-solid"></i>收藏</span>
            </div>
            <div class="summary">
              <p class="reference"><span>單&nbsp;&nbsp;&nbsp;&nbsp;價</span> ${product.price}元</p>
<!--          <p class="activity"><span>商品編號</span><strong class="price"><i>￥</i>99.00</strong></p> -->
			  <p class="reference"><span>類&nbsp;&nbsp;&nbsp;&nbsp;別</span> ${product.categoryBean.name}</p>
              <p class="address-box"><span>介&nbsp;&nbsp;&nbsp;&nbsp;紹</span><strong class="address">${product.detail}</strong></p>
            </div>
            <div class="choose-attrs">
              <div class="number layui-clear"><span class="title">數&nbsp;&nbsp;&nbsp;&nbsp;量</span><div class="number-cont"><span class="cut btn">-</span><input onkeyup="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'')}else{this.value=this.value.replace(/\D/g,'')}" onafterpaste="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'')}else{this.value=this.value.replace(/\D/g,'')}" maxlength="4" type="" name="" value="1"><span class="add btn">+</span></div></div>
            </div>
            <div class="choose-btns">
              <button class="layui-btn  layui-btn-danger car-btn"><i class="layui-icon layui-icon-cart-simple"></i>加入購物車</button>
              <input type="button" value="返回列表" onclick="location.href='<spring:url value='/hao/products' />'" class="layui-btn  layui-btn-danger car-btn">
      
            </div>
          </div>
        </div>
      </div>
      
	
<!-- 	<section> -->
<!-- 		<div> -->
<!-- 			<div class="container" style="text-align: center"> -->
<!-- 				<h2>產品資料</h2> -->
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 	</section> -->
<!-- 	<section class="container"> -->
<!-- 		<div class="row"> -->
<!-- 			<img width='100' height='150' -->
<%-- 				src="<c:url value='/hao/getPicture/${product.id }' />" /> --%>
<!-- 			<div class="col-md-5"> -->
<%-- 				<h3>${product.name}</h3> --%>
<%-- 				<p>分類： ${product.categoryBean.name}</p> --%>
<%-- 				<p>單價:：${product.price}</p> --%>
<%-- 				<p>商店名稱:：${product.storeBean.name}</p> --%>
<%-- 				<p>商品介紹： ${product.detail}</p> --%>
<!-- 				<p> -->
<!-- 					<strong>商品編號: </strong> <span class='label label-warning'> -->
<%-- 						${product.id} </span> --%>
<!-- 				</p> -->
<!-- 				<p> -->
<%-- 					<a href="<spring:url value='/hao/products' />" --%>
<!-- 						class="btn btn-default"> <span -->
<!-- 						class="glyphicon-hand-left glyphicon"></span>返回 -->
<!-- 					</a> -->
<!-- 				</p> -->
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 	</section> -->

	<script type="text/javascript">
		layui.config({
			base : '../res/static/js/util/' //你存放新模块的目录，注意，不是layui的模块目录
		}).use([ 'mm', 'jquery' ], function() {
			var mm = layui.mm, $ = layui.$;
			var cur = $('.number-cont input').val();
			$('.number-cont .btn').on('click', function() {
				if ($(this).hasClass('add')) {
					cur++;

				} else {
					if (cur > 1) {
						cur--;
					}
				}
				$('.number-cont input').val(cur)
			})

		});
	</script>
</body>
</html>
