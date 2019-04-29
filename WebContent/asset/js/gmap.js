/**
 * 
 */

var googleMap;
var map;
var myCenter;
var infowindow;
window.onload = function(){
	myMap();
}

function myMap(){
	var latLng=new google.maps.LatLng(37.571009, 126.992377);
	googleMap=document.getElementById("googleMap");
	myCenter = new google.maps.LatLng(37.551476,126.988184);
	map=new google.maps.Map(googleMap,{center:myCenter,zoom:12});
	
	var marker = new google.maps.Marker({
		position:latLng,
	});
	//map에 marker등록
	marker.setMap(map);
	new google.maps.Marker(
			{
				position : new google.maps.LatLng(38.571009, 126.992377),
				animation : google.maps.Animation.BOUNCE,
				icon : "https://cdn0.iconfinder.com/data/icons/bicon/24/emoticon_face_smile-128.png"
			}).setMap(map);
	
	new google.maps.Marker(
			{
				position : new google.maps.LatLng(39.571009, 126.992377),
				animation : google.maps.Animation.BOUNCE,
				icon : "https://cdn0.iconfinder.com/data/icons/bicon/24/emoticon_face_smile-128.png"
			}).setMap(map);
	
	infowindow = new google.maps.InfoWindow({
		content:"이 도서관에서 책을 보유하고 있습니다."
	});
	
	google.maps.event.addListener(marker,'click',function(){
		map.setCenter(marker.getPosition());
		infowindow.open(map,marker);
		var pos = map.getZoom();//기존에 설정된 줌의 중심점
		map.setZoom(15);
		
		//window.setTimeout(function(){
			//map.setZoom(pos);
		//},1500);
	});
}

