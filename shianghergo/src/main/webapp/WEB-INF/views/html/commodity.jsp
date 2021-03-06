<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Document</title>
  <link rel="stylesheet" href="http://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="http://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
	<script src="http://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/res/static/css/main.css">
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/res/layui/css/layui.css">
  <script type="text/javascript" src="${pageContext.request.contextPath}/res/layui/layui.js"></script>
  <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
  <meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">
</head>
<body>

  <div class="site-nav-bg">
    <div class="site-nav w1200">
      <p class="sn-back-home">
        <i class="layui-icon layui-icon-home"></i>
        <a href=index.jsp>首頁</a>
      </p>
      <div class="sn-quick-menu">
        <div class="login"><a href="login.jsp">登入</a></div>
        <div class="sp-cart"><a href="shopcart.jsp">購物車</a><span>2</span></div>
      </div>
    </div>
  </div>



  <div class="header">
    <div class="headerLayout w1200">
      <div class="headerCon">
        <h1 class="mallLogo">
          <a href="index.jsp">
            <img src="${pageContext.request.contextPath}/res/static/img/logo4.png" width="100" height="100">
          </a>
        </h1>
        <div class="mallSearch">
          <form action="" class="layui-form" novalidate>
            <input type="text" name="title" required  lay-verify="required" autocomplete="off" class="layui-input" placeholder="請輸入需要的商品">
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
              <a href="commodity.jsp" class="active">所有商品</a>
<a href="buytoday.jsp" class="active">今日團購</a>
            </div>
          </div>
        </div>
      </div>
      
        <div id="myCarousel" class="carousel slide">
	
	<ol class="carousel-indicators">
		<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
		<li data-target="#myCarousel" data-slide-to="1"></li>
		<li data-target="#myCarousel" data-slide-to="2"></li>
	</ol>   
	
	<div class="carousel-inner">
		<div class="item active">
			<a href="A.jsp" title="GO"><img src="${pageContext.request.contextPath}/res/static/img/1.png" alt="First slide" style="width:100%"></a>
		</div>
		<div class="item">
			<a href="B.jsp" title="GO"><img src="${pageContext.request.contextPath}/res/static/img/2.png" alt="Second slide"style="width:100%"></a>
		</div>
		<div class="item">
			<a href="C.jsp" title="GO"><img src="${pageContext.request.contextPath}/res/static/img/3.png" alt="Third slide" style="width:100%"></a>
		</div>
	</div>
	
	<a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
		<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
		<span class="sr-only">Previous</span>
	</a>
	<a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
		<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
		<span class="sr-only">Next</span>
	</a>
