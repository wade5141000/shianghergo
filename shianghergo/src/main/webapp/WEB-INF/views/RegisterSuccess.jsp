<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" ></script>
<script src="http://static.runoob.com/assets/jquery-validation-1.14.0/lib/jquery.js"></script>
<script src="http://static.runoob.com/assets/jquery-validation-1.14.0/dist/jquery.validate.min.js"></script>
<script src="http://static.runoob.com/assets/jquery-validation-1.14.0/dist/localization/messages_zh.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" ></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" ></script>
<title>成功新增會員</title>
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
<div class='center'>
</div>
<Font color='blue' >親愛的${ loginOK.name }您好，您的輸入資料已經處理完畢</font>
<span id="jumpTo">5</span>秒后自动跳转到會員中心
<script type="text/javascript">countDown(5,'/MemberDL');</script>

</body>
</html>