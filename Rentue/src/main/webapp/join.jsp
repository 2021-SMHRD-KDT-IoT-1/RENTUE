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
		<li><input type="text" placeholder="주소를 입력하세요" name="addr"></li>
		<li><input type="submit" value="JOIN US"></li>
	</form>

	<!-- 조인버튼 클릭 시 로그인 화면으로 가야함-->
	<script src="assets/js/jquery.min.js"></script>
	<script type="text/javascript">
		 $(document).ready(function(){
			$("input[name='member']:radio").change(function(){
				var type = this.value;
				
				if(type == "Ct_member"){
					$("input[name='rent_name']").prop("disabled",true);
					$("input[name='rent_num']").prop("disabled",true);
					$("input[name='rent_name']").val("");
					$("input[name='rent_num']").val("");
					$("#rent_name").hide();
					$("#rent_num").hide();					
				}else{
					$("input[name='rent_name']").prop("disabled",false);
					$("input[name='rent_num']").prop("disabled",false);
					$("#rent_name").show();
					$("#rent_num").show();	
				}
			});
		}); 
	</script>
</body>
</html>