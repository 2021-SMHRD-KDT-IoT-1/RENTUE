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
			<input type="text" id="sample5_address"placeholder="�ּ�">
			<input type="button" onclick="sample5_execDaumPostcode()" value="�ּ� �˻�"><br>
		<div id="map" style="width: 300px; height: 300px; margin-top: 10px; display: none"></div>
		<li><input type="submit" value="JOIN US"></li>
	</form>



<!-- �ּ� ���ý� ���� �ߴ� �ڵ� -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<!-- <script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=���ξ�Ű�ּ��Է��ϱ�!!!!!&libraries=services"></script> -->
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7bf4d86dadf87fc45ddad1e9b45a01dd&libraries=services"></script>
<script>
    var mapContainer = document.getElementById('map'), // ������ ǥ���� div
        mapOption = {
            center: new daum.maps.LatLng(37.537187, 127.005476), // ������ �߽���ǥ
            level: 5 // ������ Ȯ�� ����
        };

    //������ �̸� ����
    var map = new daum.maps.Map(mapContainer, mapOption);
    //�ּ�-��ǥ ��ȯ ��ü�� ����
    var geocoder = new daum.maps.services.Geocoder();
    //��Ŀ�� �̸� ����
    var marker = new daum.maps.Marker({
        position: new daum.maps.LatLng(37.537187, 127.005476),
        map: map
    });


    function sample5_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                var addr = data.address; // ���� �ּ� ����

                // �ּ� ������ �ش� �ʵ忡 �ִ´�.
                document.getElementById("sample5_address").value = addr;
                // �ּҷ� �� ������ �˻�
                geocoder.addressSearch(data.address, function(results, status) {
                    // ���������� �˻��� �Ϸ������
                    if (status === daum.maps.services.Status.OK) {

                        var result = results[0]; //ù��° ����� ���� Ȱ��

                        // �ش� �ּҿ� ���� ��ǥ�� �޾Ƽ�
                        var coords = new daum.maps.LatLng(result.y, result.x);
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
</script>

	<!-- ���ι�ư Ŭ�� �� �α��� ȭ������ ������-->
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