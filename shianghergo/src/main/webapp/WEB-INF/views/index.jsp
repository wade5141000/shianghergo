<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link rel="icon" href="images/logo4.ico"/>

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
	background: #fff url('images/bbg06.png') center center fixed;
	　
	　
}

.st1 {
	overflow: hidden;
	white-space: nowrap;
	text-overflow: ellipsis;
}
</style>
</head>

<body>
	<jsp:include page="/WEB-INF/views/eric/header.jsp"></jsp:include>
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
		<h2 class="h1-responsive font-weight-bold text-center my-5">十月熱銷商品</h2>
		<!-- Section description -->
		<div class="row">
			<c:forEach var='product' items='${aaa}' begin="1" end="4">

				<div class="col-lg-3 col-md-6 mb-lg-0 mb-4">
					<!-- Card -->
					<div class="card align-items-center">
						<!-- Card image -->
						<div class="view overlay">
							<a
								href="http://localhost:8080/shianghergo/hao/product?id=${product.id}"><img
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
								<strong> <a href="http://localhost:8080/shianghergo/hao/product?id=${product.id}" class="dark-grey-text">${product.name }
										<span class="badge badge-pill danger-color" style="color: red">HOT</span>
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
		<h2 class="h1-responsive font-weight-bold text-center my-5">超人氣優質團購</h2>
		<!-- Section description -->
		<div class="row">
			<c:forEach var='group' items='${bbb}' begin="1" end="4">
				<div class="col-lg-3 col-md-6 mb-lg-0 mb-4" style="word-break: break-all ;">
					<!-- Card -->
					<div class="card align-items-center" >

						<!-- Card image -->
						<div class="view overlay">
							<a
								href="http://localhost:8080/shianghergo/frank/group?gid=${group.id}"><img
								src="<c:url value='/frank/getgroupPicture/${group.id}' />"
								class="card-img-top" alt="" width='280px' height='280px'></a> <a>
								<div class="mask rgba-white-slight"></div>
							</a>
						</div> 
						<!-- Card image -->
						<!-- Card content -->
						<div class="card-body text-center">
							<!-- Category & Title -->
							<h5>
								<strong> <a href="http://localhost:8080/shianghergo/frank/group?gid=${group.id}" class="dark-grey-text">
										${group.memberBean.name} <span
										class="badge badge-pill danger-color" style="color: red">HOT</span>
								</a>
								</strong>
							</h5>
							<h4 class="font-weight-bold blue-text">
								<div>${group.name}</div>
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