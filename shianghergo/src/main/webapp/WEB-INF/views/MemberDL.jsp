<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html">
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

<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
<meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">
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

.x-iframe {
	height: 400px;
	width: 1200px;
	
}

.layui-side{
position:fixed;
}
</style>
</head>
<body>
<jsp:include page="eric/header.jsp" />
	<div class="main-nav" style="padding-bottom: 500px;">
		<ul class="layui-nav " lay-filter="" id="top">
			<li class="layui-nav-item"><a href="Member002"><i class="layui-icon layui-icon-star"></i>我購買的商品</a></li>
			<li class="layui-nav-item "><a href=""><i class="layui-icon layui-icon-star"></i>我建立的合購</a></li>
			<li class="layui-nav-item"><a href=""><i class="layui-icon layui-icon-star"></i>我參與的合購</a></li>
			<li class="layui-nav-item "><a href=""><i class="layui-icon layui-icon-star"></i>我的留言板</a></li>
<!-- 			<li class="layui-nav-item"><a href="goRegisterPage">加入會員</a></li> -->
			<li class="layui-nav-item "><a href="MemberDL"><i class="layui-icon layui-icon-star"></i>寄件備份</a></li>
			<li class="layui-nav-item layui-this"><a href="MemberIndex"> <img
					src="<c:url value='getmemberPicture/${loginOK.id}'/>" class="layui-nav-img">${loginOK.name}
			</a></li>
			<li class="layui-nav-item"><a href="logout"><i class="layui-icon layui-icon-star"></i>登出</a></li>
		</ul>
	</div>
<!-- 	layui-bg-black -->
	
<!-- 	<div class="layui-side" -->
<!-- 		style="margin-left: 200px; width: 200px; height: 500px; margin-top: 200px;"> -->
<!-- 		<div class="layui-side-scroll" -->
<!-- 			style="height: 500px; border-bottom-style: solid; border-bottom-width: 0px;"> -->
<!-- 			<!-- 左侧导航区域（可配合layui已有的垂直导航） --> -->
<!-- 			<ul class="layui-nav layui-nav-tree" lay-filter="test" -->
<!-- 				style="position: none;"> -->
<%-- 				<li class="layui-nav-item"><a _href="shianghergo/../goMember001"><cite>me的檔案</cite></a></li> --%>
<%-- 				<li class="layui-nav-item"><a _href="shianghergo/../Member002"><cite>我購買的商品</cite></a></li> --%>
<%-- 				<li class="layui-nav-item"><a _href="shianghergo/../Member003"><cite>我建立的合購</cite></a></li> --%>
<%-- 				<li class="layui-nav-item"><a _href="shianghergo/../Member004"><cite>我參與的合購</cite></a></li> --%>
<%-- 				<li class="layui-nav-item"><a _href="getMyMessage"><cite>我的留言板</cite></a></li> --%>
<%-- 				<li class="layui-nav-item"><a _href="MyMessage"><cite>寄件備份</cite></a></li> --%>
<%-- 				<li class="layui-nav-item"><a _href="hao/buildStore"><cite>我要開店</cite></a></li> --%>
<h1>我是DL首頁</h1>				
<!-- 			</ul> -->
<!-- 		</div> -->
<!-- 	</div> -->

