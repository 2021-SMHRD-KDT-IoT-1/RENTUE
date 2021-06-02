<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>렌탈업체 회원 페이지입니다.</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="assets/css/rent_main.css" />
		<noscript><link rel="stylesheet" href="assets/css/noscript.css" /></noscript>
</head>
<body class="is-preload">

		<!-- Sidebar -->
			<section id="sidebar">
				<div class="inner">
					<ul class="actions small">
						<li><a href="#" class="button small">홈으로</a></li>
						<li>	
							<input type="button" value="my page" onclick="window.open('마이페이지html파일 주소', '마이페이지', 'width=900px, height=1200px')" class="button primary small">
						</li>
						<li>	
							<!-- 로그인 한 상태이니까 로그인 버튼이 로그아웃으로 바뀌어야 함 -->
							<input type="button" value="로그인" onclick="window.open('login.html', '로그인', 'width=900px, height=1200px')" class="button primary small">
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
					</section>

				<!-- One -->
					<section id="one" class="wrapper style2 fullscreen spotlights">
						<section>
							<a href="#" class="image"><img src="images/pic01.jpg" alt="" data-position="center center" /></a>
							<div class="content">
								<div class="inner">
									<h2>기기 재고관리</h2>
									<p>재고관리 내용</p>
									
								</div>
							</div>
						</section>	
					</section>	

				<!-- Two -->
				<section id="two" class="wrapper style1 fade-up">
					<div class="inner">
						<h2>Get in touch</h2>
						<p>제품고장 신고 / 문의 사항</p>
						<div class="split style1">
							<section>
								<form method="post" action="#">
									<div class="fields">
										<div class="field half">
											<label for="name">로그인한 아이디 출력하기</label>
											<input type="text" name="name" id="name" placeholder="제목을 입력하세요"/>
										</div>
										
										
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
											<h3>Address</h3>
											<span>31-15 광주아트센터 3층<br />
											광주광역시, 동구 예술길<br />
											대한민국</span>
										</li>
										<li>
											<h3>Email</h3>
											<a href="#">Rentue@rentue.co.kr</a>
										</li>
										<li>
										<h3>Phone</h3>
										<span>(000) 000-0000</span>
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
						<li>&copy; Untitled. All rights reserved.</li><li>Design: <a href="http://html5up.net">HTML5 UP</a></li>
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

	</body>
</html>