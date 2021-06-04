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
<title>��Ż��ü ȸ�� �������Դϴ�.</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="assets/css/rent_main.css" />
<noscript>
	<link rel="stylesheet" href="assets/css/noscript.css" />
</noscript>
</head>
<body class="is-preload">

	<%
	RentDTO dto = (RentDTO) session.getAttribute("dto");
	DeviceDAO dao = new DeviceDAO();	
	ArrayList<DeviceDTO> list = dao.select(dto.getRent_id());
	%>


	<!-- Sidebar -->
	<section id="sidebar">
		<div class="inner">
			<ul class="actions small">
				<li><a href="#" class="button small">Ȩ����</a></li>
				<li><input type="button" value="my page"
					onclick="window.open('mypage.jsp', '����������', 'width=900px, height=1200px')"
					class="button primary small"></li>
				<li>
					<!-- �α��� �� �����̴ϱ� �α��� ��ư�� �α׾ƿ����� �ٲ��� �� --> <input type="button"
					value="�α���"
					onclick="window.open('login.html', '�α���', 'width=900px, height=1200px')"
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
						<p>ȸ������ â</p>
					</div>
				</section> -->

		<!-- Intro -->
		<section id="intro" class="wrapper style1 fullscreen fade-up">
			<div class="inner">
				<h1>Rentue-��Ʈ��ü</h1>
				<p>��Ʈ ����API �����ϱ�</p>
			</div>
		</section>

		<!-- One -->
		<section id="one" class="wrapper style2 fullscreen spotlights">
			<section>

				<div class="content">
					<div class="inner">
						<h2>Rentue ������</h2>
					</div>
				</div>
			</section>


			<label>
				<div>
					
					<select style="width: 200px; display: inline;">
						<option>�ڵ���</option>
						<option>Ʃ����</option>
					</select>
					<button>�߰����</button>

					<button>����</button>
					
				</div>
			</label>
			<section>
					
				<div>	
					<select style="width: 200px;">
					<option>��ü ���</option>
					<option>�뿩������ ���</option>
					<option>�뿩���� ���</option>
					<option>���� ���</option>

				</div>
				
				<div overflow="scroll">
				
					</select>

					<table>
						<!-- ù��° �� -->
						<tr>
							<td>����ȣ</td>
							<td>Ÿ��</td>
							<td>��Ż��Ȳ</td>
							<td>���忩��</td>							
							<td>���</td>
							
						</tr>

						<tr>
							<!-- �ι�° ����ʹ� ���� ���� �� -->


							<%
							for (int i = 0; i < list.size(); i++) {
							%>


							<td><%=list.get(i).getDevice_num()%></td>
							<td><%=list.get(i).getDevice_type()%></td>
							<td><%=list.get(i).getRent_state()%></td>
							<td><%=list.get(i).getBroken()%></td>
							<td><a href="DeleteServiceCon?device_num=<%=list.get(i).getDevice_num()%>">����</a></td>
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
				<p>���� ����</p>
				<div class="split style1">
					<section>
						<form method="post" action="#">
							<div class="fields">
								<div class="field">
									<label for="name">�α����� ���̵� ����ϼ���</label> <input type="text"
										name="title" id="title" placeholder="�� ������ �Է����ּ���" />
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
								<h3>Address</h3> <span>31-15 ���־�Ʈ���� 3��<br /> ���ֱ�����, ����
									������<br /> ���ѹα�
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

</body>
</html>