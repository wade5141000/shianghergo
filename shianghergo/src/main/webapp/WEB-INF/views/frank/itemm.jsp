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
.ellipsis {
overflow:hidden;
white-space: nowrap;
text-overflow: pp;
}
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
	<c:forEach var="groups_idLists" items="${groups_idList}">
	<div class="gsdiv" style="width:360px; word-break:break-all">
	${groups_idLists.id}
	${groups_idLists.groupsBean.id}
	
	<h2>${groups_idLists.name}</h2>
<%-- 	<a href="<spring:url value='itemm?groups_id=${groups_idList.id}'/>"> --%>
<%-- 	<p>團主: ${groups_idLists.groups_id.id}</p> --%>
	<p class="pp">說明: ${groups_idLists.detail}</p>
	<p>價格: ${groups_idLists.price}</p>

		 
	</div>
	
	</c:forEach>
	</div>
	</section>
	
	

</body>
</html>