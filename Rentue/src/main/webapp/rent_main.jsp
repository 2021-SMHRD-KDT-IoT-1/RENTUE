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
<title>��Ż��ü ȸ�� �������Դϴ�.</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="assets/css/rent_main.css" />
<noscript>
	<link rel="stylesheet" href="assets/css/noscript.css" />
</noscript>
<script type='text/javascript' src='//dapi.kakao.com/v2/maps/sdk.js?appkey=7bf4d86dadf87fc45ddad1e9b45a01dd'></script>
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
		script.println("alert('�α����� �ϼ���.')");
		script.println("location.href='intro.jsp'");
		script.println("</script>");
	}
	DeviceDAO dao = new DeviceDAO();
	ArrayList<DeviceDTO> list = dao.select(dto.getRent_id(), null);
	/* String admin = dto.getAdmin(); */
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
							<input type="button" value="�α׾ƿ�" onclick="location.href='LogoutServiceCon'" class="button primary small">

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
				<h1>Rentue_��Ʈ��ü</h1>
				<p>��Ʃ �ǽð� ��ġȮ���ϱ�</p>
				<div id="map" style="width: 1000px; height: 600px; background-color: black; margin-left: 20px;"></div>
				<div style="float: right;">���⿡ �������Ʃ��� �����Ʃ�� ���� ǥ���ؾ���</div>
			</div>


			<!-- ȸ������ ���� ���â -->
			<div id="modal" class="modal-overlay" style="position: absolute;">
				<div class="modal-window">
						<div class="close-area" style="float: right;">X</div>
					<div class="title">
						<img src = "images/logo_small.png" id="logo_small">
						<div style="float: left; margin-right: 12.5em; margin-left: 2em; margin-top: 0.5em;">
						
						<h3>ȸ������ ����</h3>
						
						</div>
					</div>
					<div class="content">
						<p>
						<div>
							<li>ID&nbsp;&nbsp;&nbsp;<%=dto.getRent_id()%></li>
							<li>PW<input style="height: 2em; width: 12em;" class="field half" type="password" placeholder="������ PW�� �Է��ϼ���" id="pw"></li>
							<li style="float: left; margin-right: 0.75em;">��ü��<input type="text" id="rent_name" value="<%=dto.getRent_name()%>" style="height: 2em; width: 12em;"></li>
							<li id="r_num">����ڹ�ȣ<input type="text" id="rent_num" value="<%=dto.getRent_num()%>" style = "height: 2em; width: 12em;"></li>
							<li>�ּ�<input type="text" id="sample5_address" value="<%=dto.getRent_addr()%>" style="height: 2.25em;">
							<input type="button" onclick="sample5_execDaumPostcode()" value="�ּ� �˻�" style="height: 3.75em; line-height: 2.75em; margin-top: 0.75em;"></li>
							<li id="select">
							<select id="targetSel" style="height: 2.25em;">
									<option value="<%=dto.getCt_id()%>"><%=ct_name%></option>
						
							</select>
								<button id="search" style="height: 3.75em; line-height: 2.75em; margin-top: 0.75em;">����� ������ ã��</button></li>
							<li><button id="submit" type="button" onclick="button_update()"style="height: 3.75em; line-height: 2.75em; margin-top: 9em;">UPDATE</button></li>


							<div id="map" style="width: 170px; height: 170px; margin-top: -100px; float: right; display: none"></div>
						</div>
						</div>
						</p>
						
		</section>





		<!-- One -->
		<section id="one" class="wrapper style2 fullscreen spotlights" style="padding: 2em !important;">


			<p>
			<div class="content">
				<div class="inner">
					<h2>Rentue ������</h2>
				</div>
			</div>
			</p>
			<label>
				<div>
				
					<select id="filter" style="width: 250px; float: left; margin-right: 20px; display: inline;">
						<option value="all">��ü ���</option>
						<option value="available">�뿩������ ���</option>
						<option value="not-available">�뿩���� ���</option>
						<option value="disable">���� ���</option>
					</select>

					
					<select id="targetSel" style="width: 200px; display: inline;">
						<option value="A" name="Rent_id">�ڵ���</option>
						<option value="B" name="Rent_id">Ʃ����</option>
					</select>
					
					<button id="submit" type="button" onclick="button_ps()" style="margin: 0px;">�߰����</button>
					<input type="button" id="chk_delbtn" value="üũ�׸� ����" />


				</div>
			</label>


			<div>
				<div>
					<%-- <% if (admin.equals("Y")) { %> --%>
					<input type="text" style="width: 200px; float: left; margin-left: 20px;" /> <input type="button" id="search_btn" style="width: 200px; margin-left: 20px; float: left;" value="���̵� �˻�" /><br>
					<%-- <% } %> --%>
					<br>
				</div>

				<table id="kkk">
					<!-- ù��° �� -->
					<tr>
						<td>No.</td>
						<td>����ȣ</td>
						<td>Ÿ��</td>
						<td>��Ż��Ȳ</td>
						<td>���忩��</td>
						<td>��Ż</td>
						<td>����</td>
						<td><input type='checkbox' id="del_check_all" style='margin-right: 0 !important; appearance: auto !important; opacity: 100 !important;' />����</td>

					</tr>
					<!-- �ι�° ����ʹ� ���� ���� �� -->

					<%
					for (int i = 0; i < list.size(); i++) {
						int rowNum = i + 1;
					%>
					<tr class='drow'>
						<td><%=rowNum%></td>
						<td><%=list.get(i).getDevice_num()%></td>
						<td><%=list.get(i).getDevice_type()%></td>
						<td><%=list.get(i).getRent_state()%></td>
						<td><%=list.get(i).getBroken()%></td>
						<td><a href="Device_State_Update?device_num=<%=list.get(i).getDevice_num()%>">��Ż</a></td>
						<td><a href="Device_broken_update?device_num=<%=list.get(i).getDevice_num()%>">����</a></td>
						<td><input type='checkbox' class='del_check' style='appearance: auto !important; opacity: 100 !important;' /></td>
					</tr>
					<%
					}
					%>
				</table>
			</div>
		</section>





		<!-- Two -->
		<section id="two" class="wrapper style1 fullscreen fade-up">
			<div class="inner">
				<section style="padding: 2em !important;">
					<h2>Get in touch</h2>
					<p>���� ����</p>
					<div class="split style1">
						<section>
							<form method="post" action="#">
								<div class="fields">
									<div class="field">
										<label for="name">�α����� ���̵� ����ϼ���</label> <input type="text" name="title" id="title" placeholder="�� ������ �Է����ּ���" />
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
									<h3>Address</h3> <span>
										31-15 ���־�Ʈ���� 3�� B<br /> ���ֱ�����, ���� ������<br /> ���ѹα�
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
	
	<!-- �ּ� ���ý� ���� �ߴ� �ڵ� -->
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<!-- <script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=���ξ�Ű�ּ��Է��ϱ�!!!!!&libraries=services"></script> -->
	<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7bf4d86dadf87fc45ddad1e9b45a01dd&libraries=services"></script>
	
	
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
											alert("���� ����~~ \n");							        	
								        },
								        error:function(a, b, c){
								        	console.log(a);
								        	console.log(b);
								        	console.log(c);
								            alert("���� �߻�~~ \n");
								    	}
									});
							});
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
							        		var rowNum = i*1+1;
											var val = "<tr class='drow'><td>" + rowNum + "</td>";
											val += "<td>" + v.device_num + "</td>";
											val += "<td>" + v.device_type+"</td>";
											val += "<td>" + v.rent_state+"</td>";
											val += "<td>" + v.broken+"</td>";
											val += "<td><a href='Device_State_Update?device_num=" + v.device_num + "'>��Ż</a></td>";
											val += "<td><a href='Device_broken_update?device_num=" + v.device_num + "'>����</a></td>";											
											val += "<td><input type='checkbox' class='del_check' style='appearance: auto !important; opacity: 100 !important;'/></td></tr>";
											$("#kkk").append(val);
							        	});
							        	// console.log(data);
							        	/* <a href='DeleteServiceCon?device_num=" + v.device_num + "'>����</a> */
							        },
							        error:function(a, b, c){
							        	console.log(a);
							        	console.log(b);
							        	console.log(c);
							            alert("���� �߻�~~ \n");
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
										if ($(this).find("td").eq(3).text() == 'F') {
											$(this).css("display", "table-row");
										} else {
											$(this).css("display", "none");
										}
										break;
									case "not-available":
										if ($(this).find("td").eq(3).text() == 'T') {
											$(this).css("display", "table-row");
										} else {
											$(this).css("display", "none");
										}
										break;
									case "disable":
										if ($(this).find("td").eq(4).text() == 'T') {
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
							        		var rowNum = i*1+1;
											var val = "<tr class='drow'><td>" + rowNum + "</td>";
											val += "<td>" + v.device_num + "</td>";
											val += "<td>" + v.device_type+"</td>";
											val += "<td>" + v.rent_state+"</td>";
											val += "<td>" + v.broken+"</td>";
											val += "<td><a href='Device_State_Update?device_num=" + v.device_num + "'>��Ż</a></td>";
											val += "<td><a href='Device_broken_update?device_num=" + v.device_num + "'>����</a></td>";											
											val += "<td><input type='checkbox' class='del_check' style='appearance: auto !important; opacity: 100 !important;'/></td></tr>";
											$("#kkk").append(val);
							        	});
							        	// console.log(data);
							        	/* <a href='DeleteServiceCon?device_num=" + v.device_num + "'>����</a> */
							        },
							        error:function(a, b, c){
							        	console.log(a);
							        	console.log(b);
							        	console.log(c);
							            alert("���� �߻�~~ \n");
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
		            console.log("�Ϸ�!");
		            location.reload();
		        },
		        error:function(){
		            alert("���� �߻�~~ \n");
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
      level : 1
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
  
  
//���â-- ȸ������â
	//Ư�� ��ư�� ������ �� â ����   
	const modal = document.getElementById("modal")
	const btnModal = document.getElementById("btn-modal")
	btnModal.addEventListener("click", e => {
	    modal.style.display = "flex"
	})
	
	//Ŭ����(x)��ư ������ ���â ������ �ϱ�
	const closeBtn = modal.querySelector(".close-area")
	closeBtn.addEventListener("click", e => {
	modal.style.display = "none"
	})
	
	//���â�� ���� ���¿��� ESC��ư ������ ���â ������ �ϱ�
	window.addEventListener("keyup", e => {
	if(modal.style.display === "flex" && e.key === "Escape") {
	    modal.style.display = "none"
	}
	}) 
	
	
	//ȸ������ â���� �ּҰ˻�, ���� ����
			// �˻��� ��ǥ
			let result;
			
			// �˻��� �ּҰ�
			let addr_save;
			
			
			var mapContainer = document.getElementById('map'), // ������ ǥ���� div
			mapOption = {
			center : new daum.maps.LatLng(37.537187, 127.005476), // ������ �߽���ǥ
			level : 5
			// ������ Ȯ�� ����
			};
			
			//������ �̸� ����
			var map = new daum.maps.Map(mapContainer, mapOption);
			//�ּ�-��ǥ ��ȯ ��ü�� ����
			var geocoder = new daum.maps.services.Geocoder();
			//��Ŀ�� �̸� ����
			var marker = new daum.maps.Marker({
			position : new daum.maps.LatLng(37.537187, 127.005476),
			map : map
			});
			
			function sample5_execDaumPostcode() {
			new daum.Postcode({
				oncomplete : function(data) {
					var addr = data.address; // ���� �ּ� ����
					addr_save = addr;
					// �ּ� ������ �ش� �ʵ忡 �ִ´�.
					document.getElementById("sample5_address").value = addr;
					// �ּҷ� �� ������ �˻�
					geocoder.addressSearch(data.address, function(results,
							status) {
						// ���������� �˻��� �Ϸ������
						if (status === daum.maps.services.Status.OK) {
			
							result = results[0]; //ù��° ����� ���� Ȱ��
			
							// �ش� �ּҿ� ���� ��ǥ�� �޾Ƽ�
							var coords = new daum.maps.LatLng(result.y,
									result.x);
							// ������ �����ش�.
							mapContainer.style.display = "block";
							map.relayout();
							// ���� �߽��� �����Ѵ�.
							map.setCenter(coords);
							// ��Ŀ�� ��������� ���� ��ġ�� �ű��.
							marker.setPosition(coords)
						}
					});
				}
			}).open();
			}
  
</script>
</body>
</html>