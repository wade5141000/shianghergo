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
	height: 500px;
	width: 800px;
}

html, body {
	height: 100%;
	margin: 0;
	padding: 0;
}
</style>
<script src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
<script
	src="http://developers.google.com/maps/documentation/javascript/examples/markerclusterer/markerclusterer.js"></script>
<script>
		function getLatLong() {
			var apiKey = "AIzaSyDOg4gokNHM20oe8VUQN_O5HRQ9Nw6w3Yg";
			var api = "https://maps.googleapis.com/maps/api/geocode/json";
			var location = "新北市三重區成功路41巷13號";
			jQuery.get(api, {
				"key" : apiKey,
				"language" : "zh_tw",
				"address" : location
			}, getResult, "text");
		}
		function getResult(data) {
			// console.log(data);
			var info = JSON.parse(data);
			alert("緯度" + info.results[0].geometry.location.lat + "\n" + "經度"
					+ info.results[0].geometry.location.lng);
		}
		
		// ----------------------------------------------
		
		
	</script>
</head>
<body>
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
			    title:"aaa"+${i.index}, // 滑鼠移上去顯示資訊
			    //icon https://sites.google.com/site/gmapsdevelopment/
			    icon:"http://maps.google.com/mapfiles/ms/micons/red-pushpin.png",
			    data:"<a href='index'>${place.address}</a></br>"+
			    '<img src="showimg" style="width:60px;height:60">'
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
                    gridSize: 100,
                    imagePath: 'https://developers.google.com/maps/documentation/javascript/examples/markerclusterer/m'
                });
//			marker.setMap(map);
		}
	
	</script>

	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCge8oWH-tk9960gfNZr7tbP_zQ4PibvFQ&callback=initMap" async defer>
	</script>

	<!---  ************************************************************* -->

	<br>
	<button onclick="getLatLong()">Get Lat. Long.</button>
</body>

</html>