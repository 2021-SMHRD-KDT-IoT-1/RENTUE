<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>

<!DOCTYPE html>
<html>
<style>

/* wave 효과 */
.wave {
	width: 1000px;
	height: 1000px;
	background-image: url('images/main1.png');
	background-size: 100%;
	position: relative;
}

li {
	list-style: none;
}

#logo {
	margin-left: 1.7em;
	width: 290px;
	heigh: 300px;
}
</style>
<head>
<meta charset="EUC-KR">


<title>RenTue 메인페이지 입니다!!</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="assets/css/main.css" />
<noscript>
	<link rel="stylesheet" href="assets/css/noscript.css" />
</noscript>
<!-- 로그인 창 띄우기 위한 jquery 불러오기 -->
<script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/jquery/1.9.0/jquery.js"></script>

<!-- 로그인 버튼 누르면 ID/PW창 뜨고 닫히는 코드 -->
<script type="text/javascript">
		$(function(){
			$("#showbtn").click(function(){
				$("#displaydiv").slideDown(); });
		});
		
		$(function(){
		$("#hidebtn").click(function(){
			$("#displaydiv").slideUp(); });
		});
		</script>

</head>

<body class="is-preload">





	<!-- Sidebar -->
	<section id="sidebar">
		<div style="float: left;">
			<p style="text-align: left;">
				<img src="images/logo2.png" id="logo">
			</p>
			<div>
				<div class="inner">

					<div style="align: right; margin-bottom: 2em;">
						<li id="displayselect"><input type="button" id="showbtn" value="로그인" class="button small"></li>
						<!-- <ul class="actions small"> -->
						<!-- <li><a href="#" class="button small">홈으로</a></li> -->
						<!-- <li><a href="#" class="button primary small">로그인</a></li> -->
						<!-- </ul> -->
					</div>



					<!-- 숨겨져 있는 로그인 영역부분 -->
					<div style="display: none;" id="displaydiv">

						<span>
							<input type="radio" name="member2" value="Rent_member" checked>렌탈업체 <input type="radio" name="member2" value="Ct_member">관제소
						</span>
						<span>
							ID<input type="text" name="id2" id="id2">
						</span>
						<span>
							PW<input type="password" name="pw2" id="pw2">
						</span>

						<div id="container">
							<button id="btn-modal" class="button primary small">회원가입</button>
							<input type="button" id="hidebtn" value="확인" class="button small" onclick="button_login()">

						</div>

					</div>



					<nav>
						<ul>
							<li><a href="#intro">Welcome</a></li>
							<li><a href="#one">What's RenTue?</a></li>
							<li><a href="#two">Contact RenTue</a></li>

						</ul>
					</nav>
				</div>
	</section>






	<!-- Wrapper -->
	<div id="wrapper">


		<!-- Intro -->
		<!-- <section id="intro" class="wrapper style1 fullscreen fade-up"> -->
		<section id="intro" class="wrapper style1 fullscreen fade-up" style="background-image: url('images/main1.png')">


			<div class="inner wave" width="100%" ; height="100%";></div>

			<!-- 회원가입창 모달창으로 뜸 -->
			<div id="modal" class="modal-overlay" style="position: absolute;">
				<div class="modal-window">
					<div class="title">
						<div align="center" style="float: left; margin-right: 12.5em; margin-left: 2em; margin-top: 1em;">Let's Rentue-Member!</div>
						<div class="close-area" style="float: right;">X</div>
					</div>
					<div class="content">
						<p>
						<div>
							<li><input type="radio" name="member" value="Rent_member" checked>렌탈업체 <input type="radio" name="member" value="Ct_member">관제소</li>
							<li><input type="text" placeholder="ID를 입력하세요" id="id"></li>
							<li><span></span></li>

							<!--이미 있는 아이디 입니다 or 멋진 아이디네요!-->

							<li><input type="password" placeholder="PW를 입력하세요" id="pw"></li>
							<!-- 관제소 선택시에는 업체명과 사업자번호가 비활성화 되어야 한다 -->

							<li><input type="text" placeholder="업체명를 입력하세요" id="rent_name"></li>
							<li id="r_num"><input type="text" placeholder="사업자번호를 입력하세요" id="rent_num"></li>
							<li><input type="text" id="sample5_address" placeholder="주소를 검색하세요"> <input type="button" onclick="sample5_execDaumPostcode()" value="주소 검색"></li>
							<li id="select"><select id="targetSel">
									<option>소속 관제소 설정</option>
							</select>
								<button id="search">가까운 관제소 찾기</button></li>
							<li><button id="submit" type="button" onclick="button_join()">JOIN US</button></li>
							<div id="map" style="width: 170px; height: 170px; margin-top: -100px; float: right; display: none"></div>
						</div>

						</p>
		</section>

		<!-- 	<section id="one" class="wrapper style2 fullscreen spotlights">
			<section style="padding: 2em !important;">
				<a href="#" class="image"><img src="images/pic01.jpg" alt="" data-position="center center" /></a>
				<div class="content">
					<div class="inner">
						<h2>제품소개</h2>
						<p>제품설명란</p>
						<ul class="actions">
							<li><a href="modal" class="button scrolly">Join Us</a></li>
						</ul>
					</div>
				</div>
			</section>
		</section> -->

		<!-- One -->
		<section id="one" class="wrapper style2 fullscreen spotlights" style="background-image: url('images/device1.png')">

			
			<!-- 조인버튼 위치 수정해야함!  -->
			<ul class="actions">
				<li><a href="#modal" class="button scrolly">Join Us</a></li>
			</ul>

		</section>

		<!-- Two -->
		<section id="two" class="wrapper style1 fullscreen fade-up">
			<div class="inner">
				<section style="padding: 2em !important;">
					<h2>Get in touch</h2>
					<p>문의 사항</p>
					<div class="split style1">
						<section>
							<form method="post" action="#">
								<div class="fields">
									<div class="field half">
										<label for="email">Email</label> <input type="text" name="email" id="email" />
									</div>
									<div class="field half">
										<label for="title">Title</label> <input type="text" name="title" id="title" />
									</div>
									<div class="field">
										<label for="message">Message</label>
										<textarea name="message" id="message" rows="5"></textarea>
									</div>
								</div>
								<ul class="actions">
									<li><a href="javascript:void(0);" onclick="send_message();" class="button submit">Send Message</a></li>						
								</ul>
							</form>
						</section>
						<section>
							<ul class="contact">
								<li>
									<h3>Address</h3> <span>
										31-15 광주아트센터 3층 B<br /> 광주광역시, 동구 예술길<br /> 대한민국
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
				<li>Design: <a href="http://html5up.net">TEAM iWillLetYouLive</a></li>
			</ul>
		</div>
	</footer>

	<!-- Scripts -->

	<script src="assets/js/jquery.min.js"></script>
	<script type="text/javascript" src="assets/js/jquery.ripples.js"></script>
	<script src="http://www.jqueryscript.net/demo/jQuery-Plugin-For-Water-Ripple-Animation-ripples/js/jquery.ripples.js">
