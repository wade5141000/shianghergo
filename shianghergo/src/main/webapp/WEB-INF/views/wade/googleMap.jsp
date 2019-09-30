<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<title>Practice</title>
<style>
#map {
	height: 650px;
	width: 1000px;
	margin:auto;
	margin-left:450px
}

#groupList{
	background-color:#93ff93;
	width:400px;
	height:600px;
	margin-left:30px;
	float:left;
	overflow-y: auto;
}

html, body {
	height: 100%;
	margin: 0;
	padding: 0;
}
</style>
<script src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="http://developers.google.com/maps/documentation/javascript/examples/markerclusterer/markerclusterer.js"></script>

<script>
		function getLatLong() {
			var apiKey = "AIzaSyDOg4gokNHM20oe8VUQN_O5HRQ9Nw6w3Yg";
			var api = "https://maps.googleapis.com/maps/api/geocode/json";
			var location = "中國河北省唐山市路北区建设南路85号";
			jQuery.get(api, {
				"key" : apiKey,
				"language" : "zh_tw",
				"address" : location
			}, getResult, "text");
		}
		function getResult(data) {
			// console.log(data);
			var info = JSON.parse(data);
			
			var lat = info.results[0].geometry.location.lat;
			var lng = info.results[0].geometry.location.lng;
			
			alert("緯度" + lat + "\n" + "經度" + lng);
		}
		
		function changeMarker(gId){
			$.ajax({
				url:"http://localhost:8080/shianghergo/wade/changeMarker?gId=" + gId,
				type:"get",
				success:function(data){
					var placeList = JSON.parse(data);
					for(var i=0;i<placeList.length;i++){
						alert(placeList[i].address);
					}
					// 清除所有marker
					// 新增一個marker
				}				
			})
		}
		
		function deleteMarkers() {   
	        for (var i = 0; i < markers.length; i++) {   
	            markers[i].setMap(null);   
	        }   
	        markers = [];   
	    };  
		
	</script>
</head>
<body>
<jsp:include page="/WEB-INF/views/eric/header.jsp" ></jsp:include>

<div><button onclick="deleteMarkers()">delete</button></div>
	<div id="groupList">
	
		<h3>團購一覽</h3>
		<div class="list-group">
			  <button onclick="changeMarker(1)" class="list-group-item list-group-item-action active">所有團購</button>
			  <c:forEach var="group" items="${groups}">
			  	<button onclick="changeMarker(${group.id})" class="list-group-item list-group-item-action">${group.name}</button>
			</c:forEach> 
		</div>
	</div>

	<div id="map"></div>
	<script>
	
		var map;
		var markers = [];
		var position = [];
	
		function initMap() {
			map = new google.maps.Map(document.getElementById('map'), {
				center : {
					lat: 25.033483,
				    lng: 121.543499
				},
				zoom : 17
			});
			
			<c:forEach var="place" items="${items}" varStatus="i">
				position[${i.index}] = {lat:${place.latitude},lng:${place.longitude}};
				var marker = new google.maps.Marker({
				    position: {
				      lat: position[${i.index}].lat,
				      lng: position[${i.index}].lng
				    },
				    map: map,
				    title:"${place.groupsBean.name}", // 滑鼠移上去顯示資訊
				    //icon https://sites.google.com/site/gmapsdevelopment/
				    icon:"https://img.icons8.com/nolan/64/000000/halloween-candy.png",
				    data:"團號：<a href=''>${place.groupsBean.id}</a></br>"+
				    "團名：<a href=''>${place.groupsBean.name}</a></br>"+
				    "截止時間：${place.groupsBean.end_time}</br>"+
				    "面交地點：${place.address}<br>"+
				    "面交時間：${place.time}"
				  });
				  markers.push(marker);
				  
				  var infowindow = new google.maps.InfoWindow({
	//				    content: contentString
				  });
				  
				  marker.addListener('click', function() {  
					    infowindow.setContent( this.data );  
					    infowindow.open(map, this);  
					  });
				  
	//				  google.maps.event.addListener(marker, 'click', function () {
	//				        infowindow.open(map, marker);
	//				    });
				
			</c:forEach>
		
		var markerCluster = new MarkerClusterer(map, markers,
                {
                    gridSize: 30,
//                     maxZoom: 500,
                    imagePath: 'https://developers.google.com/maps/documentation/javascript/examples/markerclusterer/m'
                });
//			marker.setMap(map);
		}
	
	</script>

	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCge8oWH-tk9960gfNZr7tbP_zQ4PibvFQ&callback=initMap" async defer>
	</script>

	<!---  ************************************************************* -->

<!-- 	<button onclick="getLatLong()">Get Lat. Long.</button> -->
	
	<jsp:include page="/WEB-INF/views/eric/foot.jsp" ></jsp:include>
</body>

</html>