<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Document</title>
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/res/static/css/main.css">
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/res/layui/css/layui.css">
  <script type="text/javascript" src="${pageContext.request.contextPath}/res/layui/layui.js"></script>
  <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
  <meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">
  
  <script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
  
  <link rel="stylesheet" href="https://unpkg.com/bootstrap-table@1.15.4/dist/bootstrap-table.min.css">
  <script src="https://unpkg.com/bootstrap-table@1.15.4/dist/bootstrap-table.min.js"></script>
  <script src="https://unpkg.com/bootstrap-table@1.15.4/dist/locale/bootstrap-table-zh-TW.min.js"></script>

  <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

</head>
<body>

  <div class="site-nav-bg">
    <div class="site-nav w1200">
      <p class="sn-back-home">
        <i class="layui-icon layui-icon-home"></i>
        <a href="index.jsp">首頁</a>
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
	        <form action='<c:url value="/Search.controller" />' method="get"  class="container-fluid" novalidate>
<!-- 	        	<div class="container-fluid"> -->
	        		<div class="row" style="height: 32px; width: 495px;">
	        			<div class="col-2" style="padding: 0">
	        				<select name="filter" value="${param.filter}">
				            	<option value="item">商品</option>
				            	<option value="groups">團購</option>	
				            </select>
	        			</div>
	        			<div class="col-10" style="padding: 0">
	        				<input type="text" name="title" value="${param.title}" required  lay-verify="required" autocomplete="off" class="layui-input" placeholder="請輸入需要的商品" style="width: 87%;height: 32px;">
				            <button class="layui-btn align-right" lay-submit lay-filter="formDemo" type="submit" style="width: 13%; height: 32px;">
				                <!-- <i class="layui-icon layui-icon-search"></i> -->
				                <i class="material-icons">search</i>
				            </button>
	        			</div>
	        		</div>
<!-- 	        	</div> -->
	            <!-- <input type="submit" name="" value=""> -->
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
              <a href="commodity.jsp">所有商品</a>
              <a href="buytoday.jsp">今日團購</a>
            </div>
          </div>
        </div>
      </div>
      <div class="banner-box">
<!--         <div class="banner"></div> -->
      </div>
    </div>
  </div>

  <div class="content content-nav-base information-content">
    <div class="info-list-box">
      <div class="info-list w1200">
			<div class="SearchDiv">
				
				<table data-toggle="table"
					   data-sortable="true"
					   data-pagination="true"
					   data-page-size="10"
					   data-page-list="[10, 20, all]"
					   data-search="true"
					   data-search-on-enter-key="true"
					   >
			      <thead>
			        <tr>
			          <th data-field="img" data-align="center">商品圖片</th>
			          <th data-field="name">商品名稱</th>
			          <th data-field="price" data-sortable="true">商品價位</th>
			          <th data-field="detail">商品描述</th>
			        </tr>
			      </thead>
			      <tbody>
			      
			      	<c:forEach varStatus="stVar" var="anSearch" items="${searchList}">
				        <tr>
				          <td><img src="${pageContext.request.contextPath}/res/static/img/temp.png" height="100"></td>
<%-- 				          <td><img src="${pageContext.request.contextPath}/res/static/img/${anSearch.FileName}.jsp" height="100"></td> --%>
				          <td>${anSearch.name}</td>
				          <td>${anSearch.price}</td>
				          <td>${anSearch.detail}</td>
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
    base: '../res/static/js/util/' //你存放新模块的目录，注意，不是layui的模块目录
  }).use(['mm','laypage'],function(){
      var
      mm = layui.mm,laypage = layui.laypage;
      laypage.render({
        elem: 'demo0'
        ,count: 100 //数据总数
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


</body>
</html>