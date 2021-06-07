
<%@page import="java.util.ArrayList"%>
<%@page import="com.model.wifiDTO"%>
<%@page import="com.model.wifiDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>


	<%
wifiDAO dao = new wifiDAO();
wifiDTO dto = new wifiDTO();


wifiDTO one = dao.selectOne();

if(Float.parseFloat(one.getFlat()) >= 35.14964 && Float.parseFloat(one.getFlat()) <= 35.14964 
		|| Float.parseFloat(one.getFlon()) >= 126.91995 && Float.parseFloat(one.getFlon()) <= 126.92030){
	response.getWriter().print("flat : "+one.getFlat());
	response.getWriter().print("flon : "+one.getFlon());
}else{
	response.getWriter().print("beep");
}



%>

<p><%=one.getChars() %></p>

</body>
</html>