<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<style>
li {
	list-style: none;
}

#modal.modal-overlay {
	/*display: none;*/
	width: 100%;
	height: 100%;
	position: absolute;
	left: 0;
	top: 0;
	display: none;
	flex-direction: column;
	align-items: center;
	justify-content: center;
	background: rgba(255, 255, 255, 0.25);
	box-shadow: 0 8px 32px 0 rgba(31, 38, 135, 0.37);
	backdrop-filter: blur(1.5px);
	-webkit-backdrop-filter: blur(1.5px);
	border-radius: 10px;
	border: 1px solid rgba(255, 255, 255, 0.18);
}

#modal .modal-window {
	background: rgba(69, 139, 197, 0.70);
	box-shadow: 0 8px 32px 0 rgba(31, 38, 135, 0.37);
	backdrop-filter: blur(13.5px);
	-webkit-backdrop-filter: blur(13.5px);
	border-radius: 10px;
	border: 1px solid rgba(255, 255, 255, 0.18);
	width: 400px;
	height: 500px;
	position: relative;
	top: -100px;
	padding: 10px;
}

#modal .title {
	padding-left: 10px;
	display: inline;
	text-shadow: 1px 1px 2px gray;
	color: white;
}

#modal .title h2 {
	display: inline;
}

#modal .close-area {
	display: inline;
	float: right;
	padding-right: 10px;
	cursor: pointer;
	text-shadow: 1px 1px 2px gray;
	color: white;
}

#modal .content {
	margin-top: 20px;
	padding: 0px 10px;
	text-shadow: 1px 1px 2px gray;
	color: white;
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
<style>
#btn-modal {
	margin: 2em;
}
</style>
<body class="is-preload">



	<!-- Sidebar -->
	<section id="sidebar">
		<div class="inner">
			<ul class="actions small">
				<li><a href="#" class="button small">홈으로</a></li>
				<!-- <li><a href="#" class="button primary small">로그인</a></li> -->
				<!-- a태그로 바꿔야하면 바꿔도 될것 같음.. 아직 잘 모르겠음 -->
				<li id="displayselect"><input type="button" id="showbtn" value="로그인" class="button primary small"></li>

			</ul>

			<!-- 숨겨져 있는 로그인 영역부분 -->
			<div style="display: none;" id="displaydiv">

				<span>
					<input type="radio" name="member" value="Rent_member" checked>렌탈업체 <input type="radio" name="member" value="Ct_member">관제소
				</span>
				<span>
					ID<input type="text" name="id" id="id">
				</span>
				<span>
					PW<input type="password" name="pw" id="pw">
				</span>

				<div id="container">
					<button id="btn-modal" class="button primary small">회원가입</button>
					<input type="button" id="hidebtn" value="확인" class="button small" onclick="button_ps()">
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

		<!-- <section>
					<div id = "join">
						<p>회원가입 창</p>
					</div>
				</section> -->

		<!-- Intro -->
		<!-- <section id="intro" class="wrapper style1 fullscreen fade-up"> -->
		<section id ="intro" class="wrapper style1 fullscreen fade-up">

						<div class="inner">
							<h1>Rentue</h1>
							<p>사진넣을거에오오오</p>
						</div>
						
			<div id="modal" class="modal-overlay" style="position: absolute;">
				<div class="modal-window">
					<div class="title">
						<h2>Let's Rentue-Member!</h2>
					</div>
					<div class="close-area">X</div>
					<div class="content">
						<p>
						내용내요애애요용애애요용
						</p>

	<script>
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
    </script>

		</section>

		<!-- One -->
		<section id="one" class="wrapper style2 fullscreen spotlights">
			<section>
				<a href="#" class="image"><img src="images/pic01.jpg" alt="" data-position="center center" /></a>
				<div class="content">
					<div class="inner">
						<h2>제품소개</h2>
						<p>제품설명란</p>
						<ul class="actions">
							<li><a href="join.jsp" class="button">Join Us</a></li>
						</ul>
					</div>
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
								<div class="field half">
									<label for="name">Name</label> <input type="text" name="name" id="name" />
								</div>
								<div class="field half">
									<label for="email">Email</label> <input type="text" name="email" id="email" />
								</div>
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
									31-15 광주아트센터 3층<br /> 광주광역시, 동구 예술길<br /> 대한민국
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
									<li><a href="#" class="icon brands fa-twitter"><span class="label">Twitter</span></a></li>
									<li><a href="#" class="icon brands fa-facebook-f"><span class="label">Facebook</span></a></li>
									<li><a href="#" class="icon brands fa-github"><span class="label">GitHub</span></a></li>
									<li><a href="#" class="icon brands fa-instagram"><span class="label">Instagram</span></a></li>
									<li><a href="#" class="icon brands fa-linkedin-in"><span class="label">LinkedIn</span></a></li>
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


	<script>
			
			function button_ps(){
				 member = $("input:radio[name='member']:checked").val(),
				 id = $('#id').val();
				 pw = $('#pw').val();
				 
				 
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
		 	   				if(member=='Rent_member'){
		 	   					url = 'rent_main.jsp';
		 	   				}else if(member=='Ct_member'){
		 	   					url = 'ct_main.jsp';
		 	   				}else if(member=='admin'){
		 	   					url = 'admin_main.jsp';
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
		    </script>
</body>
</html>