<%@page import="com.model.RentDTO"%>
<%@page import="com.model.CtDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.model.DeviceDTO"%>
<%@page import="com.model.DeviceDAO"%>
<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>

<style>
li {
	list-style: none;
}

#logo {
	margin-left: 1.7em;
	width: 290px;
	heigh: 300px;
}

#logo_small {
	float: left;
	width: 5.25em;
	heigh: 3em;
}
</style>
<head>
<meta charset="EUC-KR">
<title>렌탈업체 회원 페이지입니다.</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="assets/css/rent_main.css" />
<noscript>
	<link rel="stylesheet" href="assets/css/noscript.css" />
</noscript>

</head>
<body class="is-preload">

	<%
	request.setCharacterEncoding("EUC-KR");
	RentDTO dto = null;
	String ct_name = null;
	if (session.getAttribute("dto") != null) {
		dto = (RentDTO) session.getAttribute("dto");
		String ct_id = dto.getCt_id();
		CtDAO ct_dao = new CtDAO();
		ct_name = ct_dao.setCt(ct_id);
		System.out.println(ct_name);
	} else {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인을 하세요.')");
		script.println("location.href='intro.jsp'");
		script.println("</script>");
	}
	DeviceDAO dao = new DeviceDAO();
	ArrayList<DeviceDTO> list = dao.select(dto.getRent_id(), null);
	%>



	<!-- Sidebar -->
	<section id="sidebar">
		<div style="float: left;">
			<p style="text-align: left;">
				<img src="images/logo2.png" id="logo">
			</p>
			<div>
				<div class="inner">
					<!-- <ul class="actions small"> -->

					<div style="align: right; margin-bottom: 2em;">
						<p>
							<button id="btn-modal" class="button primary small">MY PAGE</button>
							<input type="button" value="로그아웃" onclick="location.href='LogoutServiceCon'" class="button primary small">

						</p>
					</div>

					<!-- 	</ul> -->
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


		<!-- Intro -->
		<section id="intro" class="wrapper style1 fullscreen fade-up">
			<div class="inner" style="padding: 2em !important;">
				<h1>Rentue_렌트업체</h1>
				<p>렌튜 실시간 위치확인하기</p>
				<div id="map" style="width: 1000px; height: 600px; background-color: black; margin-left: 20px;"></div>
				<div style="float: right;">렌트가능튜브/전체튜브 : <span id="statediv"></span></div>
			</div>


			<!-- 회원정보 수정 모달창 -->
			<div id="modal" class="modal-overlay" style="position: absolute;">
				<div class="modal-window">
					<div class="close-area" style="float: right;">X</div>
					<div class="title">
						<img src="images/logo_small.png" id="logo_small">
						<div style="float: left; margin-right: 12.5em; margin-left: 2em; margin-top: 0.5em;">

							<h3>회원정보 수정</h3>

						</div>
					</div>
					<div class="content">
						<p>
						<div>
							<li>ID&nbsp;&nbsp;&nbsp;<%=dto.getRent_id()%></li>
							<li>PW<input style="height: 2em; width: 12em;" class="field half" type="password" placeholder="변경할 PW를 입력하세요" id="pw"></li>
							<li style="float: left; margin-right: 0.75em;">업체명<input type="text" id="rent_name" value="<%=dto.getRent_name()%>"
								style="height: 2em; width: 12em;"></li>
							<li id="r_num">사업자번호<input type="text" id="rent_num" value="<%=dto.getRent_num()%>" style="height: 2em; width: 12em;"></li>
							<li>주소<input type="text" id="sample5_address" value="<%=dto.getRent_addr()%>" style="height: 2.25em;"> <input type="button"
								onclick="sample5_execDaumPostcode()" value="주소 검색" style="height: 3.75em; line-height: 2.75em; margin-top: 0.75em;"></li>
							<li id="select"><select id="targetSel" style="height: 2.25em;">
									<option value="<%=dto.getCt_id()%>"><%=ct_name%></option>

							</select>
								<button id="search" style="height: 3.75em; line-height: 2.75em; margin-top: 0.75em;">가까운 관제소 찾기</button></li>
							<li><button id="submit" type="button" onclick="button_update()" style="height: 3.75em; line-height: 2.75em; margin-top: 3em;">UPDATE</button></li>


							<div id="map_update" style="width: 170px; height: 170px; margin-top: -100px; float: right; display: none;"></div>
							<!-- 안보이게 하려면 display: none; 추가 -->
						</div>
					</div>
					</p>
		</section>





		<!-- One -->
		<section id="one" class="wrapper style2 fullscreen spotlights" style="padding: 2em !important;">


			
			<div class="content">
				<div class="inner">
					<h2>Rentue 재고관리</h2>
				</div>
			</div>
			<br>
			<label>
				<div>
					<input type="text" id="search_device" placeholder="검색어를 입력하세요" style="width: 400px; float: left;" /> <br> <br>
				</div>
				<div>

					<select id="filter" style="width: 250px; float: left; margin-right: 20px; display: inline;">
						<option value="all">전체 기기</option>
						<option value="available">대여가능한 기기</option>
						<option value="not-available">대여중인 기기</option>
						<option value="disable">고장 기기</option>
					</select>
					<select id="Sel" style="width: 200px; display: inline;">
						<option value="A" selected>핸디형</option>
						<option value="B">튜브형</option>
					</select>

					<button id="submit" type="button" onclick="button_ps()" style="margin: 0px;">추가등록</button>
					<input type="button" id="chk_delbtn" value="체크항목 삭제" />

				</div>
			</label>


			<div>

				<div id="device_div" style="width: 100%; height: 30em; overflow: auto">
					<div id="device_div" style="width: 100%; height: 30em; overflow: auto">
						<table id="kkk">
							<thead>
								<!-- 첫번째 행 -->
								<tr>
									<td>No.</td>
									<td>기기번호</td>
									<td>타입</td>
									<td>렌탈현황</td>
									<td>고장여부</td>
									<td>렌탈</td>
									<td>고장</td>
									<td><input type='checkbox' id="del_check_all" style='margin-right: 0 !important; appearance: auto !important; opacity: 100 !important;' />삭제</td>

								</tr>
							</thead>
							<tbody>

								<!-- 두번째 행부터는 내용 들어가야 함 -->

								<%
								for (int i = 0; i < list.size(); i++) {
									int rowNum = i + 1;
								%>
								<tr class='drow'>
									<td><%=rowNum%></td>
									<td><%=list.get(i).getDevice_num()%></td>
									<td>
										<%
										if (list.get(i).getDevice_type().equals("B")) {
										%> 튜브형 <%
										} else {
										%> 핸디형 <%
										}
										%>
									</td>
									<td>
										<%
										if (list.get(i).getRent_state().equals("F")) {
										%> 대기 <%
										} else {
										%> 대여중 <%
										}
										%>
									</td>
									<td>
										<%
										if (list.get(i).getBroken().equals("F")) {
										%> 정상 <%
										} else {
										%> 고장 <%
										}
										%>
									</td>
									<td><a href="Device_State_Update?device_num=<%=list.get(i).getDevice_num()%>">렌탈</a></td>
									<td><a href="Device_broken_update?device_num=<%=list.get(i).getDevice_num()%>">고장</a></td>
									<td><input type='checkbox' class='del_check' style='appearance: auto !important; opacity: 100 !important;' /></td>
								</tr>
								<%
								}
								%>
							</tbody>
						</table>
					</div>
				</div>
		</section>





		<!-- Two -->
		<section id="two" class="wrapper style1 fullscreen fade-up">
			<div class="inner">
				<section style="padding: 2em !important;">
					<h2>Get in touch</h2>
					<p>문의 사항</p>
					<div class="split style1">
						<section>
							<div class="fields">
								<div class="field">
									<label for="name"><%=dto.getRent_id()%></label> <input type="text" name="title" id="title" placeholder="글 제목을 입력해주세요" />
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
							<br>
							<ul class="actions">
								<li><button onclick="send_message();">Send Message</button></li>
							</ul>
						</section>
						<section>
							<ul class="contact">
								<li>
									<h3>Address</h3> <span> 31-15 광주아트센터 3층 B<br /> 광주광역시, 동구 예술길<br /> 대한민국
								</span>
								</li>
								<li>
									<h3>Email</h3> <a href="#">Rentue@rentue.co.kr</a>
								</li>
								<li>
									<h3>Phone</h3> <span>(062) 5882-5882</span>
								</li>
								<li>
									<h3>Social</h3>
									<ul class="icons">
										<li><a href="#" class="icon brands fa-twitter"><span class="label">Twitter</span></a></li>
										<li><a href="#" class="icon brands fa-facebook-f"><span class="label">Facebook</span></a></li>
										<li><a href="#" class="icon brands fa-github"><span class="label">GitHub</span></a></li>
										<li><a href="#" class="icon brands fa-instagram"><span class="label">Instagram</span></a></li>
										<li><a href="#" class="icon brands fa-linkedin-in"><span class="label">LinkedIn</span></a></li>
									</ul>
								</li>
							</ul>
						</section>
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

	<!-- 주소 선택시 지도 뜨는 코드 -->
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<!-- <script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=본인앱키주소입력하기!!!!!&libraries=services"></script> -->
	<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=92da30628c14e3e7954ea453ba17c38a&libraries=services"></script>


	<script type="text/javascript">
	$(document).ready(function() {
		$("#del_check_all").on("click", function() {
			$(document).find(".del_check").each(function (i, v) {
				if ($(this).parent().parent().css("display") != "none") {
					if ($("#del_check_all").is(":checked")) {
						$(this).prop("checked", true);
					} else {
						$(this).prop("checked", false);
					}
				}
			});
		});
						
		$("#chk_delbtn").on("click", function() {
			var del = new Array();
			$(document).find(".del_check").each(function (i, v) {
				if ($(this).parent().parent().css("display") != "none") {
					if ($(this).is(":checked")) {
						del.push($(this).parent().parent().find("td").eq(1).text());
					}
				}
			});
			console.log(del);
			$.each(del, function(i, v) {
				 $.ajax({
					 	data: {
					        'device_num' : v
				        },
				        url:'DeleteServiceCon',
				        success: function() {
							alert("기기가 삭제되었습니다.");							        	
				        },
				        error:function(a, b, c){
				        	console.log(a);
				        	console.log(b);
				        	console.log(c);
				            alert("에러가 발생하였습니다.");
				    	}
					});
			});
			$.ajax({
			 	data: {
			        'gg' : '<%=dto.getRent_id()%>',
			        'gg2' : $("#Sel").val()
		        },
		        url:'SelectServiceCon',
		        contentType : "application/json; charset:euc-kr",
				dataType: "JSON",
		        success: function(jsonList){
		        	console.log(jsonList);
		        	$.each(jsonList, function(i, v) {
		        		var rowNum = i*1+1;
						var val = "<tr class='drow'><td>" + rowNum + "</td>";
						val += "<td>" + v.device_num + "</td>";
						if(v.device_type == "B"){
							val += "<td>튜브형</td>";
						}else{
							val += "<td>핸디형</td>";
						}
						if (v.rent_state == "F") {
							val += "<td>대기</td>";
						} else {
							val += "<td>대여중</td>";
						}
						if (v.broken == "F") {
							val += "<td>정상</td>";
						} else {
							val += "<td>고장</td>";
						}
						val += "<td><a href='Device_State_Update?device_num=" + v.device_num + "'>렌탈</a></td>";
						val += "<td><a href='Device_broken_update?device_num=" + v.device_num + "'>고장</a></td>";											
						val += "<td><input type='checkbox' class='del_check' style='appearance: auto !important; opacity: 100 !important;'/></td></tr>";
						$("#kkk").append(val);
		        	});
	        		// console.log(data);
		        	/* <a href='DeleteServiceCon?device_num=" + v.device_num + "'>삭제</a> */
				},
					error:function(a, b, c){
					   	console.log(a);
					   	console.log(b);
					   	console.log(c);
					    alert("에러가 발생하였습니다.");
					}
				});
			 	location.reload();
			});
					
						
			$("#filter").on("change", function() {
				var ind = 1;
				var filterType = $("#filter").val();
				$("#kkk").find(".drow").each(function(i, v) {
					switch (filterType) {
						case "all":
							$(this).css("display", "table-row");
							break;
						case "available":
							if ($(this).find("td").eq(3).text() == "대기") {
								$(this).css("display", "table-row");
							} else {
								$(this).css("display", "none");
							}
							break;
						case "not-available":
							if ($(this).find("td").eq(3).text() == "대여중") {
								$(this).css("display", "table-row");
							} else {
								$(this).css("display", "none");
							}
							break;
						case "disable":
							if ($(this).find("td").eq(4).text() == "고장") {
								$(this).css("display", "table-row");
							} else {
								$(this).css("display", "none");
							}
							break;
					}
					var disp = $(this).css("display");
					if (disp != "none") {
						$(this).find("td").eq(0).text(ind++);
					}
				});
			});
				
						
			$("#Sel").on("change", function() {
				<%-- <%
				DeviceDTO dto2 = new DeviceDTO();
				String type ="";
				list = dao.select(dto.getRent_id(), dto.);
				%> --%>
				  $.ajax({
					 	data: {
					        'gg' : '<%=dto.getRent_id()%>',
					        'gg2' : $("#Sel").val()
				        },
				        url:'SelectServiceCon',
				        contentType : "application/json; charset:euc-kr",
						dataType: "JSON",
				        success: function(jsonList){
				        	console.log(jsonList);
				        	$.each(jsonList, function(i, v) {
				        		var rowNum = i*1+1;
								var val = "<tr class='drow'><td>" + rowNum + "</td>";
								val += "<td>" + v.device_num + "</td>";
								if(v.device_type == "B"){
									val += "<td>튜브형</td>";
								}else{
									val += "<td>핸디형</td>";
								}
								if (v.rent_state == "F") {
									val += "<td>대기</td>";
								} else {
									val += "<td>대여중</td>";
								}
								if (v.broken == "F") {
									val += "<td>정상</td>";
								} else {
									val += "<td>고장</td>";
								}
								val += "<td><a href='Device_State_Update?device_num=" + v.device_num + "'>렌탈</a></td>";
								val += "<td><a href='Device_broken_update?device_num=" + v.device_num + "'>고장</a></td>";											
								val += "<td><input type='checkbox' class='del_check' style='appearance: auto !important; opacity: 100 !important;'/></td></tr>";
								$("#kkk").append(val);
				        	});
				        	// console.log(data);
				        	/* <a href='DeleteServiceCon?device_num=" + v.device_num + "'>삭제</a> */
				        },
				        error:function(a, b, c){
				        	console.log(a);
				        	console.log(b);
				        	console.log(c);
				            alert("에러가 발생하였습니다.");
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
	 
			targetSel = $('#Sel').val();

		    $.ajax({
		        url:'InsertServiceCon',
		        type:'post',
	 	        data: {
		        	targetSel : targetSel
		        },
 		         
		        success:function(){
		            console.log("완료!");
		            location.reload();
		        },
		        error:function(){
		            alert("에러가 발생하였습니다.");
		    	}
			});
		
		
		}
  		
  		
   var lat_1 = 35.19444429414635;
   var lng_1 = 126.9530589614602;
   var container_1 = document.getElementById("map");
   var options_1 = {
      center: new kakao.maps.LatLng(lat_1, lng_1),
      level : 1,
      maxLevel : 1
   };
   var _kakaoMap = new kakao.maps.Map(container_1, options_1);
   
	kakao.maps.event.addListener(_kakaoMap, 'click', function (mouseEvent) {
		var latlng = mouseEvent.latLng;
		console.log(latlng);
	});
   //var mapTypeControl = new kakao.maps.MapTypeControl();
  // _kakaoMap.addControl(mapTypeControl, kakao.maps.ControlPosition.RIGHTTOP);
  
  
   var coords = [ { x: 35.19450, y: 126.95300, device: 82 },  
				  { x: 35.19448, y: 126.95298, device: 83 },  
				  { x: 35.19442, y: 126.95294, device: 84 }, 
				  { x: 35.19438, y: 126.95293, device: 85 },  
				  { x: 35.19436, y: 126.95297, device: 86 },  
				  { x: 35.19435, y: 126.95300, device: 87 },  
				  { x: 35.19433, y: 126.95303, device: 88 },  
				  { x: 35.19430, y: 126.95311, device: 89 } ];
   
   var tubes = new Object();
   var markerArray = new Array();
   
		var total = coords.length;
		var avail = 0;
		$.each(coords, function (i, v) {
			var overlay = "<div class='tubeLabel'><span>" + v.device + "</span></div>";
			$(".tubeLabel").css("margin-top", "8px");
		    var coordinate = new kakao.maps.LatLng(v.x, v.y);
			//_kakaoMap.setCenter(coord);
		    var marker = new kakao.maps.Marker({position: coordinate});
		    marker.device = coords.device;
			marker.setMap(_kakaoMap);
			var co = new kakao.maps.CustomOverlay({
				position: coordinate,
				content: overlay
			});
			co.setMap(_kakaoMap);
			markerArray.push(marker);
			
			$.ajax({
			 	data: {
			        device_id: v.device
		        },
		        url:'SelectDeviceState',
		        contentType : "application/json; charset:euc-kr",
				dataType: "JSON",
		        success: function(jsonList){
		        	if ($.trim(jsonList.state) == 'F') {
		        		avail ++;
		        	}
					$("#statediv").text(avail + "/" + total);
		        },
		        error:function(a, b, c){
		            alert("에러가 발생하였습니다.");
		    	}
			});
		});
		
  
  
//모달창-- 회원가입창
	//특정 버튼을 눌렀을 때 창 띄우기   
	const modal = document.getElementById("modal")
	const btnModal = document.getElementById("btn-modal")
	btnModal.addEventListener("click", e => {
	    modal.style.display = "flex"
	})
	
	//클로즈(x)버튼 누르면 모달창 꺼지게 하기
	const closeBtn = modal.querySelector(".close-area")
	closeBtn.addEventListener("click", e => {
	modal.style.display = "none"
	})
	
	//모달창이 켜진 상태에서 ESC버튼 누르면 모달창 꺼지게 하기
	window.addEventListener("keyup", e => {
	if(modal.style.display === "flex" && e.key === "Escape") {
	    modal.style.display = "none"
	}
	}) 
	
	
	//회원가입 창에서 주소검색, 지도 띄우기
			// 검색된 좌표
			 let result;
			
			// 검색된 주소값
			let addr_save;
			
			
			var mapContainer = document.getElementById('map_update'), // 지도를 표시할 div
			mapOption = {
			center : new daum.maps.LatLng(35.19450, 126.95300), // 지도의 중심좌표
			level : 1
			// 지도의 확대 레벨
			};
			
			//지도를 미리 생성
			var map = new daum.maps.Map(mapContainer, mapOption);
			//주소-좌표 변환 객체를 생성
			var geocoder = new daum.maps.services.Geocoder();
			//마커를 미리 생성
			var marker = new daum.maps.Marker({
			position : new daum.maps.LatLng(35.19450, 126.95300),
			map : map
			});
			
			function sample5_execDaumPostcode() {
			new daum.Postcode({
				oncomplete : function(data) {
					var addr = data.address; // 최종 주소 변수
					addr_save = addr;
					// 주소 정보를 해당 필드에 넣는다.
					document.getElementById("sample5_address").value = addr;
					// 주소로 상세 정보를 검색
					geocoder.addressSearch(data.address, function(results,
							status) {
						// 정상적으로 검색이 완료됐으면
						if (status === daum.maps.services.Status.OK) {
			
							result = results[0]; //첫번째 결과의 값을 활용
			
							// 해당 주소에 대한 좌표를 받아서
							var coords = new daum.maps.LatLng(result.y,
									result.x);
							// 지도를 보여준다.
							mapContainer.style.display = "block";
							map.relayout();
							// 지도 중심을 변경한다.
							map.setCenter(coords);
							// 마커를 결과값으로 받은 위치로 옮긴다.
							marker.setPosition(coords)
						}
					});
				}
			}).open();
		} 
			
		
			function button_update() {
				$.ajax({
					url : 'RentUpdateServiceCon',
					type : 'post',
					data : {
						'id' : '<%=dto.getRent_id()%>',
						'pw' : $('#pw').val(),
						'rent_name' : $('#rent_name').val(),
						'rent_num' : $('#rent_num').val(),
						'locations' : $('#sample5_address').val(),
						'targetSel' : $('#targetSel').val()
					},

					success : function() {
						console.log("완료!");
						alert("수정이 완료되었습니다.");
						let url = 'rent_main.jsp';
						location.replace(url);
					},
					error : function() {
						alert("수정에 실패하였습니다.");
					}
				});
			}
			
			
			$("#search").on('click', function() {
				$.ajax({
					data : {
						'x' : result.x,
						'y' : result.y
					},
					contentType : "application/json; charset : euc-kr",
					dataType : "JSON",
					url : 'SearchCt',
					success : function(jsonList) {
						console.log(jsonList);

						$('#targetSel').children("option").remove();
						for ( var key in jsonList) {
							for ( var val in jsonList[key]) {
								var option = "<option value='" + val + "'>"	+ jsonList[key][val] + "</option>";
								console.log(option);
								$('#targetSel').append(option);
							}
						}
					},
					error : function() {
						alert("에러가 발생하였습니다.");
					}
				});
			});
			
			// Search all columns
			$('#search_device')
					.keyup(
							function() {
								// Search Text
								var search = $(this).val();

								// Hide all table tbody rows
								$('#kkk tbody tr').hide();

								// Count total search result
								var len = $('#kkk tbody tr:not(.notfound) td:contains("'
										+ search + '")').length;

								if (len > 0) {
									// Searching text in columns and show match row
									$(
											'#kkk tbody tr:not(.notfound) td:contains("'
													+ search + '")').each(
											function() {
												$(this).closest('tr').show();
											});
								}
							});

			function send_message(){
				var send_id = '<%=dto.getRent_id() %>';
				console.log(send_id);
				console.log($('#title').val());
				console.log($('#message').val());
				$.ajax({
					url:'MessageServiceCon',
					type:'post',
					data:{
						email : send_id,
						title : $('#title').val(),
						message : $('#message').val()
					},
					success:function(data){
						alert("메시지가 전송되었습니다.");
					},
					error:function(){
						alert("메시지 전송에 실패하였습니다.");
					}
				});
			}
  
</script>
</body>
</html>