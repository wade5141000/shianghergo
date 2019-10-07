<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
</head>
<body>

	<!--   <div class="site-nav-bg"> -->
	<!--     <div class="site-nav w1200"> -->
	<!--       <p class="sn-back-home"> -->
	<!--         <i class="layui-icon layui-icon-home"></i> -->
	<!--         <a href="index.jsp">首頁</a> -->
	<!--       </p> -->
	<!--       <div class="sn-quick-menu"> -->
	<!--         <div class="login"><a href="login.jsp">登入</a></div> -->
	<!--         <div class="sp-cart"><a href="shopcart.jsp">購物車</a><span>2</span></div> -->
	<!--       </div> -->
	<!--     </div> -->
	<!--   </div> -->



	<!--   <div class="header"> -->
	<!--     <div class="headerLayout w1200"> -->
	<!--       <div class="headerCon"> -->
	<!--         <h1 class="mallLogo"> -->
	<!--           <a href="index.jsp"> -->
	<%--             <img src="${pageContext.request.contextPath}/res/static/img/logo4.png" width="100" height="100"> --%>
	<!--           </a> -->
	<!--         <div class="mallSearch"> -->
	<!--           <form action="" class="layui-form" novalidate> -->
	<!--             <input type="text" name="title" required  lay-verify="required" autocomplete="off" class="layui-input" placeholder="請輸入需要的商品"> -->
	<!--             <button class="layui-btn" lay-submit lay-filter="formDemo"> -->
	<!--                 <i class="layui-icon layui-icon-search"></i> -->
	<!--             </button> -->
	<!--             <input type="hidden" name="" value=""> -->
	<!--           </form> -->
	<!--         </div> -->
	<!--       </div> -->
	<!--     </div> -->
	<!--   </div> -->
	<!--   <div class="content content-nav-base buytoday-content"> -->
	<!--     <div id="list-cont"> -->
	<!--       <div class="main-nav"> -->
	<!--         <div class="inner-cont0"> -->
	<!--           <div class="inner-cont1 w1200"> -->
	<!--             <div class="inner-cont2"> -->
	<!--               <a href="commodity.jsp">所有商品</a> -->
	<!--               <a href="buytoday.jsp" class="active">今日團購</a> -->
	<!--               <a href="information.jsp">母嬰資訊</a> -->
	<!--             </div> -->
	<!--           </div> -->
	<!--         </div> -->
	<!--       </div> -->
	<!--       <div class="banner-box"> -->
	<!--         <div class="banner"></div> -->
	<!--       </div> -->
	<!--      </div> -->
	<!--      </div> -->

	<jsp:include page="/WEB-INF/views/eric/header.jsp"></jsp:include>

	<div class="content content-nav-base commodity-content">
		<div class="commod-cont-wrap">
			<div class="commod-cont w1200 layui-clear">
				<div class="left-nav">

					<div class="list-box" style="background-color: #FFE5B5">
						<dl style="background-color: #FFE5B5">
<!-- 							<dd style="background-color: #FFB01C"> -->
<!-- 								<a >所有分類</a> -->
<!-- 							</dd> -->
							<dd>
								<a href="${pageContext.request.contextPath}/frank/groups">全品項</a>
							</dd>
						<c:forEach var="categorys" items="${category}">
							<dd>
								<a href="${pageContext.request.contextPath}/frank/groupsByCategory?category_id=${categorys.id}">${categorys.name}</a>
							</dd>
							</c:forEach>
						
						
						
						
						</dl>
					</div>
				</div>
				<div class="right-cont-wrap">
					<div class="right-cont">
<!-- 						<div class="sort layui-clear"> -->
<!-- 							<a class="active" href="javascript:;" event='volume'>發起</a> <a -->
<!-- 								href="javascript:;" event='price'>截止</a> -->

<!-- 						</div> -->
			<div class="cont-list layui-clear" id="list-cont">
						
							<c:forEach var="group" items="${groups}">	
							<c:if test="${group.memberBean.status==1}">						
								<div class="item" style="height: 400px;">
<!-- 									<div class="img"> -->
										<a href="<spring:url value='group?gid=${group.id}'/>"> <img
											width='275' height='250'
											src="<c:url value='/frank/getgroupPicture/${group.id }' />">
										
<!-- 									</div> -->
<!-- 									<div class="text"> -->
										<p >${group.name}</p>
										<p>團主: ${group.memberBean.account}</p>
										<p>截止日期: ${group.end_time}</p>
<!-- 									</div> --></a>
								</div>
								</c:if>
							</c:forEach>
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
						
					</div>
				</div>
			</div>
		</div>
	</div>
	

	<jsp:include page="/WEB-INF/views/eric/foot.jsp"></jsp:include>
</body>
</html>