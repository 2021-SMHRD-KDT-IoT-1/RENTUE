<%@page import="com.model.wifiDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.model.wifiDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8"/>
	<title>Kakao 지도 시작하기</title>
</head>
<body>

	<%

	
	wifiDAO dao = new wifiDAO();
	wifiDTO dto = new wifiDTO();
	
	String a = request.getParameter("chars");
	String b = request.getParameter("flat");
	String c = request.getParameter("flon");
	String d = request.getParameter("w_date");
	
	System.out.println(a);
	System.out.println(b);
	System.out.println(c);
	System.out.println(d);
	
	dto.setChars(a);
	dto.setFlat(b);
	dto.setFlon(c);
	dto.setW_date(d);
	
	dao.insertwifi(dto);
	
	
	%>
	
	<p><%=dto.getChars()%></p>
	


	<div id="map" style="width:500px;height:400px;"></div>
	<div id="map" style="width:500px;height:400px;"></div>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=5ba48728ed5f259f330fd623cff35ca5"></script>
	<script>
		var container = document.getElementById('map');
		var options = {
			center: new kakao.maps.LatLng(<%= c %>, <%= b %>),
			level: 3
		};

		var map = new kakao.maps.Map(container, options);
	</script>

	
	
</body>
</html>