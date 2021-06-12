<%@page import="com.model.CtDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>관제소 회원 페이지입니다.</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="assets/css/rent_main.css" />
<noscript>
	<link rel="stylesheet" href="assets/css/noscript.css" />
</noscript>
<style>
li {
	list-style: none;
}

#logo {
	margin-left: 1.7em;
	width: 290px;
	heigh: 300px;
}
</style>
</head>
<body class="is-preload">

	<%
	CtDTO dto = (CtDTO) session.getAttribute("dto");
	%>

	<!-- Sidebar -->
	<section id="sidebar">
		<div style="float: left;">
			<p style="text-align: left;">
				<img src="images/logo2.png" id="logo">
			</p>
			<div>
				<div class="inner">
					<div style="align: right; margin-bottom: 2em;">
						<p>

							<input type="button" value="로그아웃" onclick="location.href='LogoutServiceCon'" class="button primary small">

						</p>
					</div>
					<nav>
						<ul>
							<li><a href="#intro">RenTue MAP</a></li>
						</ul>
					</nav>
				</div>
	</section>

	<!-- Wrapper -->
	<div id="wrapper">

		<!-- <section>
					<div id = "join">
						<p>회원가입 창</p>
					</div>
				</section> -->

		<!-- Intro -->
		<section id="intro" class="wrapper style1 fullscreen fade-up" style="padding: 2em !important;">
			<div class="inner">
				<h1>Rentue-관제소</h1>
				<button onclick="selectOverlay('RECTANGLE')" style="margin-left:60em;">경계선 설정</button>
				<div id="map" style="width: 800px; height: 600px;"></div>

			</div>
		</section>



	</div>

	<!-- Footer -->
	<footer id="footer" class="wrapper style1-alt">
		<div class="inner">
			<ul class="menu">
				<li>&copy; Untitled. All rights reserved.</li>
				<li>Design: <a href="http://html5up.net">HTML5 UP</a></li>
			</ul>
		</div>
	</footer>

	<!-- Scripts -->
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/jquery.scrollex.min.js"></script>
	<script src="assets/js/jquery.scrolly.min.js"></script>
	<script src="assets/js/browser.min.js"></script>
	<script src="assets/js/breakpoints.min.js"></script>
	<script src="assets/js/util.js"></script>
	<script src="assets/js/main.js"></script>
	<!-- <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=92da30628c14e3e7954ea453ba17c38a"></script> -->
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=92da30628c14e3e7954ea453ba17c38a&libraries=drawing"></script>
	<script>
		
	/* var coords = [ { x: 35.19450, y: 126.95300 },  
			  { x: 35.19448, y: 126.95298 },  
			  { x: 35.19442, y: 126.95294 }, 
			  { x: 35.19438, y: 126.95293 },  
			  { x: 35.19436, y: 126.95297 },  
			  { x: 35.19435, y: 126.95300 },  
			  { x: 35.19433, y: 126.95303 },  
			  { x: 35.19430, y: 126.95311 } ];
		
		var container_1 = document.getElementById("map");
		for(key in coords){
		   var options_1 = {
		      center: new kakao.maps.LatLng(coords.x, coords.y),
		      level : 1
		   };
		   var _kakaoMap = new kakao.maps.Map(container_1, options_1);
		   var marker_1 = null;
			function tt() {
				try {
				  marker_1.setMap(null);
				} finally {
					lat_1 = lat_1 - 0.000012;
					lng_1 = lng_1 - 0.000012;
				    var coord_1 = new kakao.maps.LatLng(lat_1, lng_1);
					//_kakaoMap.setCenter(coord);
				    marker_1 = new kakao.maps.Marker({position:coord_1});
					marker_1.setMap(_kakaoMap);

				}
			}
		} */

		//var mapTypeControl = new kakao.maps.MapTypeControl();
		// _kakaoMap.addControl(mapTypeControl, kakao.maps.ControlPosition.RIGHTTOP);

		var lat_1 = 35.194290544445664;
		var lng_1 = 126.95302191513616;
		var container_1 = document.getElementById("map");
		var options_1 = {
			center : new kakao.maps.LatLng(lat_1, lng_1),
			level : 1,
			maxLevel : 1
		};
		var _kakaoMap = new kakao.maps.Map(container_1, options_1);

		kakao.maps.event.addListener(_kakaoMap, 'click', function(mouseEvent) {
			var latlng = mouseEvent.latLng;
			console.log(latlng);
		});
		//var mapTypeControl = new kakao.maps.MapTypeControl();
		// _kakaoMap.addControl(mapTypeControl, kakao.maps.ControlPosition.RIGHTTOP);

		var coords = [ {
			x : 35.19450,
			y : 126.95300,
			device : 82
		}, {
			x : 35.19448,
			y : 126.95298,
			device : 83
		}, {
			x : 35.19442,
			y : 126.95294,
			device : 84
		}, {
			x : 35.19438,
			y : 126.95293,
			device : 85
		}, {
			x : 35.19436,
			y : 126.95297,
			device : 86
		}, {
			x : 35.19435,
			y : 126.95300,
			device : 87
		}, {
			x : 35.19433,
			y : 126.95303,
			device : 88
		}, {
			x : 35.19430,
			y : 126.95311,
			device : 89
		} ];

		var tubes = new Object();
		var markerArray = new Array();

		var total = coords.length;
		var avail = 0;
		$.each(coords, function(i, v) {
			var overlay = "<div class='tubeLabel'><span>" + v.device
					+ "</span></div>";
			$(".tubeLabel").css("margin-top", "8px");
			var coordinate = new kakao.maps.LatLng(v.x, v.y);
			//_kakaoMap.setCenter(coord);
			var marker = new kakao.maps.Marker({
				position : coordinate
			});
			marker.device = coords.device;
			marker.setMap(_kakaoMap);
			var co = new kakao.maps.CustomOverlay({
				position : coordinate,
				content : overlay
			});
			co.setMap(_kakaoMap);
			markerArray.push(marker);

			$.ajax({
				data : {
					device_id : v.device
				},
				url : 'SelectDeviceState',
				contentType : "application/json; charset:euc-kr",
				dataType : "JSON",
				success : function(jsonList) {
					if ($.trim(jsonList.state) == 'F') {
						avail++;
					}
					$("#statediv").text(avail + "/" + total);
				},
				error : function(a, b, c) {
					alert("에러가 발생하였습니다.");
				}
			});
		});

		function show_endline() {
			var sw = new kakao.maps.LatLng(35.194278, 126.952885), // 사각형 영역의 남서쪽 좌표
			ne = new kakao.maps.LatLng(35.194510, 126.953261); // 사각형 영역의 북동쪽 좌표

			// 사각형을 구성하는 영역정보를 생성합니다
			// 사각형을 생성할 때 영역정보는 LatLngBounds 객체로 넘겨줘야 합니다
			var rectangleBounds = new kakao.maps.LatLngBounds(sw, ne);

			// 지도에 표시할 사각형을 생성합니다
			var rectangle = new kakao.maps.Rectangle({
				bounds : rectangleBounds, // 그려질 사각형의 영역정보입니다
				strokeWeight : 4, // 선의 두께입니다
				strokeColor : '#FF3DE5', // 선의 색깔입니다
				strokeOpacity : 1, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
				strokeStyle : 'shortdashdot', // 선의 스타일입니다
				fillColor : '#FF8AEF', // 채우기 색깔입니다
				fillOpacity : 0.8
			// 채우기 불투명도 입니다
			});

			// 지도에 사각형을 표시합니다
			rectangle.setMap(_kakaoMap);
		}
		
		var options = { // Drawing Manager를 생성할 때 사용할 옵션입니다
			    map: _kakaoMap, // Drawing Manager로 그리기 요소를 그릴 map 객체입니다
			    drawingMode: [ // Drawing Manager로 제공할 그리기 요소 모드입니다
			        kakao.maps.drawing.OverlayType.RECTANGLE
			    ],
			    // 사용자에게 제공할 그리기 가이드 툴팁입니다
			    // 사용자에게 도형을 그릴때, 드래그할때, 수정할때 가이드 툴팁을 표시하도록 설정합니다
			    guideTooltip: ['draw', 'drag', 'edit'], 
			    rectangleOptions: {
			        draggable: false,
			        removable: false,
			        editable: false,
			        strokeColor: '#39f', // 외곽선 색
			        fillColor: '#39f', // 채우기 색
			        fillOpacity: 0.5 // 채우기색 투명도
			    }
			};

			// 위에 작성한 옵션으로 Drawing Manager를 생성합니다
			var manager = new kakao.maps.drawing.DrawingManager(options);

			// 버튼 클릭 시 호출되는 핸들러 입니다
			function selectOverlay(type) {
			    // 그리기 중이면 그리기를 취소합니다
			    manager.cancel();

			    // 클릭한 그리기 요소 타입을 선택합니다
			    manager.select(kakao.maps.drawing.OverlayType[type]);
			}
	</script>

</body>
</html>