<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<script>
	let flag = true;

	document.addEventListener("DOMContentLoaded", function() {

		let stars = document.querySelectorAll("img.s1");

		let starsLength = stars.length;

		for (let i = 0; i < starsLength; i++) {

			stars[i].addEventListener("mouseover", mouseOver);
			stars[i].addEventListener("mouseout", mouseOut);
			stars[i].addEventListener("click", Click);
		}

	});

	function mouseOver() {

		let n = this.id.charAt(4);

		flag = true;

		if (flag == true) {
			for (let i = 0; i < n; i++) {

				document.images[i - 1 + 3].src = '${pageContext.request.contextPath}/resources/images/chngstar.gif'

			}

		}

	}
	function mouseOut() {

		if (flag) {

			for (let i = 0; i < 5; i++) {

				document.images[i - 1 + 3].src = "${pageContext.request.contextPath}/resources/images/star.gif"

			}
		}
	}

	function Click() {

		flag = false;

		let n = this.id.charAt(4);

		for (let i = 0; i < n; i++) {

			document.images[i - 1 + 3].src = "${pageContext.request.contextPath}/resources/images/chngstar.gif"
			document.getElementById("str").innerHTML = "給" + (i + 1) + "星";
			document.getElementById("score").value = i + 1;
		}

	}

	function targer(myObj) {

		document.getElementById("item_id").value = myObj.value;
	}
	
	
	// wade 添加到購物車
	
	function goCart(x){
		$.ajax({
			url:"../gocart?itemid="+x,
			type:"get",
			success:function(data){
				alert("添加成功")
				var cartitems = JSON.parse(data);
				var itotal = 0;
				for(var q=0  ; q<cartitems.length ; q++){
					if(cartitems[q].amount >= 18) {
						itotal += Math.round((cartitems[q].price * cartitems[q].amount) * 0.7);
					}else if(cartitems[q].amount >= 12) {
						itotal += Math.round((cartitems[q].price * cartitems[q].amount) * 0.8);
					}else if(cartitems[q].amount >= 6) {
						itotal += Math.round((cartitems[q].price * cartitems[q].amount) * 0.9);
					}else {
						itotal += cartitems[q].price * cartitems[q].amount;
					}
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
// 					smalls += cartitems[k].price * cartitems[k].amount;
					if(cartitems[k].amount >= 18) {
						smalls += Math.round((cartitems[k].price * cartitems[k].amount) * 0.7);
						result += '<td><span id="' + cartitems[k].id + 'a" style="color:red;">'+ smalls +' (滿18件，享7折)</span></td>';
					}else if(cartitems[k].amount >= 12) {
						smalls += Math.round((cartitems[k].price * cartitems[k].amount) * 0.8);
						result += '<td><span id="' + cartitems[k].id + 'a" style="color:red;">'+ smalls +' (滿12件，享8折)</span></td>';
					}else if(cartitems[k].amount >= 6) {
						smalls += Math.round((cartitems[k].price * cartitems[k].amount) * 0.9);
						result += '<td><span id="' + cartitems[k].id + 'a" style="color:red;">'+ smalls +' (滿6件，享9折)</span></td>';
					}else {
						smalls += cartitems[k].price * cartitems[k].amount;
						result += '<td><span id="' + cartitems[k].id + 'a" style="color:red;">'+ smalls +'</span></td>';
					}
// 					result += '<td><span id="' + cartitems[k].id + 'a" style="color:red;">'+ smalls +'</span></td>';
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

	<div class="modal fade" id="exampleModal1" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel"
						style="margin-left: 180px; color: blue;">評價商品</h5>


					<div class="form-group">
						<label for="recipient-name" class="col-form-label"></label>
					</div>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form action="/shianghergo/hao/evaluationitem" method="POST">
						<div class="form-group">
							<label for="recipient-name" class="col-form-label">評分: </label> <img
								src="${pageContext.request.contextPath}/resources/images/star.gif"
								id="star1" class="s1"> <img
								src="${pageContext.request.contextPath}/resources/images/star.gif"
								id="star2" class="s1"> <img
								src="${pageContext.request.contextPath}/resources/images/star.gif"
								id="star3" class="s1"> <img
								src="${pageContext.request.contextPath}/resources/images/star.gif"
								id="star4" class="s1"> <img
								src="${pageContext.request.contextPath}/resources/images/star.gif"
								id="star5" class="s1">

						</div>
						<div>
							<span class="c1" id="str"></span>
						</div>


						<!--使用者會員ID -->
						<input type=hidden value="${loginOK.id}" name="member_id">
						<!--被評價的商家ID -->
						<input type=hidden value="1" name="item_id" id="item_id">
						<!--取的被選中的星星 -->
						<input type=hidden value="1" name="score" id="score">

						<div class="form-group">
							<label for="message-text" class="col-form-label">評價內容:</label>
							<textarea class="form-control" id="message-text" name="contents"></textarea>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary"
								data-dismiss="modal">清除</button>
							<button type="submit" class="btn btn-primary">確認評分</button>
						</div>
					</form>

				</div>
			</div>
		</div>
	</div>

	<div class="content content-nav-base datails-content">
		<div class="main-nav"></div>
		<div class="data-cont-wrap w1200" style="margin-top: 20px;">
			<div class="product-intro layui-clear" style="margin-top: 40px">
				<div class="preview-wrap">
					<p>
						<a href="javascript:;"><img width='350px' height='350px'
							src="<c:url value='/hao/getPicture/${product.id }' />"></a>
					</p>
					<p style="text-align: center"></p>
				</div>
				<div class="itemInfo-wrap">
					<div class="itemInfo">
						<div class="title">
							<h2 style="font-weight: bold;">${product.name}</h2>
						</div>
						<div class="summary" style="height: 425px">
							<p class="reference">
								<span>單&nbsp;&nbsp;&nbsp;&nbsp;價</span> ${product.price}元
							</p>
							<!--          <p class="activity"><span>商品編號</span><strong class="price"><i>￥</i>99.00</strong></p> -->
							<p class="address-box">
								<span>優&nbsp;&nbsp;&nbsp;&nbsp;惠</span><strong class="address">

									6入<fmt:formatNumber type="number"
										value="${product.price*6*0.9}" maxFractionDigits="0" />元（9折）
									<p>
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 12入
										<fmt:formatNumber type="number"
											value="${product.price*12*0.8}" maxFractionDigits="0" />
										元（8折）
									</p>
									<p>
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 18入
										<fmt:formatNumber type="number"
											value="${product.price*18*0.7}" maxFractionDigits="0" />
										元（7折）
									</p>
								</strong>
							</p>
							<p class="reference">
								<span>類&nbsp;&nbsp;&nbsp;&nbsp;別</span>
								${product.categoryBean.name}
							</p>
							<p class="reference">
								<span>介&nbsp;&nbsp;&nbsp;&nbsp;紹</span>${product.detail}
							</p>
							<p class="reference">
								<span>商&nbsp;&nbsp;&nbsp;&nbsp;家</span><a
									href="/shianghergo/hao/getStoreByProduct?id=${product.storeBean.id }">${product.storeBean.name }</a>
							</p>
						</div>

						<div class="choose-btns">
							<button class="layui-btn  layui-btn-danger car-btn" onclick="goCart(${product.id})">
								<i class="layui-icon layui-icon-cart-simple"></i>加入購物車
							</button>
							<input type="button" value="返回列表"
								onclick="location.href='<spring:url value='/hao/products' />'"
								class="layui-btn  layui-btn-danger car-btn">
							<button class="layui-btn  layui-btn-danger car-btn"
								data-toggle="modal" data-target="#exampleModal1" id="target"
								value='${product.id}' onclick="targer(this)">評價</button>

						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<h2 style="text-align:center;padding-bottom:15px">評價滿意度</h2>
	<c:forEach var='comment' items='${comment }'>
	<div style="padding-left:35%; padding-right:35%;">
		<div style="display:inline;"><img src="<c:url value='/resources/images/star_${comment.score }.gif' />"></div>
		<div style="display:inline;"><p style="text-align:right">${comment.time }</p></div>
		<p>會員：${comment.member_id }</p>
		<p style="text-align:left">${comment.contents }</p>
	</div>
	<div style="padding-left:35%; padding-right:35%">
		<hr style="color:gray;">
	</div>
	</c:forEach>
	<jsp:include page="/WEB-INF/views/eric/foot.jsp" />
</body>
</html>
