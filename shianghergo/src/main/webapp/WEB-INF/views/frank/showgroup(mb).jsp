<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
<meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">
<title>Insert title here</title>
</head>
<body>
<body>
	<jsp:include page="/WEB-INF/views/eric/header.jsp" />
	<jsp:include page="../BlackLine.jsp" />
	<!-- action对应一个action标签，id对应提交时的对应关系 -->

	<div class="media"style="padding-left: 50px;">
		<img width='480px' height='270'
			src="<c:url value='/frank/getgroupPicture/${updategroup.id }' />"
			class="align-self-center mr-3" alt="...">
		<div class="media-body">
			<input type="hidden" name="id" value="${updategroup.id}" />
			<dl class="row">
				<dt class="col-sm-3">合購團名：</dt>
				<dd class="col-sm-9">${updategroup.name }</dd>

				<dt class="col-sm-3">開始時間：</dt>
				<dd class="col-sm-9">${updategroup.start_time }</dd>
				<!--   <dd class="col-sm-9 offset-sm-3">Donec id elit non mi porta gravida at eget metus.</dd> -->

				<dt class="col-sm-3">結束時間：</dt>
				<dd class="col-sm-9">${updategroup.end_time }</dd>

				<dt class="col-sm-3 text-truncate">分類：</dt>
				<dd class="col-sm-9">${updategroup.categoryBean.name }</dd>

				<dt class="col-sm-3">說明：</dt>
				<dd class="col-sm-9">${updategroup.detail }</dd>
				<!--     <dl class="row"> -->
				<!--       <dt class="col-sm-4">Nested definition list</dt> -->
				<!--       <dd class="col-sm-8">Aenean posuere, tortor sed cursus feugiat, nunc augue blandit nunc.</dd> -->
				<!--     </dl> -->
				<dt class="col-sm-3 text-truncate">付款方式：</dt>
				<dd class="col-sm-9">
					<c:if test="${updategroup.payment ==1}">
						<td>面交付款</td>
					</c:if>
					<c:if test="${updategroup.payment ==2}">
						<td>銀行匯款</td>
					</c:if>
					<c:if test="${updategroup.payment ==3}">
						<td>面交付款、銀行匯款</td>
					</c:if>
				</dd>
				<dt class="col-sm-3 text-truncate">修改合購資訊：</dt>
				<dd class="col-sm-9">
					<input type="button" value="修改"
						onclick="location.href='updatetogroup(mb)?gid=${updategroup.id}'"
						class="btn btn-info"> <input type="button" value="新增地址"
						onclick="location.href='addplace(mb)?gid=${updategroup.id}'"
						class="btn btn-info"> <input type="button" value="新增商品"
						onclick="location.href='additem(mb)?gid=${updategroup.id}'"
						class="btn btn-info">
				</dd>
			</dl>

		</div>
	</div>

	<div class="card text-center" style="margin-top: 30px;">
		<div class="card-header">
			<h5>地點</h5>
		</div>
		<div class="card-body">
			<c:forEach var="places" items="${updategroup.place}">
				<dl class="row">
<!-- 					<dt class="col-sm-3">地址:</dt> -->
<%-- 					<dd class="col-sm-9">${places.address}</dd> --%>

<!-- 					<dt class="col-sm-3">時間:</dt> -->
<%-- 					<dd class="col-sm-9">${places.time}</dd> --%>

					<dt class="col-sm-3">地址:</dt>
					<dd class="col-sm-9">
						<dl class="row">
							<dt class="col-sm-4">${places.address}</dt>
							<dd class="col-sm-8">
								<input type="button" value="修改"
									onclick="location.href='updatetoplace(mb)?gid=${updategroup.id}&pid=${places.id}'"
									class="btn btn-info" style="width: 80px; height: 40px;"><span><input type="button" value="刪除"

					onclick="location.href='deletetoplace?gid=${updategroup.id}&pid=${places.id}'"
					class="btn btn-danger" style="width: 80px; height: 40px;"></span>
							</dd>
						</dl>
					</dd>
					<dt class="col-sm-3">時間:</dt>
					<dd class="col-sm-9">
						<dl class="row">
							<dt class="col-sm-4">${places.time}</dt>
<!-- 							<dd class="col-sm-8"><input type="button" value="刪除" -->

<%-- 					onclick="location.href='deletetoplace?gid=${updategroup.id}&pid=${places.id}'" --%>
<!-- 					class="btn btn-danger" style="width: 80px; height: 40px;"> -->
					</dd>

						</dl>
					</dd>
				</dl>
				<!-- 		<div class="card-footer text-muted"> -->
<!-- 				<input type="button" value="修改" -->
<%-- 					onclick="location.href='updatetoplace(mb)?gid=${updategroup.id}&pid=${places.id}'" --%>
<!-- 					class="btn btn-info" style="width: 80px; height: 30px;"> -->
<!-- 				<input type="button" value="刪除" -->
<%-- 					onclick="location.href='deletetoplace?gid=${updategroup.id}&pid=${places.id}'" --%>
<!-- 					class="btn btn-danger" style="width: 80px; height: 30px;"> -->
				<!-- 		</div> -->
			</c:forEach>
		</div>
	</div>



	<section class="container">
		<div class="row">
			<c:forEach var="item" items="${updategroup.groupsitem}">
				<div class="col-sm-6 col-md-3"							
					style="width: 360px; height: 450px; font-size: 16px;">
					<div class="thumbnail" style="width: 270px; height: 400px">
						<img width='275' height='250'
							src="<c:url value='/frank/getPicture/${item.id }' />" />
						<div class="caption">
							<p>
								<b style='font-size: 16px;'>${item.name}</b>
							</p>
							<p style="word-break: break-all">說明:${item.detail}</p>
							<p>價格: ${item.price} 元</p>

							<p>
								<input type="button" value="修改"
									onclick="location.href='updatetogroup_item(mb)?gid=${updategroup.id}&iid=${item.id}'"
									class="btn btn-info" style="width: 80px; height: 40px;">
								<input type="button" value="刪除"
									onclick="location.href='deletetogroup_item?gid=${updategroup.id}&iid=${item.id}'"
									class="btn btn-danger" style="width: 80px; height: 40px;">

							</p>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</section>


</body>
<jsp:include page="/WEB-INF/views/eric/foot.jsp"></jsp:include>
</html>