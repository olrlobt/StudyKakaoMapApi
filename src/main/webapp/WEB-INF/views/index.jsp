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
	
	<a href="/maps/building"> maps gogo</a>
	
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
		        'title': '안양역', 
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
		
		var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_red.png', // 마커이미지의 주소 
	    imageSize = new kakao.maps.Size(64, 69), // 마커이미지의 크기입니다
	    imageOption = {offset: new kakao.maps.Point(27, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
		      
		// 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
		var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption)
		   
			
		var markers = positions.map(function(position) {  // 마커를 배열 단위로 묶음
		    return new kakao.maps.Marker({
		        position : new kakao.maps.LatLng(position.lat, position.lng),
		    	title : position.title,
// 		    	image : markerImage
		    });
		});
		
		var clusterer = new kakao.maps.MarkerClusterer({
	        map: map, // 마커들을 클러스터로 관리하고 표시할 지도 객체 
	        averageCenter: true, // 클러스터에 포함된 마커들의 평균 위치를 클러스터 마커 위치로 설정 
	        minLevel: 5, // 클러스터 할 최소 지도 레벨 
	        markers: markers // 클러스터에 마커 추가
	    });
		
		
		var iwContent = '<div style="padding:5px;">Hello World! <br><a href="https://map.kakao.com/link/map/Hello World!,33.450701,126.570667" style="color:blue" target="_blank">큰지도보기</a> <a href="https://map.kakao.com/link/to/Hello World!,33.450701,126.570667" style="color:blue" target="_blank">길찾기</a></div>'; // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
		
		var infowindow = positions.map(function(position) {  // 마커를 배열 단위로 묶음
		    return new kakao.maps.InfoWindow({
			    position : new kakao.maps.LatLng(position.lat, position.lng),
			    content : iwContent 
			});
		});
		
// 		infowindow.open(map, marker); 
		
		markers.map(function(o){
			
			var infowindow = new kakao.maps.InfoWindow({
			    content : '<div style="padding:5px;">' + o.Gb + '</div>'
			});
			
			infowindow.open(map, o);
		});
		
		

// 		clusterer.addMarker(marker);
// 		clusterer.removeMarker(marker);
	
	</script>
</body>
</html>