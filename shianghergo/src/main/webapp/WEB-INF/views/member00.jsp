<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script
	src="http://static.runoob.com/assets/jquery-validation-1.14.0/lib/jquery.js"></script>
<script
	src="http://static.runoob.com/assets/jquery-validation-1.14.0/dist/jquery.validate.min.js"></script>
<script
	src="http://static.runoob.com/assets/jquery-validation-1.14.0/dist/localization/messages_zh.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/res/static/css/main.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/res/layui/css/layui.css">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/res/layui/layui.js"></script>
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
<meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">
<head>
<style type="text/css">
.container {
	margin: auto;
	/*   margin-left: auto; */
	padding-right: 15px;
	padding-left: 15px;
	width: 100%;
	max-width: 1140px;
	/*   // 隨螢幕尺寸而變，當螢幕尺寸 ≥ 1200px 時是 1140px。 */
}
</style>
</head>
<body>
	<div class="layui-body" style="padding-left: 160px">
		<!-- 内容主体区域 -->
		<form id="saveForm" action="updateMember.do" method="post" class="layui-form"  enctype="multipart/form-data">
			<input type="hidden" name="id" value="${Member.id}" /> <input
				type="hidden" name="account" value="${Member.account}" />
			<table class="layui-form" style="font-size: :16px">
				<tr>
					<td>姓名：</td>
					<td><input type="text" value="${Member.name }" name="name" class="layui-input" /></td>
				</tr>
				<tr>
					<td>密碼：</td>
					<td><input type="text" value="${Member.password }"
						name="password" class="layui-input" /></td>
				</tr>
				<tr>
				<tr>
					<td>手機：</td>
					<td><input type="text" value="${Member.phone }" name="phone" class="layui-input" /></td>
				</tr>
				<tr>
					<td>Email：</td>
					<td><input type="text" value="${Member.email }" name="email" class="layui-input" /></td>
				</tr>
				<tr>
					<td>生日：</td>
					<td><input type="text" value="${Member.birthday }"
						name="birthday" class="layui-input" /></td>
				</tr>
				<tr>
					<td>地址：</td>
					<td><input type="text" value="${Member.address }"
						name="address" class="layui-input" /></td>
				</tr>
				<tr>
					<td>更換大頭照：</td>
					<td><input type="file" 
						name="image" class="layui-input" /></td>
				</tr>
			</table>
				<div class="layui-btn-group">
					<div align="right" class="layui-btn-group" style="padding-left: 50px;padding-top: 20px;">
					<input type="submit" value="更新" class="layui-btn"/> 
					<a href="javascript:history.go(-1)" class="layui-btn">取消 </a>
				</div>
				</div>
		</form>
	</div>
	
</body>
<script type="text/javascript">
	// 	$(document).ready(function() {
	// 		function showTabs(tabsId, url) {
	// 			$("a[href='#" + tabsId + "']").tab('show');
	// 			var $tabContent = $('#' + tabsId);
	// 			if ($tabContent.length < 100) {
	// 				$tabContent.load(url);
	// 				console.info(tabsId + ' load done!');
	// 			}
	// 		}

	// 		//依次为每个tab导航a标签添加单击事件
	// 		$('a[href="#menu1"]').click(function(e) {
	// 			showTabs('menu1', 'Member002','Member002_1');
	// 			e.preventDefault();
	// 		});
	// 		$('a[href="#menu2"]').click(function(e) {
	// 			showTabs('menu2', 'Member003');
	// 			e.preventDefault();
	// 		});
	// 		$('a[href="#menu3"]').click(function(e) {
	// 			showTabs('menu3', 'Member004');
	// 			e.preventDefault();
	// 		});
	// 		$('a[href="#menu4"]').click(function(e) {
	// 			showTabs('menu4', 'Message');
	// 			e.preventDefault();
	// 		});

	// 	});
	// 	$(function() {
	// 		layui.use('form', function() {
	// 			var form = layui.form;
	// 			//监听提交
	// 			form.on('submit(login)', function(data) {
	// 				console.log(data);
	// 				return false;
	// 			});
	// 		});
	// 	})
	//注意：导航 依赖 element 模块，否则无法进行功能性操作
	layui.use('element', function() {
		var element = layui.element;

		//…
	});
</script>
</body>
</html>