</script>



	<script src="assets/js/jquery.scrollex.min.js"></script>
	<script src="assets/js/jquery.scrolly.min.js"></script>
	<script src="assets/js/browser.min.js"></script>
	<script src="assets/js/breakpoints.min.js"></script>
	<script src="assets/js/util.js"></script>
	<script src="assets/js/main.js"></script>



	<!-- 주소 선택시 지도 뜨는 코드 -->
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<!-- <script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=본인앱키주소입력하기!!!!!&libraries=services"></script> -->
	<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7bf4d86dadf87fc45ddad1e9b45a01dd&libraries=services"></script>

	<script type="text/javascript">
			
$(document).ready(function() {
	try {
		$('.wave').ripples({
			resolution: 256,
			perturbance: 0.04
		});
	}
	catch (e) {
		$('.error').show().text(e);
	}
});
		</script>


	<script>
			
			//회원가입 창에서 주소검색, 지도 띄우기
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
			
			
			//회원가입 버튼
			function button_join(){
			 
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
		
		//관제소버튼 눌렀을때 사업자번호 비활성화			
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

	
			
	
	
			//로그인 ajax 코드
			function button_login(){
				 member = $("input:radio[name='member2']:checked").val(),
				 id = $('#id2').val();
				 pw = $('#pw2').val();
				 
		
				 
			    $.ajax({
			        url:'LoginServiceCon',
			        type:'post',
		 	        data: {
			        	member : member,
			        	id : id, pw : pw,
		 	        },
		 	        
		 	       success:function(data){	 	    	
		 	    		console.log("완료!");
		 	   			let url = null;
		 	   			if(data == 'loginFail'){
		 	   				alert('로그인에 실패하였습니다.')
		 	   				url = 'intro.jsp';
		 	   			}else{
		 	   				if(id=='admin'){
	 	   						url = 'admin_main.jsp';
	 	   					}else if(member=='Rent_member'){
		 	   					url = 'rent_main.jsp';
		 	   				}else if(member=='Ct_member'){
		 	   					url = 'ct_main.jsp';
		 	   				}
		 	   			}
		            	location.replace(url);
			        },
			        error:function(){
			           alert("에러 발생~~ \n");
			           location.reload(true);
			    	}
			    });	
				 }
				 
				 	function send_message(){
				$.ajax({
					url:'MessageServiceCon',
					data:{
						email : $('#email').val(),
						title : $('#title').val(),
						message : $('#message').val()
					},
					success:function(){
						console.log(email);
						alert("메시지가 전송되었습니다.");
						location.reload();
					},
					error:function(){
						alert("메시지 전송에 실패하였습니다.");
						location.reload();
					}
				});
			}
			
						
			

	  </script>
</body>
</html>

