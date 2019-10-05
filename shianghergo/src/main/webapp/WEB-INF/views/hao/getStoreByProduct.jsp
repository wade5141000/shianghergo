<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
<meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">
<title>Store</title>
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

				document.images[i - 1 + 2].src = '${pageContext.request.contextPath}/resources/images/chngstar.gif'

			}

		}

	}
	function mouseOut() {

		if (flag) {

			for (let i = 0; i < 5; i++) {

				document.images[i - 1 + 2].src = "${pageContext.request.contextPath}/resources/images/star.gif"

			}
		}
	}

	function Click() {

		flag = false;

		let n = this.id.charAt(4);

		for (let i = 0; i < n; i++) {

			document.images[i - 1 + 2].src = "${pageContext.request.contextPath}/resources/images/chngstar.gif"
			document.getElementById("str").innerHTML = "是否要給" + (i + 1) + "分";
			document.getElementById("score").value = i + 1;
		}

	}

	function reportTarger(myObj) {

		document.getElementById("target").value = myObj.value;
	}

	function scoreTarger(myObj) {

		document.getElementById("scoretarget").value = myObj.value;
	}
</script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/eric/header.jsp" />

	<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel"
						style="margin-left: 180px; color: blue;">檢舉商家</h5>


					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">

					<form action="/shianghergo/hao/SaveRS" method="POST">
						<div class="form-group">
							<label for="recipient-name" class="col-form-label">檢舉類別:</label>
							<select name="category_report_id" class="select">
								<c:forEach var='items' items='${list}'>
									<option value="${items.id}">${items.name}</option>
								</c:forEach>
							</select>
						</div>
						<input type="hidden" value="${loginOK.id}" name="member_id"> <input
							type=hidden value="1" id="target" name="store_id">

						<div class="form-group">
							<label for="message-text" class="col-form-label">檢舉內容:</label>
							<textarea class="form-control" id="message-text" name="contents"></textarea>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary"
								data-dismiss="modal">清除</button>
							<button type="submit" class="btn btn-primary">確認檢舉</button>
						</div>
					</form>

				</div>
			</div>
		</div>
	</div>

	<!-- //會員評價商家 -->

	<div class="modal fade" id="exampleModal1" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel"
						style="margin-left: 180px; color: blue;">評價商家</h5>


					<div class="form-group" style="text-align: center;">
						<label for="recipient-name" class="col-form-label"></label>
					</div>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">


					<form action="/shianghergo/hao/evaluationStore" method="POST">
						<div class="form-group">
							<label for="recipient-name" class="col-form-label">評分對象:
							</label> <img
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
						<input type=hidden value="1" id="scoretarget" name="store_id">
						<!--取的被選中的星星 -->
						<input type=hidden value="1" name="score" id="score">

						<div class="form-group">
							<label for="message-text" class="col-form-label">評價內容:</label>
							<textarea class="form-control" id="message-text" name="contents"></textarea>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary"
								data-dismiss="modal">清除</button>
							<button type="submit" class="btn btn-primary">確認評分${Stores.id}</button>
						</div>
					</form>

				</div>
			</div>
		</div>
	</div>

	<div style="padding-bottom: 50px;">
		<div style="padding-left: 350px; padding-right: 350px;"
			class="card text-center">
			<div class="card-header" style="margin-top: 25px; margin-top: 10px;">
				<h1>商店資訊</h1>
			</div>
			<div class="card-body">
				<p class="card-text">商家編號：${store.id}</p>
				<br>
				<p class="card-text">商店名稱：${store.name}</p>
				<br>
				<p class="card-text">商店介紹：${store.detail}</p>
				<br>
				<p class="card-text">
					<c:set var="status" scope="session" value="${store.status}" />
					<c:if test="${status==1 }">
						<p>商店狀態：正常</p>
					</c:if>
					<c:if test="${status==2 }">
						<p>商店狀態：禁用</p>
					</c:if>
					<c:if test="${status==3 }">
						<p>商店狀態：關閉</p>
					</c:if>
				</p>
			</div>
			<div
				style="padding-left: 20px; padding-top: 30px; height: 90px; text-align: center"
				class="card-footer text-muted">
				<button class="btn btn-primary" onclick="scoreTarger(this)"
					data-toggle="modal" data-target="#exampleModal1" value="${store.id }">評價</button>
				<button class="btn btn-danger" onclick="reportTarger(this)"
					data-toggle="modal" data-target="#exampleModal" value="${store.id}">檢舉</button>
				<a href="${pageContext.request.contextPath}/productfile.s"><button
						class="btn btn-success">Excel下載</button></a>
			</div>
		</div>
	</div>





	<div
		style="padding-bottom: 50px; margin-left: 265px; padding-right: 350px; padding-left: 85px">
		<div class="card" style="padding-bottom: 35px; border: white">
			<h1 class="card-header" style="text-align: center">商品列表</h1>
		</div>
		<div class="card-deck">
			<c:forEach var='product' items='${products }' varStatus="status">
				<div class="card">
					<a href="<spring:url value='/hao/product?id=${product.id }' />">
						<img width='140' height='200'
						src="<c:url value='/hao/getPicture/${product.id }' />"
						class="card-img-top" alt="...">
					</a>
					<div class="card-body">
						<h5 class="card-title">品名:${product.name }</h5>
						<p class="card-text">說明：${product.detail }</p>
						<p class="card-text">說明：${product.id }</p>

					</div>
				</div>
				<c:if test="${(status.index % 5) == 4}">
		</div>
		<div class="card-deck">
			</c:if>
			<c:if test="${status.last}">
				<c:if test="${(status.index+1) % 5 != 0}">
					<c:forEach var='abc' items='${products}' varStatus="i">
						<c:if test="${i.index < -(((status.index+1)%5) -5)}">
							<div class="card" style="border: 1px solid white"></div>
						</c:if>
					</c:forEach>
				</c:if>
			</c:if>
			</c:forEach>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/eric/foot.jsp" />
</body>
</html>
