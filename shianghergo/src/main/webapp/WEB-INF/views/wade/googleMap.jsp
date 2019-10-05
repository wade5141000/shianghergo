<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<title>饗合購地圖</title>
<style>
#map {
	height: 650px;
	width: 1000px;
	margin:auto;
	margin-left:450px
}

#groupList{
/* 	background-color:#93ff93; */
	width:370px;
	height:600px;
	margin-left:30px;
	float:left;
	overflow-y: auto;
}

.bline{
	line-height:0.5em;
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
		var lastOne = 1;


// 		function getLatLong(addr) {
// 			var apiKey = "AIzaSyDOg4gokNHM20oe8VUQN_O5HRQ9Nw6w3Yg";
// 			var api = "https://maps.googleapis.com/maps/api/geocode/json";
// 			var location = addr;
// 			alert("地址是: " + location);
			
// 			jQuery.get(api, {
// 				"key" : apiKey,
// 				"language" : "zh_tw",
// 				"address" : location
// 			}, getResult, "text");
// 		}
// 		function getResult(data) {
// 			// console.log(data);
// 			var info = JSON.parse(data);
			
// 			var lat = info.results[0].geometry.location.lat;
// 			var lng = info.results[0].geometry.location.lng;
			
// 			$.ajax({
// 				url:"http://localhost:8080/shianghergo/setLatLng?lat="+lat+"&lng="+lng,
// 				type:"get",
// 				success:function(data){
					
// 				},
// 			})
			
			
// 			alert("緯度" + lat + "\n" + "經度" + lng);
// 		}
		
		function changeMarker(gId){
			
			$.ajax({
				url:"http://localhost:8080/shianghergo/wade/changeMarker?gId=" + gId,
				type:"get",
				success:function(data){
					deleteMarkers();
					var mapsa = JSON.parse(data);
					var placeList = mapsa["placeList"];
					var groupList = mapsa["groupList"];
					
					if(!(gId == lastOne)){
						$("#l"+gId).addClass("active");
						$("#l"+lastOne).removeClass("active");
						
						lastOne = gId;
					}
					
					for(var i=0;i<placeList.length;i++){
						var marker = new google.maps.Marker({
						    position: {
						      lat: placeList[i].latitude,
						      lng: placeList[i].longitude
						    },
						    map: map,
						    title:groupList[i].name, // 滑鼠移上去顯示資訊
						    icon:"https://img.icons8.com/nolan/64/000000/halloween-candy.png",
						    data:"<h5>團號：<a href=''>"+ groupList[i].id +"</a></h5>"+
						    "<h5>團名：<a href=''>"+ groupList[i].name +"</a></h5>"+
						    "<h6>截止時間："+groupList[i].end_time+"</h6>"+
						    "<h6>面交地點：" + placeList[i].address+"</h6>"+
						    "<h6>面交時間："+placeList[i].time+"</h6>"
						  });
						  markers.push(marker);
						  var infowindow = new google.maps.InfoWindow({
			//				    content: contentString
						  });
						  marker.addListener('click', function() {  
							    infowindow.setContent( this.data );  
							    infowindow.open(map, this);  
							  });
					}
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
<body style="background-color: #fffaf4;">
<jsp:include page="/WEB-INF/views/eric/header.jsp" ></jsp:include>
<jsp:include page="/WEB-INF/views/wade/hotsell.jsp" ></jsp:include>
	<div id="groupList">
	
		<div class="list-group">
			  <button id="l1" onclick="changeMarker(1)" class="list-group-item list-group-item-action active bline">所有團購</button>
			  <c:forEach var="group" items="${groups}">
			  	<button id="l${group.id}" onclick="changeMarker(${group.id})" class="list-group-item list-group-item-action bline">&#187 ${group.name}</button>
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
				    data:"<h5>團號：<a href=''>${place.groupsBean.id}</a></h5>"+
				    "<h5>團名：<a href=''>${place.groupsBean.name}</a></h5>"+
				    "<h6>截止時間：${place.groupsBean.end_time}</h6>"+
				    "<h6>面交地點：${place.address}</h6>"+
				    "<h6>面交時間：${place.time}</h6>"
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