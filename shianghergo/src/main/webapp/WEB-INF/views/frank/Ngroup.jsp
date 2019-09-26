<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
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
</head>
<body>

	<div class="site-nav-bg">
		<div class="site-nav w1200">
			<p class="sn-back-home">
				<i class="layui-icon layui-icon-home"></i> <a href="index.jsp">首頁</a>
			</p>
			<div class="sn-quick-menu">
				<div class="login">
					<a href="login.jsp">登入</a>
				</div>
				<div class="sp-cart">
					<a href="shopcart.jsp">購物車</a><span>2</span>
				</div>
			</div>
		</div>
	</div>



	<div class="header">
		<div class="headerLayout w1200">
			<div class="headerCon">
				<h1 class="mallLogo">
					<a href="index.jsp"> <img
						src="${pageContext.request.contextPath}/res/static/img/logo4.png"
						width="100" height="100">
					</a>
					<div class="mallSearch">
						<form action="" class="layui-form" novalidate>
							<input type="text" name="title" required lay-verify="required"
								autocomplete="off" class="layui-input" placeholder="請輸入需要的商品">
							<button class="layui-btn" lay-submit lay-filter="formDemo">
								<i class="layui-icon layui-icon-search"></i>
							</button>
							<input type="hidden" name="" value="">
						</form>
					</div>
			</div>
		</div>
	</div>
	<div class="content content-nav-base buytoday-content">
		<div id="list-cont">
			<div class="main-nav">
				<div class="inner-cont0">
					<div class="inner-cont1 w1200">
						<div class="inner-cont2">
							<a href="commodity.jsp">所有商品</a> <a href="buytoday.jsp"
								class="active">今日團購</a> <a href="information.jsp">母嬰資訊</a>
						</div>
					</div>
				</div>
			</div>
			<div class="banner-box">
				<div class="banner"></div>
			</div>
		</div>
	</div>



	<div class="content content-nav-base commodity-content">
		<div class="commod-cont-wrap">
			<div class="commod-cont w1200 layui-clear">
				<div class="left-nav">

				<ul class="layui-nav layui-nav-tree" lay-filter="test">
<!-- 侧边导航: <ul class="layui-nav layui-nav-tree layui-nav-side"> -->
  <li class="layui-nav-item layui-nav-itemed">
    <a href="javascript:;">默认展开</a>
    <dl class="layui-nav-child">
      <dd><a href="javascript:;">选项1</a></dd>
      <dd><a href="javascript:;">选项2</a></dd>
      <dd><a href="">跳转</a></dd>
    </dl>
  </li>
  <li class="layui-nav-item">
    <a href="javascript:;">解决方案</a>
    <dl class="layui-nav-child">
      <dd><a href="">移动模块</a></dd>
      <dd><a href="">后台模版</a></dd>
      <dd><a href="">电商平台</a></dd>
    </dl>
  </li>
  <li class="layui-nav-item"><a href="">产品</a></li>
  <li class="layui-nav-item"><a href="">大数据</a></li>
</ul>



						<!--             <dl> -->
						<!--              <dt>孕妈专区</dt> -->

						<!--             </dl> -->
					</div>
				</div>
				<div class="right-cont-wrap">
					<div class="right-cont">

						<div class="cont-list layui-clear" id="list-cont">
							<div class="item">
								<div class="img">
									<a href="javascript:;"><img
										src="${pageContext.request.contextPath}/res/static/img/paging_img1.jpg"></a>
								</div>
								<div class="text">
									<p class="title">森系小清新四件套</p>
									<p class="price">
										<span class="pri">￥200</span> <span class="nub">1266付款</span>
									</p>
								</div>
							</div>
							<div class="item">
								<div class="img">
									<a href="javascript:;"><img
										src="${pageContext.request.contextPath}/res/static/img/paging_img2.jpg"></a>
								</div>
								<div class="text">
									<p class="title">森系小清新四件套</p>
									<p class="price">
										<span class="pri">￥200</span> <span class="nub">1266付款</span>
									</p>
								</div>
							</div>
							<div class="item">
								<div class="img">
									<a href="javascript:;"><img
										src="${pageContext.request.contextPath}/res/static/img/paging_img3.jpg"></a>
								</div>
								<div class="text">
									<p class="title">森系小清新四件套</p>
									<p class="price">
										<span class="pri">￥200</span> <span class="nub">1266付款</span>
									</p>
								</div>
							</div>

						</div>
						<!-- 模版引擎导入 -->
						<!-- <script type="text/html" id="demo">
              {{# layui.each(d.menu.milk.content,function(index,item){}}    
                <div class="item">
                  <div class="img">
                    <a href="javascript:;"><img src="{{item.img}}"></a>
                  </div>
                  <div class="text">
                    <p class="title"></p>
                    <p class="price">
                      <span class="pri">{{item.pri}}</span>
                      <span class="nub">{{item.nub}}</span>
                    </p>
                  </div>
                </div>
              {{# }); }}
            </script> -->
						<div id="demo0" style="text-align: center;"></div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script>
		layui.config({
			base : '../res/static/js/util/' //你存放新模块的目录，注意，不是layui的模块目录
		}).use([ 'mm', 'laypage', 'jquery' ], function() {
			var laypage = layui.laypage, $ = layui.$, mm = layui.mm;
			laypage.render({
				elem : 'demo0',
				count : 100
			//数据总数
			});

			// 模版引擎导入
			//  var html = demo.innerHTML;
			//  var listCont = document.getElementById('list-cont');
			//  // console.log(layui.router("#/about.html"))
			// mm.request({
			//     url: '../json/commodity.json',
			//     success : function(res){
			//       console.log(res)
			//       listCont.innerHTML = mm.renderHtml(html,res)
			//     },
			//     error: function(res){
			//       console.log(res);
			//     }
			//   })

			$('.sort a').on('click', function() {
				$(this).addClass('active').siblings().removeClass('active');
			})
			$('.list-box dt').on('click', function() {
				if ($(this).attr('off')) {
					$(this).removeClass('active').siblings('dd').show()
					$(this).attr('off', '')
				} else {
					$(this).addClass('active').siblings('dd').hide()
					$(this).attr('off', true)
				}
			})

		});
	</script>


</body>
</html>