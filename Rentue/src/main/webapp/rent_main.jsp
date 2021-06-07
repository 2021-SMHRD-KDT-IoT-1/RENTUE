<%@page import="com.model.RentDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.model.DeviceDTO"%>
<%@page import="com.model.DeviceDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>렌탈업체 회원 페이지입니다.</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="assets/css/rent_main.css" />
<noscript>
	<link rel="stylesheet" href="assets/css/noscript.css" />
</noscript>
<script type='text/javascript' src='//dapi.kakao.com/v2/maps/sdk.js?appkey=c396fe0efc7b0e5f37418f17f1fd034d'></script>
</head>
<body class="is-preload">

	<%
	RentDTO dto = (RentDTO) session.getAttribute("dto");
	DeviceDAO dao = new DeviceDAO();
	ArrayList<DeviceDTO> list = dao.select(dto.getRent_id(), null);
	%>


	<!-- Sidebar -->
	<section id="sidebar">
		<div class="inner">
			<ul class="actions small">
				<li><a href="#" class="button small">홈으로</a></li>
				<li><input type="button" value="my page"
					onclick="window.open('mypage.jsp', '마이페이지', 'width=900px, height=1200px')"
					class="button primary small"></li>
				<li>
					<!-- 로그인 한 상태이니까 로그인 버튼이 로그아웃으로 바뀌어야 함 --> <input type="button"
					value="로그인" onclick="location.href='LogoutServiceCon'"
					class="button primary small">
				</li>

			</ul>
			<nav>
				<ul>
					<li><a href="#intro">RenTue MAP</a></li>
					<li><a href="#one">Manage RenTue</a></li>
					<li><a href="#two">Contact RenTue</a></li>


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
		<section id="intro" class="wrapper style1 fullscreen fade-up">
			<div class="inner">
				<h1>Rentue-렌트업체</h1>
				<p>렌트 지도API 구현하기</p>
			</div>
			<div id="map" style="width: 800px; height: 600px; background-color:black; margin-left: 20px;"></div>
		</section>

		<!-- One -->
		<section id="one" class="wrapper style2 fullscreen spotlights">
			<section>

				<div class="content">
					<div class="inner">
						<h2>Rentue 재고관리</h2>
					</div>
				</div>
			</section>


			<label>
				<div>

					<select id="targetSel" style="width: 200px; display: inline;">
						<option value="A" name="Rent_id">핸디형</option>
						<option value="B" name="Rent_id">튜브형</option>
					</select>
					<button id="submit" type="button" onclick="button_ps()">추가등록</button>
					<button>삭제</button>


				</div>
			</label>
			<section>

				<div>
					<select id="filter" style="width: 200px;">
						<option value="all">전체 기기</option>
						<option value="available">대여가능한 기기</option>
						<option value="not-available">대여중인 기기</option>
						<option value="disable">고장 기기</option>
				</div>

				<div overflow="scroll">

					</select>

					<table id="kkk">
						<!-- 첫번째 행 -->
						<tr>
							<td>기기번호</td>
							<td>타입</td>
							<td>렌탈현황</td>
							<td>고장여부</td>
							<td>비고</td>

						</tr>
						<!-- 두번째 행부터는 내용 들어가야 함 -->


						<%
						for (int i = 0; i < list.size(); i++) {
						%>
						<tr class='drow'>
							<td><%=list.get(i).getDevice_num()%></td>
							<td><%=list.get(i).getDevice_type()%></td>
							<td><%=list.get(i).getRent_state()%></td>
							<td><%=list.get(i).getBroken()%></td>
							<td><a
								href="DeleteServiceCon?device_num=<%=list.get(i).getDevice_num()%>">삭제</a></td>
						</tr>
						<%
						}
						%>
					</table>
				</div>

			</section>


		</section>

		<!-- Two -->
		<section id="two" class="wrapper style1 fade-up">
			<div class="inner">
				<h2>Get in touch</h2>
				<p>문의 사항</p>
				<div class="split style1">
					<section>
						<form method="post" action="#">
							<div class="fields">
								<div class="field">
									<label for="name">로그인한 아이디를 출력하세요</label> <input type="text"
										name="title" id="title" placeholder="글 제목을 입력해주세요" />
								</div>
								<!-- <div class="field half">
												<label for="email">Email</label>
												<input type="text" name="email" id="email" />
											</div> -->
								<div class="field">
									<label for="message">Message</label>
									<textarea name="message" id="message" rows="5"></textarea>
								</div>
							</div>
							<ul class="actions">
								<li><a href="" class="button submit">Send Message</a></li>
							</ul>
						</form>
					</section>
					<section>
						<ul class="contact">
							<li>
								<h3>Address</h3> <span>31-15 광주아트센터 3층<br /> 광주광역시, 동구
									예술길<br /> 대한민국
							</span>
							</li>
							<li>
								<h3>Email</h3> <a href="#">Rentue@rentue.co.kr</a>
							</li>
							<li>
								<h3>Phone</h3> <span>(000) 000-0000</span>
							</li>
							<li>
								<h3>Social</h3>
								<ul class="icons">
									<li><a href="#" class="icon brands fa-twitter"><span
											class="label">Twitter</span></a></li>
									<li><a href="#" class="icon brands fa-facebook-f"><span
											class="label">Facebook</span></a></li>
									<li><a href="#" class="icon brands fa-github"><span
											class="label">GitHub</span></a></li>
									<li><a href="#" class="icon brands fa-instagram"><span
											class="label">Instagram</span></a></li>
									<li><a href="#" class="icon brands fa-linkedin-in"><span
											class="label">LinkedIn</span></a></li>
								</ul>
							</li>
						</ul>
					</section>
				</div>
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
	<script type="text/javascript">
					$(document).ready(function() {
						
						$("#filter").on("change", function() {
							var filterType = $("#filter").val();
							$("#kkk").find(".drow").each(function(i, v) {
								switch (filterType) {
									case "all":
										$(this).show();
										break;
									case "available":
										if ($(this).find("td").eq(2).text() == 'F') {
											$(this).show();
										} else {
											$(this).hide();
										}
										break;
									case "not-available":
										if ($(this).find("td").eq(2).text() == 'T') {
											$(this).show();
										} else {
											$(this).hide();
										}
										break;
									case "disable":
										if ($(this).find("td").eq(3).text() == 'T') {
											$(this).show();
										} else {
											$(this).hide();
										}
										break;
								}
							});
						});
						
						
						$("#targetSel").on("change", function() {
							<%-- <%
							DeviceDTO dto2 = new DeviceDTO();
							String type ="";
							list = dao.select(dto.getRent_id(), dto.);
							%> --%>
							  $.ajax({
								 	data: {
								        'gg' : '<%=dto.getRent_id()%>',
								        'gg2' : $("#targetSel").val()
							        },
							        url:'SelectServiceCon',
							        contentType : "application/json; charset:euc-kr",
									dataType: "JSON",
							        success: function(jsonList){
							        	console.log(jsonList);
							        	$.each(jsonList, function(i, v) {
											var val = "<tr class='drow'><td>" + v.device_num + "</td>";
											val += "<td>" + v.device_type+"</td>";
											val += "<td>" + v.rent_state+"</td>";
											val += "<td>" + v.broken+"</td>";
											val += "<td><a href='DeleteServiceCon?device_num=" + v.device_num + "'>삭제</a></td></tr>";
											$("#kkk").append(val);
							        	});
							        	// console.log(data);
							        },
							        error:function(a, b, c){
							        	console.log(a);
							        	console.log(b);
							        	console.log(c);
							            alert("에러 발생~~ \n");
							    	}
								});
							
							$("#kkk").find("tr").each(function(i, v) {
								if (i > 0) {
									$(this).remove();
								}
							});
						}).trigger("change");
					});
					
  function button_ps(){
			
			 targetSel = $('#targetSel').val();
			

		    $.ajax({
		        url:'InsertServiceCon',
		        type:'post',
	 	        data: {
		        	
		        	targetSel : targetSel,
		        
		        	},
 		         
		        success:function(){
		            console.log("완료!");
		            location.reload();
		        },
		        error:function(){
		            alert("에러 발생~~ \n");
		    	}
			});
		
		
		}
   var lat = 36.81415176;
   var lng = 127.11072775;
   var lat2 = 36.81415176;
   var lng2 = 127.11072775;
   var container = document.getElementById("map");
   var options = {
      center: new kakao.maps.LatLng(lat, lng),
      level : 5
   };
   var _kakaoMap = new kakao.maps.Map(container, options);
   
   //var mapTypeControl = new kakao.maps.MapTypeControl();
  // _kakaoMap.addControl(mapTypeControl, kakao.maps.ControlPosition.RIGHTTOP);
  
  var marker = null;
  var marker2 = null;
function tt() {
	try {
	  marker.setMap(null);
	} finally {
		lat = lat - 0.000012;
		lng = lng - 0.000012;
	    var coord = new kakao.maps.LatLng(lat, lng);
		//_kakaoMap.setCenter(coord);
	    marker = new kakao.maps.Marker({position:coord});
		marker.setMap(_kakaoMap);
		
		try {
		  	marker2.setMap(null);
		} finally {
			lat2 = lat2 + 0.000012;
			lng2 = lng2 + 0.000012;
			var coord2 = new kakao.maps.LatLng(lat2, lng2);
			marker2 = new kakao.maps.Marker({position:coord2});
			marker2.setMap(_kakaoMap);
		}
	}
}
  
  $(document).ready(function() {
	  var timer = setInterval(tt, 100);
  });
 
</script>
</body>
</html>