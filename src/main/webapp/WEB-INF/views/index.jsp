<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>KaKaoMap Study : olrlobt</title>
</head>
<body>
	<div id="map" style="width: 1000px; height: 800px;"></div> 
	
	﻿<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>﻿
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=18190dd1b0d3a9e9dd177bd472b03d20&libraries=clusterer"></script>
	<script type="text/javascript">
		
		// <맵 생성>
		var container = document.getElementById('map'); 
		var options = { 
			center: new kakao.maps.LatLng(37.402707, 126.922044), 
			level: 12
		};
	
		var map = new kakao.maps.Map(container, options); 
		// </맵 생성>
		
		
		var positions = [
		    {
		        title: '안양역', 
		        "lat": 37.402707,
		      	"lng": 126.922044
		    },
		    {
		        title: '안양역 주위 1', 
		        "lat": 37.400707,
		      	"lng": 126.920044
		    },
		    {
		        title: '안양역 주위 2', 
		        "lat": 37.403007,
		        "lng": 126.925044
		    },
		    {
		        title: '안양역 주위 3',
		        "lat": 37.405707,
		      	"lng": 126.925044
		    }
		];
		
			
		var markers = positions.map(function(position) {  // 마커를 배열 단위로 묶음
		    return new kakao.maps.Marker({
		        position : new kakao.maps.LatLng(position.lat, position.lng)
		    });
		});
		
		var clusterer = new kakao.maps.MarkerClusterer({
	        map: map, // 마커들을 클러스터로 관리하고 표시할 지도 객체 
	        averageCenter: true, // 클러스터에 포함된 마커들의 평균 위치를 클러스터 마커 위치로 설정 
	        minLevel: 5, // 클러스터 할 최소 지도 레벨 
	        markers: markers // 클러스터에 마커 추가
	    });
		
		
		var marker = new kakao.maps.Marker({
		    position: new kakao.maps.LatLng( 37.389794,126.950768 )
		});

		clusterer.addMarker(marker);
		clusterer.removeMarker(marker);
	
	</script>
</body>
</html>