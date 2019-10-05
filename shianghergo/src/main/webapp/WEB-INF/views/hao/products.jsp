<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
<head>
<meta charset="UTF-8">
<title>Products</title>
<!-- <link rel="stylesheet" -->
<!-- 	href="http://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css"> -->
<!-- <script src="http://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script> -->
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
<script src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
<script>
	function goCart(x){
		$.ajax({
			url:"../gocart?itemid="+x,
			type:"get",
			success:function(data){
				alert("添加成功")
				var cartitems = JSON.parse(data);
				var itotal = 0;
				for(var q=0  ; q<cartitems.length ; q++){
					itotal += cartitems[q].price * cartitems[q].amount;
				}
				$("#itable").empty();
				
				var result = "<table class='tb'>";
				
				for(var k=0  ; k<cartitems.length ; k++){
					if(k==0){
						result += "<tr><th></th><th>品名</th><th>數量</th><th>單價</th><th>小計</th><th>操作</th></tr>";
					}
					result += '<tr>';
					result += '<td><img src="http://localhost:8080/shianghergo/wade/getPicture/'+cartitems[k].item_id+'" width="50px" height="50px"></td>';
					result += '<td>' + cartitems[k].name + '</td>';
					result += '<td><button class="btn btn-outline-danger btn1" onclick="changeAmount(' + cartitems[k].id + ',2)">-</button ><span id="' + cartitems[k].id + '">'+ cartitems[k].amount + '</span><button onclick="changeAmount(' +cartitems[k].id+ ',1)" class="btn btn-outline-success btn2">+</button>&nbsp;&nbsp;</td>';
					result += '<td>' + cartitems[k].price + '</td>';
					
					var smalls = 0;
					smalls += cartitems[k].price * cartitems[k].amount;
					
					result += '<td><span id="' + cartitems[k].id + 'a" style="color:red;">'+ smalls +'</span></td>';
					result += '<td><button class="btn btn-danger" onclick="deletetr(this,' + cartitems[k].id + ')">刪除</button></td>';

					if(k == (cartitems.length-1)){
						result += "<tr><td/><td/><td/><td/><td>";
						result += '<span class="total">Total:</span><span id="total" class="total" style="color:red;">'+itotal+'</span></td>';
						result += "<td></td></tr></table>";
					}
					
				}
				
				$("#itable").append(result);
				$("#its").text(cartitems.length);
				
			},
		})
	}
</script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/eric/header.jsp"></jsp:include>

	<div class="content content-nav-base commodity-content">
		<div class="commod-cont-wrap">
			<div class="commod-cont w1200 layui-clear">
				<div class="left-nav">
					<div class="list-box" style="background-color: #FFE5B5">
						<dl style="background-color: #FFE5B5">
							<dd style="background-color: #FFB01C;text-align:center">
								所有分類
							</dd>
							<dd>
								<a href="${pageContext.request.contextPath}/hao/products">全品項</a>
							</dd>
							<dd>
								<a href="${pageContext.request.contextPath}/hao/productsByCategory?category_id=60001">團購美食</a>
							</dd>
							<dd>
								<a href="${pageContext.request.contextPath}/hao/productsByCategory?category_id=60002">保養美妝</a>
							</dd>
							<dd>
								<a href="${pageContext.request.contextPath}/hao/productsByCategory?category_id=60003">服飾配件</a>
							</dd>
							<dd>
								<a href="${pageContext.request.contextPath}/hao/productsByCategory?category_id=60004">育兒親子</a>
							</dd>
							<dd>
								<a href="${pageContext.request.contextPath}/hao/productsByCategory?category_id=60005">生鮮食品</a>
							</dd>
						</dl>
					</div>
				</div>

				<div class="right-cont-wrap">
					<div class="right-cont">
						<div class="prod-number"></div>
						<div class="cont-list layui-clear" id="list-cont">
							<c:forEach var='product' items='${products }'>
								<div class="item" style="height: 390px;">
									<div class="img">
										<a
											href="<spring:url value='/hao/product?id=${product.id }' />">
											<img width='280px' height='280px'
											src="<c:url value='/hao/getPicture/${product.id }' />">
										</a>
									</div>
									<div class="text">
										<p class="title">
											<strong>&nbsp;&nbsp;&nbsp;&nbsp;${product.name }</strong> <span class="pri"
												style="float: right; font-size: 20px; color: gray;"><del>${product.storeBean.id}元</del>&nbsp;&nbsp;&nbsp;&nbsp;</span>
										</p>
										<p class="price">
											<button class="layui-btn  layui-btn-danger car-btn"
												style="width: 140px; height: 40px; float: left;">
												<i class="layui-icon layui-icon-cart-simple"></i>加入購物車
											</button>
											<span class="pri" style="float: right; font-size: 20px;">${product.price }元&nbsp;&nbsp;&nbsp;&nbsp;</span>
										</p>
									</div>
								</div>
							</c:forEach>
							
							
<%-- 							<c:forEach var="score" items="scores"> --%>
<%-- 							</c:forEach> --%>
							
							
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
				<a href="../cart">進入購物車</a>
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
							<button onclick="goCart(${product.id})">加入購物車</button>
						</p>
					</div>
				</div>
			</div>
		</c:forEach>
	</section>
	<jsp:include page="/WEB-INF/views/eric/foot.jsp" />
</body>
</html>