<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">


		<title>RenTue ���������� �Դϴ�!!</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="assets/css/main.css" />
		<noscript><link rel="stylesheet" href="assets/css/noscript.css" /></noscript>
		<!-- �α��� â ���� ���� jquery �ҷ����� -->
		<script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/jquery/1.9.0/jquery.js"></script>
		
		<!-- �α��� ��ư ������ ID/PWâ �߰� ������ �ڵ� -->
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
#joinbutton {
	margin : 2em;
	
}

</style>
<body class="is-preload">



		<!-- Sidebar -->
			<section id="sidebar">
				<div class="inner">
					<ul class="actions small">
						<li><a href="#" class="button small">Ȩ����</a></li>
						<!-- <li><a href="#" class="button primary small">�α���</a></li> -->
						<!-- a�±׷� �ٲ���ϸ� �ٲ㵵 �ɰ� ����.. ���� �� �𸣰��� -->
						<li id= "displayselect"><input type="button" id="showbtn" value="�α���" class="button primary small"></li>
						
					</ul>
	
	<!-- ������ �ִ� �α��� �����κ� -->
	<div style="display: none;" id="displaydiv" >
	
		<span><input  type="radio" name="member" value="Rent_member" checked>��Ż��ü
			  <input   type="radio" name="member" value="Ct_member">������</span>
			  
		<span> ID<input type ="text" name ="id" id = "id"></span>
		<span>PW<input type ="password" name ="pw"  id="pw"></span>
		
		<div><a id="joinbutton" href="join.jsp" class="button primary small">ȸ������</a>
		<input type="button"  id="hidebtn" value="Ȯ��" class="button small"  onclick="button_ps()"></div>
		
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
						<p>ȸ������ â</p>
					</div>
				</section> -->
				
				<!-- Intro -->
					<section id="intro" class="wrapper style1 fullscreen fade-up">
						<div class="inner">
							<h1>Rentue</h1>
							<p>���������ſ�������</p>
						</div>
					</section>

				<!-- One -->
					<section id="one" class="wrapper style2 fullscreen spotlights">
						<section>
							<a href="#" class="image"><img src="images/pic01.jpg" alt="" data-position="center center" /></a>
							<div class="content">
								<div class="inner">
									<h2>��ǰ�Ұ�</h2>
									<p>��ǰ�����</p>
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
							<p>���� ����</p>
							<div class="split style1">
								<section>
									<form method="post" action="#">
										<div class="fields">
											<div class="field half">
												<label for="name">Name</label>
												<input type="text" name="name" id="name" />
											</div>
											<div class="field half">
												<label for="email">Email</label>
												<input type="text" name="email" id="email" />
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
											<span>31-15 ���־�Ʈ���� 3��<br />
											���ֱ�����, ���� ������<br />
											���ѹα�</span>
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
	 	        
	 	       success:function(){	 	    	
	 	    		console.log("�Ϸ�!");
	 	   			let url = null;
	 	   			if(member=='Rent_member'){
	 	   				url = 'rent_main.jsp';
	 	   			}else{
	 	   				url = 'ct_main.jsp';
	 	   			}
	            	location.replace(url);
		        },
		        error:function(){
		           alert("���� �߻�~~ \n");
		    	}
		    });	
			 }
		    </script>
	</body>
</html>