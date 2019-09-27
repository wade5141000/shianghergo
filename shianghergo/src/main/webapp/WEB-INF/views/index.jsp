<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<!-- lang="en" -->
<head>
  <meta charset="UTF-8">
  <title>饗合購</title>
<!--   <link rel="stylesheet" type="text/css" -->
<%-- 	href="${pageContext.request.contextPath}/res/static/css/footer.css"> --%>
    <link rel="stylesheet" href="http://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="http://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
	<script src="http://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/res/static/css/main.css">
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/res/layui/css/layui.css">
  <script type="text/javascript" src="${pageContext.request.contextPath}/res/layui/layui.js"></script>
  <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
  <meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">
  <!--  分隔線 -->
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
<!-- id="list-cont" -->
  <div class="site-nav-bg">
    <div class="site-nav w1200">
      <p class="sn-back-home">
        <i class="layui-icon layui-icon-home"></i>
        <a href="index">首頁</a>
      </p>
      <div class="sn-quick-menu">
      	<div class="login"><a href="productfile.s">訂購單</a></div>
      	<div class="login"><a href="wade/showmap">google map</a></div>
      	<div class="login"><a href="oldindex">舊index</a></div>
      	<div class="login"><a href="goRegisterPage">註冊</a></div>
        <div class="login"><a href="login">登入</a></div>
        <div class="sp-cart"><a href="cart">購物車</a><span>2</span></div>
      </div>
    </div>
  </div>

  <div class="header">
    <div class="headerLayout w1200">
      <div class="headerCon">
        <h1 class="mallLogo">
          <a href="index">
            <img src="${pageContext.request.contextPath}/res/static/img/logo4.png" width="100" height="100">
          </a>
        </h1>
        <div class="mallSearch">
        <form action='<c:url value="/Search.controller" />' method="get"  class="layui-form" novalidate>
            <input type="text" name="title" value="${param.title}" required  lay-verify="required" autocomplete="off" class="layui-input" placeholder="請輸入需要的商品" >
            <button class="layui-btn" lay-submit lay-filter="formDemo" type="submit">
                <i class="layui-icon layui-icon-search"></i>
            </button>
            <input type="submit" name="" value="">
          </form>
        </div>
      </div>
    </div>
  </div>


  <div class="content">
    <div class="main-nav">
      <div class="inner-cont0">
        <div class="inner-cont1 w1200">
          <div class="inner-cont2">
            <a href="hao/products" class="active">所有商品</a>
            <a href="frank/groups">我要團購</a>
            <a href="frank/Groups1">我要開團</a>
            <a href="hao/stores">商家瀏覽(暫)</a>
          </div>
        </div>
      </div>
    </div>
<%--      <jsp:include page="/WEB-INF/views/eric/header.jsp"></jsp:include> --%>
       <div id="myCarousel" class="carousel slide">
	
	<ol class="carousel-indicators">
		<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
		<li data-target="#myCarousel" data-slide-to="1"></li>
		<li data-target="#myCarousel" data-slide-to="2"></li>
	</ol>   
	
	<div class="carousel-inner">
		<div class="item active">
			<a href="${pageContext.request.contextPath}/eric/a" title="GO"><img src="${pageContext.request.contextPath}/res/static/img/1.png" alt="First slide" style="width:100%"></a>
		</div>
		<div class="item">
			<a href="${pageContext.request.contextPath}/eric/b" title="GO"><img src="${pageContext.request.contextPath}/res/static/img/2.png" alt="Second slide"style="width:100%"></a>
		</div>
		<div class="item">
			<a href="${pageContext.request.contextPath}/eric/a" title="GO"><img src="${pageContext.request.contextPath}/res/static/img/3.png" alt="Third slide" style="width:100%"></a>
		</div>
	</div>
	
	<a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
		<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
		<span class="sr-only">Previous</span>
	</a>
	<a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
		<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
		<span class="sr-only">Next</span>
	</a>
