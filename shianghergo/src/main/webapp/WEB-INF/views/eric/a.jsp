<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Document</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/res/static/css/footer.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/res/static/css/header.css">
<link rel="stylesheet" type="text/css" href="../res/static/css/main.css">
<!-- <link rel="stylesheet" type="text/css" href="../res/layui/css/layui.css"> -->
<script type="text/javascript" src="../res/layui/layui.js"></script>
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
<meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">

<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
	integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
	integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
	crossorigin="anonymous"></script>

<link rel="stylesheet"
	href="https://unpkg.com/bootstrap-table@1.15.4/dist/bootstrap-table.min.css">
<script
	src="https://unpkg.com/bootstrap-table@1.15.4/dist/bootstrap-table.min.js"></script>
<script
	src="https://unpkg.com/bootstrap-table@1.15.4/dist/locale/bootstrap-table-zh-TW.min.js"></script>

<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">

</head>
<body>
<!-- header fix -->
	<div class="site-nav-bg" style="height:30px">
		<div class="site-nav w1200">
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
	<nav class="navbar navbar-expand-lg navbar-light bg-light" style="width:100%">
		<a href="index.jsp"> <img src="../res/static/img/logo4.png"
			width="100" height="100">
		</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active"><a class="nav-link" href="#">首頁
						<span class="sr-only">(current)</span>
				</a></li>
				<li class="nav-item"><a class="nav-link" href="hao/products">所有商品</a></li>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="frank/groups" id="navbarDropdown"
					role="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false">今日團購 </a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdown">
						<a class="dropdown-item" href="#">下拉表單1</a> <a
							class="dropdown-item" href="#">下拉表單2</a>
						<div class="dropdown-divider"></div>
					</div></li>
				<li class="nav-item"><a class="nav-link" href="#">我要開團</a></li>

			</ul>
			<form action='<c:url value="/Search.controller" />' method="get" class="form-inline my-2 my-lg-0">
				<input class="form-control mr-sm-2" type="text" name="title"
					value="${param.title}" autocomplete="off" placeholder="請輸入需要的商品"
					aria-label="Search">
				<button class="btn btn-outline-success my-2 my-sm-0" type="submit">GO</button>
			</form>
		</div>
	</nav>
	<!-- header fix -->

	<div class="content content-nav-base information-content">
		<!-- Section: Blog v.1 -->
		<!-- Section: Magazine v.2 -->
		<section class="magazine-section my-5">

			<!-- Section heading -->
			<h2 class="h1-responsive font-weight-bold text-center my-5">_</h2>
			<!-- Section description -->

			<!-- Grid row -->
			<div class="row">

				<!-- Grid column -->
				<div class="col-lg-6 col-md-12">

					<!-- Featured news -->
					<div class="single-news mb-lg-0 mb-4">

						<!-- Image -->
						<div class="view overlay rounded z-depth-1-half mb-4">
							<img class="img-fluid"
								src="${pageContext.request.contextPath}/res/static/img/a-meat.jpg"
								alt="Sample image"> <a>
								<div class="mask rgba-white-slight"></div>
							</a>
						</div>

						<!-- Data -->
						<div class="news-data d-flex justify-content-between">
							<a href="#!" class="deep-orange-text">
								<h6 class="font-weight-bold">
									<i class="fas fa-utensils pr-2"></i>Culinary
								</h6>
							</a>
						</div>

						<!-- Excerpt -->
						<h3 class="font-weight-bold dark-grey-text mb-3">
							<a>Title of the news</a>
						</h3>
						<p class="dark-grey-text mb-lg-0 mb-md-5 mb-4">Sed ut
							perspiciatis unde voluptatem omnis iste natus error sit
							voluptatem accusantium doloremque laudantium, totam rem aperiam,
							eaque ipsa quae ab illo inventore veritatis et quasi architecto
							beatae vitae explicabo. Duis aute irure dolor in reprehenderit in
							voluptate velit esse cillum dolore eu fugiat.</p>

					</div>
					<!-- Featured news -->

				</div>
				<!-- Grid column -->

				<!-- Grid column -->
				<div class="col-lg-6 col-md-12">

					<!-- Small news -->
					<div class="single-news mb-4">

						<!-- Grid row -->
						<div class="row">

							<!-- Grid column -->
							<div class="col-md-3">

								<!--Image-->
								<div class="view overlay rounded z-depth-1 mb-4">
									<img class="img-fluid"
										src="${pageContext.request.contextPath}/res/static/img/天使紅蝦.jpg"
										alt="Sample image"> <a>
										<div class="mask rgba-white-slight"></div>
									</a>
								</div>

							</div>
							<!-- Grid column -->

							<!-- Grid column -->
							<div class="col-md-9">

								<!-- Excerpt -->
								<p class="font-weight-bold dark-grey-text">天使紅蝦 挑戰最低價</p>
								<p class="font-weight-bold dark-grey-text">天使蝦來自阿根廷,南部海域純淨無汙染,這種環境生長的天使紅蝦,營養豐富,口感鮮嫩</p>
								<p class="font-weight-bold dark-grey-text">急速冷凍,高檔食材,中秋海鮮首選!!!

								
								<div class="d-flex justify-content-between">
									<div class="col-11 text-truncate pl-0 mb-3">
										<a href="#!" class="btn btn-success btn-md">了解更多 Go</a>
									</div>
									<a><i class="fas fa-angle-double-right"></i></a>
								</div>

							</div>
							<!-- Grid column -->

						</div>
						<!-- Grid row -->

					</div>
					<!-- Small news -->

					<!-- Small news -->
					<div class="single-news mb-4">

						<!-- Grid row -->
						<div class="row">

							<!-- Grid column -->
							<div class="col-md-3">

								<!--Image-->
								<div class="view overlay rounded z-depth-1 mb-4">
									<img class="img-fluid"
										src="https://mdbootstrap.com/img/Photos/Horizontal/Food/4-col/img%20(45).jpg"
										alt="Sample image"> <a>
										<div class="mask rgba-white-slight"></div>
									</a>
								</div>

							</div>
							<!-- Grid column -->

							<!-- Grid column -->
							<div class="col-md-9">

								<!-- Excerpt -->
								<p class="font-weight-bold dark-grey-text">25/02/2018</p>
								<div class="d-flex justify-content-between">
									<div class="col-11 text-truncate pl-0 mb-3">
										<a href="#!" class="dark-grey-text">Itaque earum rerum hic
											tenetur a sapiente delectus</a>
									</div>
									<a><i class="fas fa-angle-double-right"></i></a>
								</div>

							</div>
							<!-- Grid column -->

						</div>
						<!-- Grid row -->

					</div>
					<!-- Small news -->

					<!-- Small news -->
					<div class="single-news mb-4">

						<!-- Grid row -->
						<div class="row">

							<!-- Grid column -->
							<div class="col-md-3">

								<!--Image-->
								<div class="view overlay rounded z-depth-1 mb-4">
									<img class="img-fluid"
										src="https://mdbootstrap.com/img/Photos/Others/images/87.jpg"
										alt="Sample image"> <a>
										<div class="mask rgba-white-slight"></div>
									</a>
								</div>

							</div>
							<!-- Grid column -->

							<!-- Grid column -->
							<div class="col-md-9">

								<!-- Excerpt -->
								<p class="font-weight-bold dark-grey-text">24/02/2018</p>
								<div class="d-flex justify-content-between">
									<div class="col-11 text-truncate pl-0 mb-3">
										<a href="#!" class="dark-grey-text">Soluta nobis est
											eligendi optio cumque nihil impedit quo minus</a>
									</div>
									<a><i class="fas fa-angle-double-right"></i></a>
								</div>

							</div>
							<!-- Grid column -->

						</div>
						<!-- Grid row -->

					</div>
					<!-- Small news -->

					<!-- Small news -->
					<div class="single-news">

						<!-- Grid row -->
						<div class="row">

							<!-- Grid column -->
							<div class="col-md-3">

								<!--Image-->
								<div class="view overlay rounded z-depth-1 mb-md-0 mb-4">
									<img class="img-fluid"
										src="https://mdbootstrap.com/img/Photos/Others/img%20(27).jpg"
										alt="Sample image"> <a>
										<div class="mask rgba-white-slight"></div>
									</a>
								</div>

							</div>
							<!-- Grid column -->

							<!-- Grid column -->
							<div class="col-md-9">

								<!-- Excerpt -->
								<p class="font-weight-bold dark-grey-text">23/02/2018</p>
								<div class="d-flex justify-content-between">
									<div class="col-11 text-truncate pl-0 mb-lg-3">
										<a href="#!" class="dark-grey-text">Duis aute irure dolor
											in reprehenderit in voluptate</a>
									</div>
									<a><i class="fas fa-angle-double-right"></i></a>
								</div>

							</div>
							<!-- Grid column -->

						</div>
						<!-- Grid row -->

					</div>
					<!-- Small news -->

				</div>
				<!--Grid column-->

			</div>
			<!-- Grid row -->

		</section>
		<!-- Section: Magazine v.2 -->
	</div>
	</div>
	<!-- Section: Blog v.1 -->
	<jsp:include page="/WEB-INF/views/eric/foot.jsp"></jsp:include>
</body>
</html>
