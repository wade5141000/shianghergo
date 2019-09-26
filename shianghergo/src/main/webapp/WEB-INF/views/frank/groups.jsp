<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Group</title>
<style>
.gsdiv{
/*  border-radius: 20PX; */
 background-color:yellow;

 display:inline-block;
}
.pp{
overflow: hidden;

text-overflow: ellipsis;

white-space: nowrap; 
}


</style>


</head>
<body>
	<section>
		<div>

			<div>
				<h1>開團中列表</h1>
	
			</div>
		</div>

	</section>
	<section>
<!-- 	<div> -->
<!-- 	<img width="100" height="150" -->
<%-- 	   src="<c:url value='/getPicture/${groups.id}'/>"/> --%>
	
<!-- 	</div> -->
	<div>
	<c:forEach var="group" items="${groups}">
	<div class="gsdiv" style="width:360px; word-break:break-all">
	<h2 class="pp"><a href="<spring:url value='group?id=${group.id}&mid=${group.memberBean.id}'/>"/>${group.name}</h2>
	<p>團主: ${group.memberBean.id}</p>
	<p>團主: ${group.memberBean.name}</p>
	
	<p class="pp">說明: ${group.detail}</p>
	<p>截止時間: ${group.end_time}</p>
	
				<div>
				<img width='300' height='250' src="<c:url value='/frank/getgroupPicture/${group.id }' />"/>
					</div>
	<form action="<spring:url value='group?id=${group.id}'/>">
	<input type="hidden" value="${group.id}" name="target"/>

	</form>

	
	</div>
	
	</c:forEach>
	</div>
	</section>
	
	

</body>
</html>