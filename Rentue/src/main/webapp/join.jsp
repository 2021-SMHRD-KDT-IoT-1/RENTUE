<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>

</head>
<body>
	<h5>ȸ������ �������Դϴ�.</h5>
	<form action="JoinServiceCon" method="post">
		<li><input type="radio" name="member" value="Rent_member" checked>��Ż��ü
			<input type="radio" name="member" value="Ct_member">������</li>
		<li><input type="text" placeholder="ID�� �Է��ϼ���" name="id"></li>
		<span></span>
		<!--�̹� �ִ� ���̵� �Դϴ� or ���� ���̵�׿�!-->
		<br>
		<li><input type="password" placeholder="PW�� �Է��ϼ���" name="pw"></li>
		<!-- ������ ���ýÿ��� ��ü��� ����ڹ�ȣ�� ��Ȱ��ȭ �Ǿ�� �Ѵ� -->
		<li id="rent_name"><input type="text" placeholder="��ü�� �Է��ϼ���" name="rent_name"></li>
		<li id="rent_num"><input type="text" placeholder="����ڹ�ȣ�� �Է��ϼ���" name="rent_num"></li>
		<li><input type="text" placeholder="�ּҸ� �Է��ϼ���" name="addr"></li>
		<li><input type="submit" value="JOIN US"></li>
	</form>

	<!-- ���ι�ư Ŭ�� �� �α��� ȭ������ ������-->
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