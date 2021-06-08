<%@page import="com.model.DeviceDTO"%>
<%@page import="com.model.DeviceDAO"%>
<%@page import="com.model.CtDTO"%>
<%@page import="com.model.CtDAO"%>
<%@page import="com.model.RentDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.model.RentDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>관리자 페이지입니다.</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="assets/css/admin_main.css" />
<noscript>
	<link rel="stylesheet" href="assets/css/noscript.css" />
</noscript>
</head>
<body class="is-preload">
	<%
	RentDAO rent_dao = new RentDAO();
	ArrayList<RentDTO> rent_list = rent_dao.select();

	CtDAO ct_dao = new CtDAO();
	ArrayList<CtDTO> ct_list = ct_dao.select();

	DeviceDAO device_dao = new DeviceDAO();
	ArrayList<DeviceDTO> device_list = device_dao.select(null, null);
	%>
	<script src="assets/js/jquery.min.js"></script>

	<!-- Sidebar -->
	<section id="sidebar">
		<div class="inner">
			<ul class="actions small">
				<li><a href="#" class="button small">홈으로</a></li>
				<li><input type="button" value="my page" onclick="window.open('mypage.jsp', '마이페이지', 'width=900px, height=1200px')" class="button primary small">
				</li>
				<li><input type="button" value="로그아웃" onclick="location.href='LogoutServiceCon'" class="button primary small"></li>

			</ul>
			<nav>
				<ul>
					<li><a href="#rent">rental office</a></li>
					<li><a href="#ct">control station</a></li>
					<li><a href="#device">device</a></li>
				</ul>
			</nav>
		</div>
	</section>


	<!-- Wrapper -->
	<div id="wrapper">

		<section id="rent" class="wrapper style1 fullscreen fade-up">
			<h3>렌탈업체 목록</h3>
			<div>
				<button id="add" class="button small">등록</button>
				<button id="delete" class="button small">삭제</button>
			</div>
			<input type='text' id='rent_searchall' placeholder='검색어를 입력하세요'><br>
			<div id="rent_div" style="width: 100%; height: 30em; overflow: auto">
				<table id="rent_table">
					<thead>
						<tr>
							<th>No.</th>
							<th><input type="checkbox" id="rent_checkall"></th>
							<th>아이디</th>
							<th>비밀번호</th>
							<th>업체명</th>
							<th>사업자번호</th>
							<th>주소</th>
							<th>소속 관제소</th>
						</tr>
					</thead>
					<tbody>
						<%
						for (int i = 0; i < rent_list.size(); i++) {
						%>
						<tr>
							<td><%=i + 1%></td>
							<td><input type="checkbox" name="rent_check"></td>
							<td><%=rent_list.get(i).getRent_id()%></td>
							<td><%=rent_list.get(i).getRent_pw()%></td>
							<td><%=rent_list.get(i).getRent_name()%></td>
							<td><%=rent_list.get(i).getRent_num()%></td>
							<td><%=rent_list.get(i).getRent_addr()%></td>
							<td><%=rent_list.get(i).getCt_id()%></td>
						</tr>
						<%
						}
						%>
					</tbody>
				</table>
			</div>
		</section>
		<script type="text/javascript">
			$("#rent_checkall").click(function() {
				if ($("#rent_checkall").prop("checked")) {
					$("input[name=rent_check]").prop("checked", true);
				} else {
					$("input[name=rent_check]").prop("checked", false);
				}
			});

			// Search all columns
			$('#rent_searchall')
					.keyup(
							function() {
								// Search Text
								var search = $(this).val();

								// Hide all table tbody rows
								$('#rent_table tbody tr').hide();

								// Count total search result
								var len = $('#rent_table tbody tr:not(.notfound) td:contains("'
										+ search + '")').length;

								if (len > 0) {
									// Searching text in columns and show match row
									$(
											'#rent_table tbody tr:not(.notfound) td:contains("'
													+ search + '")').each(
											function() {
												$(this).closest('tr').show();
											});
								}
							});
		</script>



		<section id="ct" class="wrapper style2 fullscreen spotlights">
			<h3>관제소 목록</h3>
			<div>
				<button id="add">등록</button>
				<button id="delete">삭제</button>
			</div>
			<input type='text' id='ct_searchall' placeholder='검색어를 입력하세요'><br>
			<div id="ct_div" style="width: 100%; height: 30em; overflow: auto">
				<table id="ct_table">
					<thead>
						<tr>
							<th>No.</th>
							<th><input type="checkbox" id="ct_checkall"></th>
							<th>아이디</th>
							<th>비밀번호</th>
							<th>관제소명</th>
							<th>주소</th>
						</tr>
					</thead>
					<tbody>
						<%
						for (int i = 0; i < ct_list.size(); i++) {
						%>
						<tr>
							<td><%=i + 1%></td>
							<td><input type="checkbox" name="ct_check"></td>
							<td><%=ct_list.get(i).getCt_id()%></td>
							<td><%=ct_list.get(i).getCt_pw()%></td>
							<td><%=ct_list.get(i).getCt_name()%></td>
							<td><%=ct_list.get(i).getCt_addr()%></td>
						</tr>
						<%
						}
						%>
					</tbody>
				</table>
			</div>
		</section>
		<script type="text/javascript">
			$("#ct_checkall").click(function() {
				if ($("#ct_checkall").prop("checked")) {
					$("input[name=ct_check]").prop("checked", true);
				} else {
					$("input[name=ct_check]").prop("checked", false);
				}
			});

			// Search all columns
			$('#ct_searchall')
					.keyup(
							function() {
								// Search Text
								var search = $(this).val();

								// Hide all table tbody rows
								$('#ct_table tbody tr').hide();

								// Count total search result
								var len = $('#ct_table tbody tr:not(.notfound) td:contains("'
										+ search + '")').length;

								if (len > 0) {
									// Searching text in columns and show match row
									$(
											'#ct_table tbody tr:not(.notfound) td:contains("'
													+ search + '")').each(
											function() {
												$(this).closest('tr').show();
											});
								}
							});
		</script>



		<section id="device" class="wrapper style1 fade-up">
			<h3>기기 목록</h3>
			<div>
				<input type="text" id="device_rent_id" placeholder="렌탈업체아이디"> <select id="device_type">
					<option value="A">튜브형</option>
					<option value="B">핸디형</option>
				</select>
				<button id="add" onclick="addValue();">기기등록</button>
				<button id="delete" onclick="deleteValue();">선택삭제</button>
			</div>
			<input type='text' id='device_searchall' placeholder='검색어를 입력하세요'><br>
			<div id="device_div" style="width: 100%; height: 30em; overflow: auto">
				<form>
					<table id="kkk">
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
						<!-- 두번째 행부터는 내용 들어가야 함 -->


						<%
						for (int i=0; i<device_list.size(); i++) {
							int rowNum = i+1;
						%>
						<tr class='drow'>
							<td><%=rowNum%></td>
							<td><%=device_list.get(i).getDevice_num()%></td>
							<td><%=device_list.get(i).getDevice_type()%></td>
							<td><%=device_list.get(i).getRent_state()%></td>
							<td><%=device_list.get(i).getBroken()%></td>
							<td><a href="Device_State_Update?device_num=<%=device_list.get(i).getDevice_num()%>">렌탈</a></td>
							<td><a href="Device_broken_update?device_num=<%=device_list.get(i).getDevice_num()%>">고장</a></td>
							<td><input type='checkbox' class='del_check' style='appearance: auto !important; opacity: 100 !important;' /></td>
						</tr>
						<%
						}
						%>
					</table>
					<input type="button" id="chk_delbtn" value="체크항목 삭제" />
					<%-- <table id="device_table">
						<thead>
							<tr>
								<th>No.</th>
								<th><input type="checkbox" id="device_checkall"></th>
								<th>기기번호</th>
								<th>소속 렌탈업체</th>
								<th>타입</th>
								<th>대여여부</th>
								<th>고장여부</th>
							</tr>
						</thead>
						<tbody>
							<%
							for (int i = 0; i < device_list.size(); i++) {
								int num = device_list.get(i).getDevice_num();
								String state = device_list.get(i).getRent_state();
								System.out.println(num);
								System.out.println(state);
							%>
							<tr>
								<td><%=i + 1%></td>
								<td><input type="checkbox" name="device_check" value="<%=num%>"></td>
								<td><%=num%></td>
								<td><%=device_list.get(i).getRent_id()%></td>
								<td>
									<%
									if (device_list.get(i).getDevice_type().equals("A")) {
									%> 튜브형 <%
									} else {
									%> 핸디형 <%
									}
									%>
								</td>
								<td>
									<a href='javascript:void(0);' onclick="updateState(<%=num %>,<%=state %>);"><%
									if (state.equals("F")) {
									%> 대기 <%
									} else {
									%> 대여중 <%
									}
									%></a>
								</td>
								<td>
									<%
									if (device_list.get(i).getBroken().equals("F")) {
									%> 정상 <%
									} else {
									%> 고장 <%
									}
									%>
								</td>
							</tr>
							<%
							}
							%>
						</tbody>
					</table> --%>
				</form>
			</div>
		</section>

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
								alert("삭제 성공~~ \n");							        	
					        },
					        error:function(a, b, c){
					        	console.log(a);
					        	console.log(b);
					        	console.log(c);
					            alert("에러 발생~~ \n");
					    	}
						});
				});
				 $.ajax({
					 	data: {
					        <%-- 'gg' : '<%=dto.getRent_id()%>', --%>
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
				            alert("에러 발생~~ \n");
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
					        <%-- 'gg' : '<%=dto.getRent_id()%>', --%>
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
				            alert("에러 발생~~ \n");
				    	}
					});
				
				$("#kkk").find("tr").each(function(i, v) {
					if (i > 0) {
						$(this).remove();
					}
				});
			}).trigger("change");
		});
			/* $(function() {
				var chkObj = document.getElementsByName("device_check");
				var rowCnt = chkObj.length;

				$("#device_checkall").click(function() {
					var chk_listArr = $("input[name='device_check']");
					for (var i = 0; i < chk_listArr.length; i++) {
						chk_listArr[i].checked = this.checked;
					}
				});
				$("input[name='device_check']")
						.click(
								function() {
									if ($("input[name='device_check']:checked").length == rowCnt) {
										$("#device_checkall")[0].checked = true;
									} else {
										$("#device_checkall")[0].checked = false;
									}
								});
			});

			function deleteValue() {
				let deviceValueArr = new Array();
				let device_list = $("input[name='device_check']");
				for (var i = 0; i < device_list.length; i++) {
					if (device_list[i].checked) {
						deviceValueArr.push(device_list[i].value);
					}
				}
				if (deviceValueArr.length == 0) {
					alert("선택된 글이 없습니다.");
				} else {
					var chk = confirm("정말 삭제하시겠습니까?");
					console.log(deviceValueArr);
					$.ajax({
						url : 'DeleteServiceCon',
						type : 'post',
						traditional : true,
						data : {
							device_num : deviceValueArr
						},
						success : function() {
							alert("삭제 성공");
							device_refresh();
						},
						error : function() {
							alert("삭제 실패");
						}
					});
				}
			}
			function addValue() {
				rent_id = $('#device_rent_id').val();
				type = $('#device_type').val();

				$.ajax({
					url : 'InsertServiceCon',
					type : 'post',
					data : {
						rent_id : rent_id,
						type : type
					},

					success : function() {
						alert("등록 성공");
						device_refresh();

					},
					error : function() {
						alert("등록 실패");
					}
				});
			}

			function device_refresh() {
				var currentLocation = window.location;
				$("#device_div").load(currentLocation + ' #device_div');
			}

			// Search all columns
			$('#device_searchall')
					.keyup(
							function() {
								// Search Text
								var search = $(this).val();

								// Hide all table tbody rows
								$('#device_table tbody tr').hide();

								// Count total search result
								var len = $('#device_table tbody tr:not(.notfound) td:contains("'
										+ search + '")').length;

								if (len > 0) {
									// Searching text in columns and show match row
									$(
											'#device_table tbody tr:not(.notfound) td:contains("'
													+ search + '")').each(
											function() {
												$(this).closest('tr').show();
											});
								}
							});
			function updateState(num,state){
				console.log(num);
				console.log(state);
				$.ajax({
					url : 'ChangeRentState',
					type : 'post',
					data : {
						num : num,
						state : state
					},

					success : function() {
						console.log("변경 완료")
						device_refresh();
					},
					error : function() {
						alert("변경 실패");
					}
				});
			} */
		</script>
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


	<script src="assets/js/jquery.scrollex.min.js"></script>
	<script src="assets/js/jquery.scrolly.min.js"></script>
	<script src="assets/js/browser.min.js"></script>
	<script src="assets/js/breakpoints.min.js"></script>
	<script src="assets/js/util.js"></script>
	<script src="assets/js/main.js"></script>
</body>
</html>