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
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/res/static/css/footer.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/res/static/css/header.css">
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
<jsp:include page="/WEB-INF/views/eric/header.jsp"></jsp:include>

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
				          <td>
				          <a href="http://localhost:8080/shianghergo/hao/product?id=${anSearch.id}">
				          <img src="<c:url value='/hao/getPicture/${anSearch.id}' />" height="100">
				          </a>
				          </td>
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
<jsp:include page="/WEB-INF/views/eric/foot.jsp"></jsp:include>


</body>
</html>