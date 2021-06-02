<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
li{
	list-style: none;
}


</style>
</head>
<body>

	<h5>ȸ������ �������Դϴ�.</h5>
	<ul>
		<li><input type="radio" name="member" value="Rent_member" checked>��Ż��ü
			<input type="radio" name="member" value="Ct_member">������</li>
		<li><input type="text" placeholder="ID�� �Է��ϼ���" id="id"></li>
		<li><span></span></li>
		<!--�̹� �ִ� ���̵� �Դϴ� or ���� ���̵�׿�!-->
		<li><input type="password" placeholder="PW�� �Է��ϼ���" id="pw"></li>
		<!-- ������ ���ýÿ��� ��ü��� ����ڹ�ȣ�� ��Ȱ��ȭ �Ǿ�� �Ѵ� -->
		<li id="r_name"><input type="text" placeholder="��ü�� �Է��ϼ���" id="rent_name"></li>
		<li id="r_num"><input type="text" placeholder="����ڹ�ȣ�� �Է��ϼ���" id="rent_num"></li>
		<li><input type="text" id="sample5_address" placeholder="�ּҸ� �˻��ϼ���" >
			<input type="button" onclick="sample5_execDaumPostcode()" value="�ּ� �˻�"></li>
		<li id="select"><select id="targetSel">

		</select>
			<button id="search">����� ������ ã��</button></li>
		<li><button id="submit" type="button" onclick="button_ps()">JOIN US</button></li>
	</ul>
	<div id="map"
		style="width: 300px; height: 300px; margin-top: 10px; display: none"></div>



	<!-- �ּ� ���ý� ���� �ߴ� �ڵ� -->
	<script
		src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<!-- <script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=���ξ�Ű�ּ��Է��ϱ�!!!!!&libraries=services"></script> -->
	<script
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=92da30628c14e3e7954ea453ba17c38a&libraries=services"></script>
	<script>
		
		// �˻��� ��ǥ
		let result;
		
		// �˻��� �ּҰ�
		let addr_save;
	
	
		var mapContainer = document.getElementById('map'), // ������ ǥ���� div
		mapOption = {
			center : new daum.maps.LatLng(37.537187, 127.005476), // ������ �߽���ǥ
			level : 5
		// ������ Ȯ�� ����
		};

		//������ �̸� ����
		var map = new daum.maps.Map(mapContainer, mapOption);
		//�ּ�-��ǥ ��ȯ ��ü�� ����
		var geocoder = new daum.maps.services.Geocoder();
		//��Ŀ�� �̸� ����
		var marker = new daum.maps.Marker({
			position : new daum.maps.LatLng(37.537187, 127.005476),
			map : map
		});

		function sample5_execDaumPostcode() {
			new daum.Postcode({
				oncomplete : function(data) {
					var addr = data.address; // ���� �ּ� ����
					addr_save = addr;
					// �ּ� ������ �ش� �ʵ忡 �ִ´�.
					document.getElementById("sample5_address").value = addr;
					// �ּҷ� �� ������ �˻�
					geocoder.addressSearch(data.address, function(results,
							status) {
						// ���������� �˻��� �Ϸ������
						if (status === daum.maps.services.Status.OK) {

							result = results[0]; //ù��° ����� ���� Ȱ��

							// �ش� �ּҿ� ���� ��ǥ�� �޾Ƽ�
							var coords = new daum.maps.LatLng(result.y,
									result.x);
							// ������ �����ش�.
							mapContainer.style.display = "block";
							map.relayout();
							// ���� �߽��� �����Ѵ�.
							map.setCenter(coords);
							// ��Ŀ�� ��������� ���� ��ġ�� �ű��.
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
		            console.log("�Ϸ�!");
		        },
		        error:function(){
		            alert("���� �߻�~~ \n");
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
					$("input[name='r_name']").prop("disabled", true);
					$("input[name='r_num']").prop("disabled", true);
					$("input[name='r_name']").val("");
					$("input[name='r_num']").val("");
					$("#r_name").hide();
					$("#r_num").hide();
					$("#select").hide();
				} else {
					$("input[name='r_name']").prop("disabled", false);
					$("input[name='r_num']").prop("disabled", false);
					$("#r_name").show();
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
				url : 'SearchCt',
				success : function(jsonArray) {
					console.log(jsonArray);
					
					$('#targetSel').children("option").remove();
					for (var i = 0; i < jsonArray.length; i++) {
						console.log(jsonArray[i]);

						var option = "<option value='" + jsonArray[i]+"'>" + jsonArray[i]+ "</option>";
						console.log(option);
						$('#targetSel').append(option);

					} 
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