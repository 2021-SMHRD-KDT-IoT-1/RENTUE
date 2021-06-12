<%@page import="com.model.CtDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>������ ȸ�� �������Դϴ�.</title>
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

							<input type="button" value="�α׾ƿ�" onclick="location.href='LogoutServiceCon'" class="button primary small">

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
						<p>ȸ������ â</p>
					</div>
				</section> -->

		<!-- Intro -->
		<section id="intro" class="wrapper style1 fullscreen fade-up" style="padding: 2em !important;">
			<div class="inner">
				<h1>Rentue-������</h1>
				<button onclick="selectOverlay('RECTANGLE')" style="margin-left:60em;">��輱 ����</button>
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
					alert("������ �߻��Ͽ����ϴ�.");
				}
			});
		});

		function show_endline() {
			var sw = new kakao.maps.LatLng(35.194278, 126.952885), // �簢�� ������ ������ ��ǥ
			ne = new kakao.maps.LatLng(35.194510, 126.953261); // �簢�� ������ �ϵ��� ��ǥ

			// �簢���� �����ϴ� ���������� �����մϴ�
			// �簢���� ������ �� ���������� LatLngBounds ��ü�� �Ѱ���� �մϴ�
			var rectangleBounds = new kakao.maps.LatLngBounds(sw, ne);

			// ������ ǥ���� �簢���� �����մϴ�
			var rectangle = new kakao.maps.Rectangle({
				bounds : rectangleBounds, // �׷��� �簢���� ���������Դϴ�
				strokeWeight : 4, // ���� �β��Դϴ�
				strokeColor : '#FF3DE5', // ���� �����Դϴ�
				strokeOpacity : 1, // ���� ������ �Դϴ� 1���� 0 ������ ���̸� 0�� �������� �����մϴ�
				strokeStyle : 'shortdashdot', // ���� ��Ÿ���Դϴ�
				fillColor : '#FF8AEF', // ä��� �����Դϴ�
				fillOpacity : 0.8
			// ä��� ������ �Դϴ�
			});

			// ������ �簢���� ǥ���մϴ�
			rectangle.setMap(_kakaoMap);
		}
		
		var options = { // Drawing Manager�� ������ �� ����� �ɼ��Դϴ�
			    map: _kakaoMap, // Drawing Manager�� �׸��� ��Ҹ� �׸� map ��ü�Դϴ�
			    drawingMode: [ // Drawing Manager�� ������ �׸��� ��� ����Դϴ�
			        kakao.maps.drawing.OverlayType.RECTANGLE
			    ],
			    // ����ڿ��� ������ �׸��� ���̵� �����Դϴ�
			    // ����ڿ��� ������ �׸���, �巡���Ҷ�, �����Ҷ� ���̵� ������ ǥ���ϵ��� �����մϴ�
			    guideTooltip: ['draw', 'drag', 'edit'], 
			    rectangleOptions: {
			        draggable: false,
			        removable: false,
			        editable: false,
			        strokeColor: '#39f', // �ܰ��� ��
			        fillColor: '#39f', // ä��� ��
			        fillOpacity: 0.5 // ä���� ����
			    }
			};

			// ���� �ۼ��� �ɼ����� Drawing Manager�� �����մϴ�
			var manager = new kakao.maps.drawing.DrawingManager(options);

			// ��ư Ŭ�� �� ȣ��Ǵ� �ڵ鷯 �Դϴ�
			function selectOverlay(type) {
			    // �׸��� ���̸� �׸��⸦ ����մϴ�
			    manager.cancel();

			    // Ŭ���� �׸��� ��� Ÿ���� �����մϴ�
			    manager.select(kakao.maps.drawing.OverlayType[type]);
			}
	</script>

</body>
</html>