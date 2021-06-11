<%@page import="com.model.CtDAO"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="com.model.RentDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>회원 마이페이지 입니다.</title>
</head>
<body>
	<%
	RentDTO dto = null;
	String ct_name = null;
	request.setCharacterEncoding("EUC-KR");
	if(session.getAttribute("dto") != null){
		dto = (RentDTO) session.getAttribute("dto");
		String ct_id = dto.getCt_id();
		CtDAO ct_dao = new CtDAO();
		ct_name = ct_dao.setCt(ct_id);
		System.out.println(ct_name);
	}else {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인을 하세요.')");
		script.println("location.href='intro.jsp'");
		script.println("</script>");
	}
	%>
	<h5>회원정보 수정</h5>
	<ul>
		<li><%=dto.getRent_id()%></li>
		<li><input type="password" placeholder="PW를 입력하세요" id="pw"></li>
		<li><input type="text" placeholder="업체명를 입력하세요" id="rent_name" value="<%=dto.getRent_name() %>"></li>
		<li id="r_num"><input type="text" placeholder="사업자번호를 입력하세요" id="rent_num" value="<%=dto.getRent_num() %>"></li>
		<li><input type="text" id="sample5_address" placeholder="주소를 검색하세요" value="<%=dto.getRent_addr() %>"> <input type="button" onclick="sample5_execDaumPostcode()" value="주소 검색"></li>
		<li id="select"><select id="targetSel">
				<option value="<%=dto.getCt_id() %>"><%=ct_name %></option>
		</select>
			<button id="search">가까운 관제소 찾기</button></li>
		<li><button id="submit" type="button" onclick="button_update()">UPDATE</button></li>

	</ul>
	<div id="map" style="width: 300px; height: 300px; margin-top: 10px; display: none"></div>



	<script src="assets/js/jquery.min.js"></script>
	<!-- 주소 선택시 지도 뜨는 코드 -->
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<!-- <script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=본인앱키주소입력하기!!!!!&libraries=services"></script> -->
	<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c396fe0efc7b0e5f37418f17f1fd034d&libraries=services"></script>

	<script type="text/javascript">
		// 검색된 좌표
		let result;

		// 검색된 주소값
		let addr_save;

		var mapContainer = document.getElementById('map'), // 지도를 표시할 div
		mapOption = {
			center : new daum.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
			level : 2
		// 지도의 확대 레벨
		};

		//지도를 미리 생성
		var map = new daum.maps.Map(mapContainer, mapOption);
		//주소-좌표 변환 객체를 생성
		var geocoder = new daum.maps.services.Geocoder();
		//마커를 미리 생성
		var marker = new daum.maps.Marker({
			position : new daum.maps.LatLng(37.537187, 127.005476),
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
					alert("수정이 완료되었습니다");
					let url = 'rent_main.jsp';
					location.replace(url);
				},
				error : function() {
					alert("수정 실패");
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
							alert("에러 발생~~ \n");
						}
					});
				});
	</script>
</body>
</html>