</div> 
    <div class="product-cont w1200" id="product-cont">

      <div class="product-item product-item2 layui-clear">
        <div class="left-title" style="height:420px">
          <h4><i>衣</i></h4>
          <img src="${pageContext.request.contextPath}/res/static/img/icon_gou.png">
          <h5>秋冬潮流</h5>
        </div>
        <div class="right-cont">
          <a href="javascript:;" class="top-img"><img src="${pageContext.request.contextPath}/res/static/img/cloth1.png" alt=""></a>
          <div class="img-box">
            <a href="javascript:;"><img src="${pageContext.request.contextPath}/res/static/img/+id+.jpg"></a>
            <a href="javascript:;"><img src="${pageContext.request.contextPath}/res/static/img/s_img8.jpg"></a>
            <a href="javascript:;"><img src="${pageContext.request.contextPath}/res/static/img/s_img9.jpg"></a>
            <a href="javascript:;"><img src="${pageContext.request.contextPath}/res/static/img/s_img10.jpg"></a>
            <a href="javascript:;"><img src="${pageContext.request.contextPath}/res/static/img/s_img11.jpg"></a>
          </div>
        </div>
      </div>
      
    </div>

    <div class="product-list-box" id="product-list-box">
      <div class="product-list-cont w1200">
        <h4>這裡下面顯示團購商家</h4>
        <div class="product-item-box layui-clear">
          <div class="list-item">
            <a href="javascript:;"><img src="${pageContext.request.contextPath}/res/static/img/more1.jpg"></a>
            <p>时尚宝宝小黄鸭T恤纯棉耐脏多色可选0-2岁宝宝</p>
            <span>￥100.00</span>
          </div>
          <div class="list-item">
            <a href="javascript:;"><img src="${pageContext.request.contextPath}/res/static/img/more2.jpg"></a>
            <p>时尚宝宝小黄鸭T恤纯棉耐脏多色可选0-2岁宝宝</p>
            <span>￥100.00</span>
          </div>
          <div class="list-item">
            <a href="javascript:;"><img src="${pageContext.request.contextPath}/res/static/img/more3.jpg"></a>
            <p>时尚宝宝小黄鸭T恤纯棉耐脏多色可选0-2岁宝宝</p>
            <span>￥100.00</span>
          </div>
          <div class="list-item">
            <a href="javascript:;"><img src="${pageContext.request.contextPath}/res/static/img/more1.jpg"></a>
            <p>时尚宝宝小黄鸭T恤纯棉耐脏多色可选0-2岁宝宝</p>
            <span>￥100.00</span>
          </div>
          <div class="list-item">
            <a href="javascript:;"><img src="${pageContext.request.contextPath}/res/static/img/more2.jpg"></a>
            <p>时尚宝宝小黄鸭T恤纯棉耐脏多色可选0-2岁宝宝</p>
            <span>￥100.00</span>
          </div>
          <div class="list-item">
            <a href="javascript:;"><img src="${pageContext.request.contextPath}/res/static/img/more3.jpg"></a>
            <p>时尚宝宝小黄鸭T恤纯棉耐脏多色可选0-2岁宝宝</p>
            <span>￥100.00</span>
          </div>
          <div class="list-item">
            <a href="javascript:;"><img src="${pageContext.request.contextPath}/res/static/img/more1.jpg"></a>
            <p>时尚宝宝小黄鸭T恤纯棉耐脏多色可选0-2岁宝宝</p>
            <span>￥100.00</span>
          </div>
          <div class="list-item">
            <a href="javascript:;"><img src="${pageContext.request.contextPath}/res/static/img/more2.jpg"></a>
            <p>时尚宝宝小黄鸭T恤纯棉耐脏多色可选0-2岁宝宝</p>
            <span>￥100.00</span>
          </div>
          <div class="list-item">
            <a href="javascript:;"><img src="${pageContext.request.contextPath}/res/static/img/more3.jpg"></a>
            <p>时尚宝宝小黄鸭T恤纯棉耐脏多色可选0-2岁宝宝</p>
            <span>￥100.00</span>
          </div>
          <div class="list-item">
            <a href="javascript:;"><img src="${pageContext.request.contextPath}/res/static/img/more1.jpg"></a>
            <p>时尚宝宝小黄鸭T恤纯棉耐脏多色可选0-2岁宝宝</p>
            <span>￥100.00</span>
          </div>
          
        </div>
      </div>
    </div>
  </div>
  <jsp:include page="/WEB-INF/views/eric/foot.jsp"></jsp:include>
</body>
</html>