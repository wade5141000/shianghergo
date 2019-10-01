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
<jsp:include page="/WEB-INF/views/eric/header.jsp"></jsp:include>
<!-- Section: Blog v.1 -->
<section class="my-5">

  <!-- Section heading -->
  <h2 class="h1-responsive font-weight-bold text-center my-5">推!!!響合購優質賣家</h2>
  <!-- Section description -->
  <p class="text-center w-responsive mx-auto mb-5"></p>

  <!-- Grid row -->
  <div class="row">

    <!-- Grid column -->
    <div class="col-lg-5">

      <!-- Featured image -->
      <div class="view overlay rounded z-depth-2 mb-lg-0 mb-4">
        <img class="img-fluid" src="https://mdbootstrap.com/img/Photos/Others/img%20(27).jpg" alt="Sample image">
        <a>
          <div class="mask rgba-white-slight"></div>
        </a>
      </div>

    </div>
    <!-- Grid column -->

    <!-- Grid column -->
    <div class="col-lg-7">

      <!-- Category -->
      <a href="#!" class="green-text">
        <h6 class="font-weight-bold mb-3"><i class="fas fa-utensils pr-2"></i></h6>
      </a>
      <!-- Post title -->
      <h3 class="font-weight-bold mb-3"><strong>秋冬服飾優質賣家</strong></h3>
      <!-- Excerpt -->
      <p>Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime
        placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus et aut officiis debitis.</p>
      <!-- Post data -->
      <p>by <a><strong>Carine Fox</strong></a>, 19/08/2018</p>
      <!-- Read more button -->
      <a class="btn btn-success btn-md">Read more</a>

    </div>
    <!-- Grid column -->

  </div>
  <!-- Grid row -->

  <hr class="my-5">

  <!-- Grid row -->
  <div class="row">

    <!-- Grid column -->
    <div class="col-lg-7">

      <!-- Category -->
      <a href="#!" class="pink-text">
        <h6 class="font-weight-bold mb-3"><i class="fas fa-image pr-2"></i>Lifestyle</h6>
      </a>
      <!-- Post title -->
      <h3 class="font-weight-bold mb-3"><strong>Title of the news</strong></h3>
      <!-- Excerpt -->
      <p>At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum
        deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non
        provident.</p>
      <!-- Post data -->
      <p>by <a><strong>Carine Fox</strong></a>, 14/08/2018</p>
      <!-- Read more button -->
      <a class="btn btn-pink btn-md mb-lg-0 mb-4">Read more</a>

    </div>
    <!-- Grid column -->

    <!-- Grid column -->
    <div class="col-lg-5">

      <!-- Featured image -->
      <div class="view overlay rounded z-depth-2">
        <img class="img-fluid" src="https://mdbootstrap.com/img/Photos/Others/img%20(34).jpg" alt="Sample image">
        <a>
          <div class="mask rgba-white-slight"></div>
        </a>
      </div>

    </div>
    <!-- Grid column -->

  </div>
  <!-- Grid row -->

  <hr class="my-5">

  <!-- Grid row -->
  <div class="row">

    <!-- Grid column -->
    <div class="col-lg-5">

      <!-- Featured image -->
      <div class="view overlay rounded z-depth-2 mb-lg-0 mb-4">
        <img class="img-fluid" src="https://mdbootstrap.com/img/Photos/Others/img (28).jpg" alt="Sample image">
        <a>
          <div class="mask rgba-white-slight"></div>
        </a>
      </div>

    </div>
    <!-- Grid column -->

    <!-- Grid column -->
    <div class="col-lg-7">

      <!-- Category -->
      <a href="#!" class="indigo-text">
        <h6 class="font-weight-bold mb-3"><i class="fas fa-suitcase pr-2"></i>Travels</h6>
      </a>
      <!-- Post title -->
      <h3 class="font-weight-bold mb-3"><strong>Title of the news</strong></h3>
      <!-- Excerpt -->
      <p>Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur
        magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro qui dolorem ipsum quia sit amet.</p>
      <!-- Post data -->
      <p>by <a><strong>Carine Fox</strong></a>, 11/08/2018</p>
      <!-- Read more button -->
      <a class="btn btn-indigo btn-md">Read more</a>

    </div>
    <!-- Grid column -->

  </div>
  <!-- Grid row -->

</section>
<!-- Section: Blog v.1 -->
	
	<!-- Section: Blog v.1 -->
<jsp:include page="/WEB-INF/views/eric/foot.jsp"></jsp:include>
</body>
</html>