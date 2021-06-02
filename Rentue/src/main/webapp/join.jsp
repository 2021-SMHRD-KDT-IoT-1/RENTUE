<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>

</head>
<body>
	<h5>회원가입 페이지입니다.</h5>
	<form action="JoinServiceCon" method="post">
		<li><input type="radio" name="member" value="Rent_member" checked>렌탈업체
			<input type="radio" name="member" value="Ct_member">관제소</li>
		<li><input type="text" placeholder="ID를 입력하세요" name="id"></li>
		<span></span>
		<!--이미 있는 아이디 입니다 or 멋진 아이디네요!-->
		<br>
		<li><input type="password" placeholder="PW를 입력하세요" name="pw"></li>
		<!-- 관제소 선택시에는 업체명과 사업자번호가 비활성화 되어야 한다 -->
		<li id="rent_name"><input type="text" placeholder="업체명를 입력하세요" name="rent_name"></li>
		<li id="rent_num"><input type="text" placeholder="사업자번호를 입력하세요" name="rent_num"></li>
			<input type="text" id="sample5_address"placeholder="주소">
			<input type="button" onclick="sample5_execDaumPostcode()" value="주소 검색"><br>
		<div id="map" style="width: 300px; height: 300px; margin-top: 10px; display: none"></div>
		<li><input type="submit" value="JOIN US"></li>
	</form>



<!-- 주소 선택시 지도 뜨는 코드 -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<!-- <script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=본인앱키주소입력하기!!!!!&libraries=services"></script> -->
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7bf4d86dadf87fc45ddad1e9b45a01dd&libraries=services"></script>
<script>
    var mapContainer = document.getElementById('map'), // 지도를 표시할 div
        mapOption = {
            center: new daum.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
            level: 5 // 지도의 확대 레벨
        };

    //지도를 미리 생성
    var map = new daum.maps.Map(mapContainer, mapOption);
    //주소-좌표 변환 객체를 생성
    var geocoder = new daum.maps.services.Geocoder();
    //마커를 미리 생성
    var marker = new daum.maps.Marker({
        position: new daum.maps.LatLng(37.537187, 127.005476),
        map: map
    });


    function sample5_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                var addr = data.address; // 최종 주소 변수

                // 주소 정보를 해당 필드에 넣는다.
                document.getElementById("sample5_address").value = addr;
                // 주소로 상세 정보를 검색
                geocoder.addressSearch(data.address, function(results, status) {
                    // 정상적으로 검색이 완료됐으면
                    if (status === daum.maps.services.Status.OK) {

                        var result = results[0]; //첫번째 결과의 값을 활용

                        // 해당 주소에 대한 좌표를 받아서
                        var coords = new daum.maps.LatLng(result.y, result.x);
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
</script>

	<!-- 조인버튼 클릭 시 로그인 화면으로 가야함-->
	<script src="assets/js/jquery.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			$("input[name='member']:radio").change(function() {
				var type = this.value;

				if (type == "Ct_member") {
					$("input[name='rent_name']").prop("disabled", true);
					$("input[name='rent_num']").prop("disabled", true);
					$("input[name='rent_name']").val("");
					$("input[name='rent_num']").val("");
					$("#rent_name").hide();
					$("#rent_num").hide();
				} else {
					$("input[name='rent_name']").prop("disabled", false);
					$("input[name='rent_num']").prop("disabled", false);
					$("#rent_name").show();
					$("#rent_num").show();
				}
			});
		});
	</script>
</body>
</html>