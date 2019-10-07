<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>饗合購</title>
<!--     <link rel="stylesheet" href="http://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css"> -->
<!-- 	<script src="http://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script> -->
<!-- 	<script src="http://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script> -->
<!--  ---------------分隔線--------------------------------------------- -->


<!-- <script src="https://code.jquery.com/jquery-3.4.1.js" -->
<!-- 	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" -->
<!-- 	crossorigin="anonymous"></script> -->
<!-- <script -->
<!-- 	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" -->
<!-- 	integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" -->
<!-- 	crossorigin="anonymous"></script> -->
<!-- <link rel="stylesheet" -->
<!-- 	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" -->
<!-- 	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" -->
<!-- 	crossorigin="anonymous"> -->
<!-- <script -->
<!-- 	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" -->
<!-- 	integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" -->
<!-- 	crossorigin="anonymous"></script> -->

<!-- <link rel="stylesheet" -->
<!-- 	href="https://unpkg.com/bootstrap-table@1.15.4/dist/bootstrap-table.min.css"> -->
<!-- <script -->
<!-- 	src="https://unpkg.com/bootstrap-table@1.15.4/dist/bootstrap-table.min.js"></script> -->
<!-- <script -->
<!-- 	src="https://unpkg.com/bootstrap-table@1.15.4/dist/locale/bootstrap-table-zh-TW.min.js"></script> -->

<!-- <link href="https://fonts.googleapis.com/icon?family=Material+Icons" -->
<!-- 	rel="stylesheet"> -->
<style type="text/css">
body {
	margin: 0px;
	padding: 0px;
	background: #fff url('images/bbg06.png') center center fixed ;
	　 
	　
}
</style>
</head>