<!-- 	<div class="layui-body" -->
<!-- 		style="padding-left: 100px; padding-right: 50px; margin-left: 50px;top: 200px;margin-bottom: 250px;"> -->
<!-- 		<!-- 内容主体区域 --> -->
<!-- 		<div class="layui-tab tab" lay-filter="mainTab" lay-allowclose="false" -->
<!-- 			style="padding-left: 100px; padding-right: 100px;   padding-bottom: 200px;  width: 1200px;height: 200px;"> -->
<!-- 			<ul class="layui-tab-title"> -->
<!-- 				<li class="home"><i class="layui-icon">&#xe68e;</i>我的桌面</li> -->
<!-- 			</ul> -->
<!-- 			<div class="layui-tab-content" -->
<!-- 				style="height: 100%; margin-top: 20px;"> -->
<!-- 				<div class="layui-tab-item layui-show" style="height: 100%;"> -->
<!-- 					<iframe src='Practice/../MemberIndex' frameborder="0" -->
<!-- 						scrolling="yes" style="height: 300px; width: 1200px;" -->
<!-- 						class="x-iframe"></iframe> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 	</div> -->

	<div class="footer" style="padding-right: 200px; padding-left: 200px;">
		<div class="ng-promise-box">
			<div class="ng-promise w1200">
				<p class="text">
					<a class="icon1" href="javascript:;">7天无理由退换货</a> <a class="icon2"
						href="javascript:;">满99元全场免邮</a> <a class="icon3"
						style="margin-right: 0" href="javascript:;">100%品质保证</a>
				</p>
			</div>
		</div>
		<div class="mod_help w1200">
			<p>
				<a href="javascript:;">关于我们</a> <span>|</span> <a
					href="javascript:;">帮助中心</a> <span>|</span> <a href="javascript:;">售后服务</a>
				<span>|</span> <a href="javascript:;">母婴资讯</a> <span>|</span> <a
					href="javascript:;">关于货源</a>
			</p>
			<p class="coty">母婴商城版权所有 &copy; 2012-2020</p>
		</div>
	</div>
</body>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/res/static/css/main.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/res/layui/css/layui.css">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/res/layui/layui.js"></script>
<script type="text/javascript">
	//注意：导航 依赖 element 模块，否则无法进行功能性操作
// 	layui.use('element', function() {
// 		var element = layui.element(); //导航的hover效果、二级菜单等功能，需要依赖element模块
// 	});

	$(function() {
		//JavaScript代码区域
		layui.use('element',function() { 
			var element = layui.element;
			$(".layui-nav-tree li").click(
				function(event) {
						var url = $(this).children('a').attr('_href');
						var title = $(this).find('cite').html();
						var index = $('.layui-nav-tree li').index($(this));
				//遍历打开的窗口，如果当前点击的选项已经打开，则跳转到对应窗口去，不再执行for外面的两条语句，创建新窗口
						for (var i = 0; i < $('.x-iframe').length; i++) {
								if ($('.x-iframe').eq(i).attr('tab-id') == index + 1) 
								  {tab.tabChange(index + 1);
								event.stopPropagation();
									return;
							}
								};
								tab.tabAdd(title, url,index + 1);
								tab.tabChange(index + 1);
											});

							//点击新增子页面
							var tab = {
								tabAdd : function(title, url, id) {
									element
											.tabAdd(
													'mainTab',
													{
														title : title,//用于演示
														content : '<iframe tab-id="'+id+'" frameborder="0" src="'+url+'" scrolling="yes" class="x-iframe"></iframe>',
														id : id
													//实际使用一般是规定好的id，这里以时间戳模拟下
													})
								},
								tabDelete : function(othis) {
									element.tabDelete('mainTab', id);
									othis.addClass('layui-btn-disabled');
								},
								tabChange : function(id) {
									//切换到指定Tab项
									element.tabChange('mainTab', id); //切换到：用户管理
								}
							};
						});

	})
	
// 	/**
//  * 初始化内容区域的
//  */
// function loadmarinhtml() {
 
//     var rightstr = "";
//     for (var i = 0; i < rightarr.length; i++) {
//         rightstr += "<div class='layui-colla-item'> <h2 class='layui-colla-title'>"
//             + rightarr[i].cmsContentExt.title + " </h2> " +
//             "<div class='layui-colla-content'>"
//             + rightarr[i].cmsContentTxt.txt + "</div></div>"
//     }
//     $(".layui-collapse").html(rightstr);
 
//     layui.element.init();//初始化
// }

</script>
</html>