<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" ></script>
<script src="http://static.runoob.com/assets/jquery-validation-1.14.0/lib/jquery.js"></script>
<script src="http://static.runoob.com/assets/jquery-validation-1.14.0/dist/jquery.validate.min.js"></script>
<script src="http://static.runoob.com/assets/jquery-validation-1.14.0/dist/localization/messages_zh.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" ></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" ></script>

<title>會員清單</title>
<style>
.container {
	margin: auto;
	/*   margin-left: auto; */
	padding-right: 15px;
	padding-left: 15px;
	width: 100%;
	max-width: 1140px;
	/*   // 隨螢幕尺寸而變，當螢幕尺寸 ≥ 1200px 時是 1140px。 */
}

.form-control {
	display: block;
	width: 100%;
	height: 34px;
	padding: 6px 12px;
	font-size: 14px;
	line-height: 1.42857143;
	color: #555;
	background-color: #fff;
	background-image: none;
	border: 1px solid #ccc;
	border-radius: 20px;
	-webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075);
	box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075);
	-webkit-transition: border-color ease-in-out .15s, -webkit-box-shadow
		ease-in-out .15s;
	-o-transition: border-color ease-in-out .15s, box-shadow ease-in-out
		.15s;
	transition: border-color ease-in-out .15s, box-shadow ease-in-out .15s
}
</style>
</head>
<body>
	<!-- 引入共同的頁首 -->
	<jsp:include page="top.jsp" />
	<div class="container" >
		<h2>會員後台</h2>
		<br>
		<!-- Nav tabs -->
		<ul class="nav nav-tabs" role="tablist">
			<li class="nav-item"><a class="nav-link active"
				data-toggle="tab" href="#home0">關於我</a></li>
			<li class="nav-item"><a class="nav-link" data-toggle="tab"
				href="#menu1">我購買的商品</a></li>
			<li class="nav-item"><a class="nav-link" data-toggle="tab"
				href="#menu2">我建立的合購</a></li>
			<li class="nav-item"><a class="nav-link" data-toggle="tab"
				href="#menu3">我參與的合購</a></li>
			<li class="nav-item"><a class="nav-link" data-toggle="tab"
				href="#menu4">留言板</a></li>
			<li class="nav-item"><a class="nav-link" data-toggle="tab"
				href="#menu5">追蹤</a></li>
			<li class="nav-item"><a class="nav-link" data-toggle="tab"
				href="#menu6">購物車</a></li>
		</ul>
<!-- 		<a href="Member002">我購買的商品</a> <a href="Member003">我建立的合購</a> <a -->
<!-- 			href="Member004">我參與的合購</a> -->
			<a href="Member002">我購買的商品</a>
			<a href="Member003">我建立的合購</a>
			<a href="Member004">我參與的合購</a>
			<a href="AllMember">全部會員</a>
			<a href="Message">Message</a>
		<!-- Tab panes -->
		<div class="tab-content">
			<div id="home0" class="container tab-pane active">
				<jsp:include page="Member001.jsp" />
			</div>
			<div id="menu1" class="container tab-pane fade"></div>
			<div id="menu2" class="container tab-pane fade"></div>
			<div id="menu3" class="container tab-pane fade"></div>
			<!-- 			<div id="menu4" class="container tab-pane fade"> -->
			<!-- 				<br> -->
			<!-- 				<h3>評價</h3> -->
			<!-- 				<p></p> -->
			<!-- 			</div> -->
			<!-- 			<div id="menu5" class="container tab-pane fade"> -->
			<!-- 				<br> -->
			<!-- 				<h3>追蹤</h3> -->
			<!-- 				<p></p> -->
			<!-- 			</div> -->
			<div id="menu4" class="container tab-pane fade">
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">

	$(document).ready(function() {
		function showTabs(tabsId, url) {
			$("a[href='#" + tabsId + "']").tab('show');
			var $tabContent = $('#' + tabsId);
			if ($tabContent.length < 100) {
				$tabContent.load(url);
				console.info(tabsId + ' load done!');
			}
		}

		//依次为每个tab导航a标签添加单击事件
		$('a[href="#menu1"]').click(function(e) {
			showTabs('menu1', 'Member002','Member002_1');
			e.preventDefault();
		});
		$('a[href="#menu2"]').click(function(e) {
			showTabs('menu2', 'Member003');
			e.preventDefault();
		});
		$('a[href="#menu3"]').click(function(e) {
			showTabs('menu3', 'Member004');
			e.preventDefault();
		});
		$('a[href="#menu4"]').click(function(e) {
			showTabs('menu4', 'Message');
			e.preventDefault();
		});
		
	});
</script>
</html>