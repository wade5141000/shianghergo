<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/css/bootstrap.min.css">
  <script src="https://cdn.staticfile.org/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://cdn.staticfile.org/popper.js/1.15.0/umd/popper.min.js"></script>
  <script src="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/js/bootstrap.min.js"></script>
<!--    <meta http-equiv="refresh" content="3;URL=index"> -->
<title>登入異常</title>
<style>
body {
	margin: 0px;
	padding: 0px;
	background: #fff url('images/bbg06.png') center center fixed ;　
}
</style>
<script type="text/javascript">     
function countDown(secs,surl){     
//alert(surl);     
var jumpTo = document.getElementById('jumpTo');
jumpTo.innerHTML=secs;  
if(--secs>0){     
     setTimeout("countDown("+secs+",'"+surl+"')",1000);     
     }     
else{       
     location.href=surl;     
     }     
}     
</script> 
</head>
<body>
<!-- 引入共同的頁首 -->
<jsp:include page="eric/header.jsp" />
<div style="padding-bottom: 200px;">
<div >
<div class="jumbotron jumbotron-fluid">
  <div class="container">
    <h1 class="display-4">此帳號異常，已被停權</h1>
    <p class="lead"><span id="jumpTo">3</span>秒後自動轉跳至首頁</p>
  </div>
</div>
<script type="text/javascript">countDown(5,'index');</script>  
</div>
</div>
<jsp:include page="eric/foot.jsp" />
<script src="//cdn.bootcss.com/canvas-nest.js/1.0.1/canvas-nest.min.js"></script>
</body>
</html>