</div>


  <div class="content content-nav-base commodity-content">
    <div class="commod-cont-wrap">
      <div class="commod-cont w1200 layui-clear">
        <div class="left-nav">
          <div class="title">所有分类</div>
          <div class="list-box">
            <dl>
             <dt>奶粉辅食</dt>
             <dd><a href="javascript:;">进口奶粉</a></dd>
             <dd><a href="javascript:;">宝宝辅食</a></dd>
             <dd><a href="javascript:;">营养品</a></dd>
            </dl>
            <dl>
             <dt>儿童用品</dt>
             <dd><a href="javascript:;">纸尿裤</a></dd>
             <dd><a href="javascript:;">婴儿湿巾</a></dd>
             <dd><a href="javascript:;">婴儿车</a></dd>
             <dd><a href="javascript:;">婴儿床</a></dd>
             <dd><a href="javascript:;">儿童安全座椅</a></dd>
            </dl>
            <dl>
             <dt>儿童早教</dt>
             <dd><a href="javascript:;">儿童玩具</a></dd>
             <dd><a href="javascript:;">早教书籍</a></dd>
             <dd><a href="javascript:;">孕产育儿书</a></dd>
            </dl>
            <dl>
             <dt>儿童服饰</dt>
             <dd><a href="javascript:;">童装</a></dd>
             <dd><a href="javascript:;">童鞋</a></dd>
             <dd><a href="javascript:;">宝宝配饰</a></dd>
            </dl>
            <dl>
             <dt>孕妈专区</dt>
             <dd><a href="javascript:;">孕妇装</a></dd>
             <dd><a href="javascript:;">孕妇护肤</a></dd>
             <dd><a href="javascript:;">孕妇用品</a></dd>
            </dl>
          </div>
        </div>
        <div class="right-cont-wrap">
          <div class="right-cont">
            <div class="sort layui-clear">
              <a class="active" href="javascript:;" event = 'volume'>價格</a>
              <a href="javascript:;" event = 'price'>銷量</a>

            </div>
            <div class="prod-number">
              <span>200个</span>
            </div>
            <div class="cont-list layui-clear" id="list-cont">
              <div class="item">
                <div class="img">
                  <a href="javascript:;"><img src="${pageContext.request.contextPath}/res/static/img/paging_img1.jpg"></a>
                </div>
                <div class="text">
                  <p class="title">森系小清新四件套</p>
                  <p class="price">
                    <span class="pri">￥200</span>
                    <span class="nub">1266付款</span>
                  </p>
                </div>
              </div>
              <div class="item">
                <div class="img">
                  <a href="javascript:;"><img src="${pageContext.request.contextPath}/res/static/img/paging_img2.jpg"></a>
                </div>
                <div class="text">
                  <p class="title">森系小清新四件套</p>
                  <p class="price">
                    <span class="pri">￥200</span>
                    <span class="nub">1266付款</span>
                  </p>
                </div>
              </div>
              <div class="item">
                <div class="img">
                  <a href="javascript:;"><img src="${pageContext.request.contextPath}/res/static/img/paging_img3.jpg"></a>
                </div>
                <div class="text">
                  <p class="title">森系小清新四件套</p>
                  <p class="price">
                    <span class="pri">￥200</span>
                    <span class="nub">1266付款</span>
                  </p>
                </div>
              </div>
              <div class="item">
                <div class="img">
                  <a href="javascript:;"><img src="${pageContext.request.contextPath}/res/static/img/paging_img1.jpg"></a>
                </div>
                <div class="text">
                  <p class="title">森系小清新四件套</p>
                  <p class="price">
                    <span class="pri">￥200</span>
                    <span class="nub">1266付款</span>
                  </p>
                </div>
              </div>
              <div class="item">
                <div class="img">
                  <a href="javascript:;"><img src="${pageContext.request.contextPath}/res/static/img/paging_img2.jpg"></a>
                </div>
                <div class="text">
                  <p class="title">森系小清新四件套</p>
                  <p class="price">
                    <span class="pri">￥200</span>
                    <span class="nub">1266付款</span>
                  </p>
                </div>
              </div>
              <div class="item">
                <div class="img">
                  <a href="javascript:;"><img src="${pageContext.request.contextPath}/res/static/img/paging_img3.jpg"></a>
                </div>
                <div class="text">
                  <p class="title">森系小清新四件套</p>
                  <p class="price">
                    <span class="pri">￥200</span>
                    <span class="nub">1266付款</span>
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
    base: '../res/static/js/util/' //你存放新模块的目录，注意，不是layui的模块目录
  }).use(['mm','laypage','jquery'],function(){
      var laypage = layui.laypage,$ = layui.$,
     mm = layui.mm;
       laypage.render({
        elem: 'demo0'
        ,count: 100 //数据总数
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

    $('.sort a').on('click',function(){
      $(this).addClass('active').siblings().removeClass('active');
    })
    $('.list-box dt').on('click',function(){
      if($(this).attr('off')){
        $(this).removeClass('active').siblings('dd').show()
        $(this).attr('off','')
      }else{
        $(this).addClass('active').siblings('dd').hide()
        $(this).attr('off',true)
      }
    })

});
</script>


</body>
</html>