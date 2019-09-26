<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
<head>
<meta charset="UTF-8">
<title>Products</title>
<link rel="stylesheet"
	href="http://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
<script src="http://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
<script
	src="http://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
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
				<i class="layui-icon layui-icon-home"></i> <a href=index.jsp>首頁</a>
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
								href="buytoday.jsp" class="active">今日團購</a>
						</div>
					</div>
				</div>
			</div>

			<div id="myCarousel" class="carousel slide">

				<ol class="carousel-indicators">
					<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
					<li data-target="#myCarousel" data-slide-to="1"></li>
					<li data-target="#myCarousel" data-slide-to="2"></li>
				</ol>

				<div class="carousel-inner">
					<div class="item active">
						<a href="A.jsp" title="GO"><img
							src="${pageContext.request.contextPath}/res/static/img/1.png"
							alt="First slide" style="width: 100%"></a>
					</div>
					<div class="item">
						<a href="B.jsp" title="GO"><img
							src="${pageContext.request.contextPath}/res/static/img/2.png"
							alt="Second slide" style="width: 100%"></a>
					</div>
					<div class="item">
						<a href="C.jsp" title="GO"><img
							src="${pageContext.request.contextPath}/res/static/img/3.png"
							alt="Third slide" style="width: 100%"></a>
					</div>
				</div>

				<a class="left carousel-control" href="#myCarousel" role="button"
					data-slide="prev"> <span
					class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
					<span class="sr-only">Previous</span>
				</a> <a class="right carousel-control" href="#myCarousel" role="button"
					data-slide="next"> <span
					class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
					<span class="sr-only">Next</span>
				</a>
			</div>


			<div class="content content-nav-base commodity-content">
				<div class="commod-cont-wrap">
					<div class="commod-cont w1200 layui-clear">
						<div class="left-nav">
							<div class="title">所有分类</div>
							<div class="list-box">
								<dl>
									<dt>奶粉辅食</dt>
									<dd>
										<a href="javascript:;">进口奶粉</a>
									</dd>
									<dd>
										<a href="javascript:;">宝宝辅食</a>
									</dd>
									<dd>
										<a href="javascript:;">营养品</a>
									</dd>
								</dl>
								<dl>
									<dt>儿童用品</dt>
									<dd>
										<a href="javascript:;">纸尿裤</a>
									</dd>
									<dd>
										<a href="javascript:;">婴儿湿巾</a>
									</dd>
									<dd>
										<a href="javascript:;">婴儿车</a>
									</dd>
									<dd>
										<a href="javascript:;">婴儿床</a>
									</dd>
									<dd>
										<a href="javascript:;">儿童安全座椅</a>
									</dd>
								</dl>
								<dl>
									<dt>儿童早教</dt>
									<dd>
										<a href="javascript:;">儿童玩具</a>
									</dd>
									<dd>
										<a href="javascript:;">早教书籍</a>
									</dd>
									<dd>
										<a href="javascript:;">孕产育儿书</a>
									</dd>
								</dl>
								<dl>
									<dt>儿童服饰</dt>
									<dd>
										<a href="javascript:;">童装</a>
									</dd>
									<dd>
										<a href="javascript:;">童鞋</a>
									</dd>
									<dd>
										<a href="javascript:;">宝宝配饰</a>
									</dd>
								</dl>
								<dl>
									<dt>孕妈专区</dt>
									<dd>
										<a href="javascript:;">孕妇装</a>
									</dd>
									<dd>
										<a href="javascript:;">孕妇护肤</a>
									</dd>
									<dd>
										<a href="javascript:;">孕妇用品</a>
									</dd>
								</dl>
							</div>
						</div>



						<div class="right-cont-wrap">
							<div class="right-cont">
								<div class="sort layui-clear">
									<a class="active" href="javascript:;" event='volume'>價格</a> <a
										href="javascript:;" event='price'>銷量</a>

								</div>
								<div class="prod-number"></div>
								<div class="cont-list layui-clear" id="list-cont">
									<c:forEach var='product' items='${products }'>
										<div class="item">
											<div class="img">
												<a
													href="<spring:url value='/hao/product?id=${product.id }' />">
													<img width='280px' height='280px'
													src="<c:url value='/hao/getPicture/${product.id }' />">
												</a>
											</div>
											<div class="text">
												<p class="title">&nbsp;&nbsp;&nbsp;&nbsp;${product.name }
													<span class="pri"  style="float:right;font-size:20px;color:gray;"><del>${product.price+100 }元</del>&nbsp;&nbsp;&nbsp;&nbsp;</span>
												 </p>
												<p class="price">
													<button class="layui-btn  layui-btn-danger car-btn" style="width:140px;height:40px;float:left;"><i class="layui-icon layui-icon-cart-simple"></i>加入購物車</button>
													<span class="pri"  style="float:right;font-size:24px;">${product.price }元&nbsp;&nbsp;&nbsp;&nbsp;</span>
												</p>
											</div>
										</div>
									</c:forEach>
								</div>
								<div id="demo0" style="text-align: center;"></div>
							</div>
						</div>
					</div>
				</div>
			</div>




			<section>
				<div>
					<div class="container" style="text-align: center">
						<h1>商品清單</h1>
					</div>
				</div>
			</section>
			<hr
				style="height: 1px; border: none; color: #333; background-color: #333;">
			<section class="container">
				<c:forEach var='product' items='${products }'>
					<div class="col-sm-6 col-md-3" style="width: 360px; height: 360px">
						<div class="thumbnail" style="width: 320px; height: 340px">
							<img width='100' height='200'
								src="<c:url value='/hao/getPicture/${product.id }' />" />
							<div class="caption">
								<p>
									<b style='font-size: 16px;'>${product.name }</b>
								</p>
								<p>價格：${product.price }</p>
								<p>目前在庫數量：${product.reserve }</p>
								<p>
									<a href="<spring:url value='/hao/product?id=${product.id }' />"
										class="btn btn-primary"> <span
										class="glyphicon-info-sigh glyphicon"></span>詳細資料
									</a> <a
										href="<spring:url value='/hao/product/Update?id=${product.id }' />"
										class="btn btn-primary"> <span
										class="glyphicon-info-sigh glyphicon"></span>修改
									</a>
								</p>
							</div>
						</div>
					</div>
				</c:forEach>
			</section>
</body>
</html>