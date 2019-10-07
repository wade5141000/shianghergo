<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Document</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/res/static/css/main.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/res/layui/css/layui.css">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/res/layui/layui.js"></script>
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
<meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">

<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>


</head>
<style>
body {
	margin: 0px;
	padding: 0px;
	background: #fff url('../images/bbg06.png') center center fixed ;　
}
</style>
<body>

	<jsp:include page="/WEB-INF/views/eric/header.jsp"></jsp:include>

	<table class="table table-hover"
		style="width: 1100px; margin-left: 320px; margin-top: 50px;">

		<thead>
		 <p style="margin-left:320px"> 查詢[ ${name}]取得${size}筆資料</p>
			<tr>
				<th class="alert alert-primary" role="alert">開團標題</th>
				<th data-field="img" data-align="center" class="alert alert-primary" role="alert">商品</th>
				<th class="alert alert-primary" role="alert">開始時間</th>
				<th class="alert alert-primary" role="alert">結束時間</th>
				<th class="alert alert-primary" role="alert">詳細說明</th>
				<th class="alert alert-primary" role="alert">付款方式</th>
			</tr>
		</thead>
		<tbody>

			<c:forEach varStatus="stVar" var="GroupsG" items="${Groups}">
				<tr>
					<td><a
						href="<spring:url value='/frank/group?gid=${GroupsG.id}'/>">${GroupsG.name}</a></td>
					<td><img
						src="<c:url value='/frank/getgroupPicture/${GroupsG.id }' />"
						height="100"></td>
					<td>${GroupsG.start_time}</td>
					<td>${GroupsG.end_time}</td>
					<td>${GroupsG.detail}</td>
					<td>${GroupsG.payment}</td>

				</tr>
			</c:forEach>
		</tbody>
	</table>

	</div>


	<!-- <div id="demo0" style="text-align: center;"></div> -->
	</div>
	</div>
	</div>
	<!-- 模版引擎导入 -->
	<!-- <script type="text/html" id="demo">
    {{# layui.each(d.listCont,function(index,item){}}
    <div class="item">
      <div class="img">
        <img src="../res/img/new1.jpg" alt="">
      </div>
      <div class="text">
        <h4>周岁内的宝宝消化不良拉肚子怎么办?</h4>
        <p class="data">2016-12-24 16:33:26</p>
        <p class="info-cont">宝宝在周岁之前体质相对较弱，特别是薄弱肠道，一不注意就会拉肚子;那么宝宝消化不良拉肚子</p>
      </div>
    </div>
    {{# })}}
  </script> -->
	<script>
		layui.config({
			base : '../res/static/js/util/' //你存放新模块的目录，注意，不是layui的模块目录
		}).use([ 'mm', 'laypage' ], function() {
			var mm = layui.mm, laypage = layui.laypage;
			laypage.render({
				elem : 'demo0',
				count : 100
			//数据总数
			});
			// 模版引擎导入
			// var html = demo.innerHTML;
			// var listCont = document.getElementById('list-cont');
			//  mm.request({
			//    url: '../json/information.json',
			//    success : function(res){
			//      console.log(res)
			//      listCont.innerHTML = mm.renderHtml(html,res)
			//    },
			//    error: function(res){
			//      console.log(res);
			//    }
			//  })   
		});
	</script>

	<jsp:include page="/WEB-INF/views/eric/foot.jsp"></jsp:include>
	<script src="//cdn.bootcss.com/canvas-nest.js/1.0.1/canvas-nest.min.js"></script>
	
</body>
</html>