<body>
	<jsp:include page="/WEB-INF/views/eric/header.jsp"></jsp:include>
	<!-- id="list-cont" -->
	<!--   <div class="site-nav-bg"> -->
	<!--     <div class="site-nav w1200"> -->
	<!--       <p class="sn-back-home"> -->
	<!--         <i class="layui-icon layui-icon-home"></i> -->
	<!--         <a href="index">首頁</a> -->
	<!--       </p> -->
	<!--       <div class="sn-quick-menu"> -->
	<!--       	<div class="login"><a href="fortest">測試</a></div> -->
	<!--       	<div class="login"><a href="productfile.s">訂購單</a></div> -->
	<!--       	<div class="login"><a href="wade/showmap">google map</a></div> -->
	<!--       	<div class="login"><a href="oldindex">舊index</a></div> -->
	<!--       	<div class="login"><a href="goRegisterPage">註冊</a></div> -->
	<!--         <div class="login"><a href="login">登入</a></div> -->
	<!--         <div class="sp-cart"><a href="cart">購物車</a><span>2</span></div> -->
	<!--       </div> -->
	<!--     </div> -->
	<!--   </div> -->
	<!--   <div class="header"> -->
	<!--     <div class="headerLayout w1200"> -->
	<!--       <div class="headerCon"> -->
	<!--         <h1 class="mallLogo"> -->
	<!--           <a href="index"> -->
	<%--             <img src="${pageContext.request.contextPath}/res/static/img/logo4.png" width="100" height="100"> --%>
	<!--           </a> -->
	<!--         </h1> -->
	<!--         <div class="mallSearch"> -->
	<%--         <form action='<c:url value="/Search.controller" />' method="get"  class="layui-form" novalidate> --%>
	<%--             <input type="text" name="title" value="${param.title}" required  lay-verify="required" autocomplete="off" class="layui-input" placeholder="請輸入需要的商品" > --%>
	<!--             <button class="layui-btn" lay-submit lay-filter="formDemo" type="submit"> -->
	<!--                 <i class="layui-icon layui-icon-search"></i> -->
	<!--             </button> -->
	<!--             <input type="submit" name="" value=""> -->
	<!--           </form> -->
	<!--         </div> -->
	<!--       </div> -->
	<!--     </div> -->
	<!--   </div> -->
	<!--     <div class="main-nav"> -->
	<!--       <div class="inner-cont0"> -->
	<!--         <div class="inner-cont1 w1200"> -->
	<!--           <div class="inner-cont2"> -->
	<!--             <a href="hao/products" class="active">所有商品</a> -->
	<!--             <a href="frank/groups">我要團購</a> -->
	<!--             <a href="frank/Groups1">我要開團</a> -->
	<!--             <a href="hao/stores">商家瀏覽(暫)</a> -->
	<!--           </div> -->
	<!--         </div> -->
	<!--       </div> -->
	<!--     </div> -->
	<div id="carouselExampleIndicators" class="carousel slide"
		data-ride="carousel" style="width: 1500px; text-align: center; margin: 0 auto">
		<ol class="carousel-indicators">
			<li data-target="#carouselExampleIndicators" data-slide-to="0"
				class="active"></li>
			<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
			<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
		</ol>
		<div class="carousel-inner">
			<div class="carousel-item active">
				<a href="${pageContext.request.contextPath}/eric/b" title="GO"><img
					class="d-block w-100"
					src="${pageContext.request.contextPath}/res/static/img/indexc.jpg"
					alt="First slide"></a>
			</div>
			<div class="carousel-item">
				<a href="${pageContext.request.contextPath}/eric/a" title="GO"><img
					class="d-block w-100"
					src="${pageContext.request.contextPath}/res/static/img/indexa.png"
					alt="Second slide"></a>
			</div>
			<div class="carousel-item">
				<a href="${pageContext.request.contextPath}/eric/c" title="GO"><img
					class="d-block w-100"
					src="${pageContext.request.contextPath}/res/static/img/indexcc.png"
					alt="Third slide"></a>
			</div>
		</div>
		<a class="carousel-control-prev" href="#carouselExampleIndicators"
			role="button" data-slide="prev"> <span
			class="carousel-control-prev-icon" aria-hidden="true"></span> <span
			class="sr-only">Previous</span>
		</a> <a class="carousel-control-next" href="#carouselExampleIndicators"
			role="button" data-slide="next"> <span
			class="carousel-control-next-icon" aria-hidden="true"></span> <span
			class="sr-only">Next</span>
		</a>
	</div>
	<div style="width: 1500px; text-align: center; margin: 0 auto">
	<section class="text-center my-5">
		<!-- Section heading -->
		<h2 class="h1-responsive font-weight-bold text-center my-5">十月熱銷</h2>
		<!-- Section description -->
		<div class="row">
			<c:forEach var='product' items='${aaa}' begin="1" end="4">

				<div class="col-lg-3 col-md-6 mb-lg-0 mb-4">
					<!-- Card -->
					<div class="card align-items-center">
						<!-- Card image -->
						<div class="view overlay">
							<a href="http://localhost:8080/shianghergo/hao/product?id=${product.id}"><img
								src="<c:url value='/hao/getPicture/${product.id }' />"
								class="card-img-top" alt="" width='280px' height='280px'></a> <a>
								<div class="mask rgba-white-slight"></div>
							</a>
						</div>
						<!-- Card image -->
						<!-- Card content -->
						<div class="card-body text-center">
							<!-- Category & Title -->
							<h5>
								<strong> <a href="" class="dark-grey-text">${product.name }
										<span class="badge badge-pill danger-color" style="color:red">HOT</span>
								</a>
								</strong>
							</h5>
							<h4 class="font-weight-bold blue-text">
								<strong>${product.price }$</strong>
							</h4>
						</div>
						<!-- Card content -->
					</div>
					<!-- Card -->
				</div>

			</c:forEach>
		</div>
	</section>
	<section class="text-center my-5">


		<!-- Section heading -->
		<h2 class="h1-responsive font-weight-bold text-center my-5">十月優質商家</h2>
		<!-- Section description -->
		<div class="row">
			<c:forEach var='group' items='${bbb}' begin="1" end="4">

				<div class="col-lg-3 col-md-6 mb-lg-0 mb-4">
					<!-- Card -->
					<div class="card align-items-center">

						<!-- Card image -->
						<div class="view overlay">
							<a href="http://localhost:8080/shianghergo/frank/product?id= ${group.memberBean.id}"><img
								src="<c:url value='/frank/getPicture/ ${group.memberBean.id}' />"
								class="card-img-top" alt=""></a> <a>
								<div class="mask rgba-white-slight"></div>
							</a>
						</div>
						<!-- Card image -->
						<!-- Card content -->
						<div class="card-body text-center">
							<!-- Category & Title -->
							<h5>
								<strong> <a href="" class="dark-grey-text"> ${group.memberBean.name}
										<span class="badge badge-pill danger-color" style="color:red">HOT</span>
								</a>
								</strong>
							</h5>
							<h4 class="font-weight-bold blue-text">
								<strong>${group.detail}</strong>
							</h4>
						</div>
						<!-- Card content -->
					</div>
					<!-- Card -->
				</div>

			</c:forEach>
		</div>
	</section>
</div>
	<jsp:include page="/WEB-INF/views/eric/foot.jsp"></jsp:include>
	<script src="//cdn.bootcss.com/canvas-nest.js/1.0.1/canvas-nest.min.js"></script>
</body>
</html>