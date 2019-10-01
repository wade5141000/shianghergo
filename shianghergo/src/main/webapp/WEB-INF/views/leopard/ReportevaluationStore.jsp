<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
<head>
<meta charset="UTF-8">
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
	integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS"
	crossorigin="anonymous">

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"
	integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"
	integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k"
	crossorigin="anonymous"></script>

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

				document.images[i - 1 + 1].src = '${pageContext.request.contextPath}/resources/images/chngstar.gif'

			}

		}

	}
	function mouseOut() {

		if (flag) {

			for (let i = 0; i < 5; i++) {

				document.images[i - 1 + 1].src = "${pageContext.request.contextPath}/resources/images/star.gif"

			}
		}
	}

	function Click() {

		flag = false;

		let n = this.id.charAt(4);

		for (let i = 0; i < n; i++) {

			document.images[i - 1 + 1].src = "${pageContext.request.contextPath}/resources/images/chngstar.gif"
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
<style>
* {
	font-family: 微軟正黑體;
}

.s1 {
	width: 40px;
}
</style>
</head>
<body>

	<!--//會員檢舉商家 -->
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

					<form action="SaveRS" method="POST">
						<div class="form-group">
							<label for="recipient-name" class="col-form-label">檢舉類別:</label>
							<select name="category_report_id" class="select">
								<c:forEach var='items' items='${list}'>
									<option value="${items.id}">${items.name}</option>
								</c:forEach>
							</select>
						</div>
						<input type="hidden" value="${id}" name="member_id"> <input
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


					<form action="evaluationStore" method="POST">
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
						<input type=hidden value="${id}" name="member_id">
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

	<p>登入會員id${id}</p>

	<table class="table"
		style="width: 1400px; margin-left: 150px; margin-top: 50px;">
		<thead class="thead-dark">
			<tr>
				<th scope="col">#</th>
				<th scope="col">商店名稱</th>
				<th scope="col">商店ID</th>
				<th scope="col">會員ID</th>
				<th scope="col">商店狀態</th>
				<th scope="col"></th>
				<th scope="col"></th>
				<th scope="col"></th>
				<th scope="col"></th>
				<th scope="col"></th>
				<th scope="col"></th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var='Stores' items='${Store}'>
				<tr>
					<th scope="row">O</th>
					<td>${Stores.name}</td>
					<td>${Stores.id}</td>
					<td>${Stores.member_id}</td>
					<td>${Stores.status}</td>
					<td></td>
					<td></td>
					<td></td>


					<!-- 會員檢舉會員 -->
					<td>


						<button type="button" class="btn btn-primary" data-toggle="modal"
							data-target="#exampleModal" value="${Stores.id}"
							onclick="reportTarger(this)">檢舉</button>

					</td>




					<!--會員評價會員 -->
					<td>

						<button type="button" class="btn btn-primary" data-toggle="modal"
							data-target="#exampleModal1" value="${Stores.id}"
							onclick="scoreTarger(this)">評價</button>
					</td>

				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>