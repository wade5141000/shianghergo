<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<link rel="icon" href="images/logo4.ico"/>
<meta charset="UTF-8">
<title>慶中秋 來響合購</title>

</head>
<body>

	<jsp:include page="/WEB-INF/views/eric/header.jsp"></jsp:include>


	<div class="content content-nav-base information-content">
		<!-- Section: Blog v.1 -->
		<!-- Section: Magazine v.2 -->
		<section class="magazine-section my-5">

			<!-- Section heading -->
			<h2 class="h1-responsive font-weight-bold text-center my-5"></h2>
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
									<i class="fas fa-utensils pr-2"></i>
								</h6>
							</a>
						</div>

						<!-- Excerpt -->
						<h3 class="font-weight-bold dark-grey-text mb-3">
							<a>慶中秋 來響合購</a>
						</h3>
						<p class="dark-grey-text mb-lg-0 mb-md-5 mb-4"></p>

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
								

								
								<div class="d-flex justify-content-between">
									<div class="col-11 text-truncate pl-0 mb-3">
										<a href="http://localhost:8080/shianghergo/hao/product?id=50002" class="btn btn-success btn-md">了解更多 Go</a>
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
										src="${pageContext.request.contextPath}/res/static/img/澎湖大生蠔.jpg"
										alt="Sample image"> <a>
										<div class="mask rgba-white-slight"></div>
									</a>
								</div>

							</div>
							<!-- Grid column -->

							<!-- Grid column -->
							<div class="col-md-9">

								<!-- Excerpt -->
								<p class="font-weight-bold dark-grey-text">澎湖大生蠔</p>
								<p class="font-weight-bold dark-grey-text">食用牡蠣的好處很多，牡蠣不僅味道鮮美，營養價值更是不在話下</p>
								

								
								<div class="d-flex justify-content-between">
									<div class="col-11 text-truncate pl-0 mb-3">
										<a href="http://localhost:8080/shianghergo/hao/product?id=50002" class="btn btn-success btn-md">了解更多 Go</a>
									</div>
									<a><i class="fas fa-angle-double-right"></i></a>
								</div>

							</div>
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
								<div class="view overlay rounded z-depth-1 mb-4">
									<img class="img-fluid"
										src="${pageContext.request.contextPath}/res/static/img/北海道干貝.jpg"
										alt="Sample image"> <a>
										<div class="mask rgba-white-slight"></div>
									</a>
								</div>

							</div>
							<!-- Grid column -->

							<!-- Grid column -->
							<div class="col-md-9">

								<!-- Excerpt -->
								<p class="font-weight-bold dark-grey-text">北海道干貝</p>
								<p class="font-weight-bold dark-grey-text">嚴選日本北海道野生捕撈的巨大帶子,新鮮干貝捕撈上岸後,急速冷凍,保持鮮甜</p>
								

								
								<div class="d-flex justify-content-between">
									<div class="col-11 text-truncate pl-0 mb-3">
										<a href="http://localhost:8080/shianghergo/hao/product?id=50002" class="btn btn-success btn-md">了解更多 Go</a>
									</div>
									<a><i class="fas fa-angle-double-right"></i></a>
								</div>
					<!-- Small news -->

				</div>
				<!--Grid column-->

			</div>
			<!-- Grid row -->

		</section>
		<!-- Section: Magazine v.2 -->
	</div>

	
	<!-- Section: Blog v.1 -->
	<jsp:include page="/WEB-INF/views/eric/foot.jsp"></jsp:include>
</body>
</html>
