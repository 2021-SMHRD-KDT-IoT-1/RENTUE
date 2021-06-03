<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<style>
li{
	list-style: none;
}


</style>
</head>
<body>

	<h5>회원가입 페이지입니다.</h5>
	<ul>
		<li><input type="radio" name="member" value="Rent_member" checked>렌탈업체
			<input type="radio" name="member" value="Ct_member">관제소</li>
		<li><input type="text" placeholder="ID를 입력하세요" id="id"></li>
		<li><span></span></li>
		<!--이미 있는 아이디 입니다 or 멋진 아이디네요!-->
		<li><input type="password" placeholder="PW를 입력하세요" id="pw"></li>
		<!-- 관제소 선택시에는 업체명과 사업자번호가 비활성화 되어야 한다 -->
		<li><input type="text" placeholder="업체명를 입력하세요" id="rent_name"></li>
		<li id="r_num"><input type="text" placeholder="사업자번호를 입력하세요" id="rent_num"></li>
		<li><input type="text" id="sample5_address" placeholder="주소를 검색하세요" >
			<input type="button" onclick="sample5_execDaumPostcode()" value="주소 검색"></li>
		<li id="select"><select id="targetSel">

		</select>
			<button id="search">가까운 관제소 찾기</button></li>
		<li><button id="submit" type="button" onclick="button_ps()">JOIN US</button></li>
	</ul>
	<div id="map"
		style="width: 300px; height: 300px; margin-top: 10px; display: none"></div>



	<!-- 주소 선택시 지도 뜨는 코드 -->
	<script
		src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<!-- <script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=본인앱키주소입력하기!!!!!&libraries=services"></script> -->
	<script
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=92da30628c14e3e7954ea453ba17c38a&libraries=services"></script>
	<script>
		
		// 검색된 좌표
		let result;
		
		// 검색된 주소값
		let addr_save;
	
	
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div
		mapOption = {
			center : new daum.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
			level : 5
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
		
		
		
		function button_ps(){
			 
	 		 member = $("input:radio[name='member']:checked").val(),
			 id = $('#id').val();
			 pw = $('#pw').val();
			 rent_name = $('#rent_name').val();
			 rent_num = $('#rent_num').val();
			 locations = $('#sample5_address').val();
			 targetSel = $('#targetSel').val();
			

		    $.ajax({
		        url:'JoinServiceCon',
		        type:'post',
	 	        data: {
		        	member : member,
		        	id : id, pw : pw,
		        	rent_name : rent_name,
		        	rent_num : rent_num,
		        	locations : locations,
		        	targetSel : targetSel,
		        	x : result.x, 
		        	y : result.y
		        	},
 		         
		        success:function(){
		            console.log("완료!");
		            let url = 'intro.jsp';
		            location.replace(url);
		        },
		        error:function(){
		            alert("에러 발생~~ \n");
		    	}
			});
		}
		
	</script>

	<script src="assets/js/jquery.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			$("input[name='member']:radio").change(function() {
				var type = this.value;

				if (type == "Ct_member") {
					$("input[name='r_num']").prop("disabled", true);
					$("input[name='r_num']").val("");
					$("#r_num").hide();
					$("#select").hide();
				} else {
					$("input[name='r_num']").prop("disabled", false);
					$("#r_num").show();
					$("#select").show();
				}
			});
		});
		
		
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
					for (var key in jsonList) {
						for (var val in jsonList[key]){
							var option = "<option value='" + val + "'>" + jsonList[key][val] + "</option>";
							console.log(option);
							$('#targetSel').append(option);
						}
					} 
 				},
				 error:function(){
			            alert("에러 발생~~ \n");
			   	}
			});
		});
		
		/* $("#submit").on('click', function() {
			var form1 = $('#form').serialize();
			console.log(form1);
			$.ajax({
				type : "post"
				data : {
					form1,
					'x' : result.x,
					'y' : result.y
				},
				url : 'JoinServiceCon',
				dataType : 'json',
				success : function(data) {
					console.log(data);
				},
				error: function (request, status, error) {
	                console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);

	            }
			});
		}); */
	</script>
</body>
</html>