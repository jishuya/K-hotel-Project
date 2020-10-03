<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
h2 {
	color: #69491A;
}
</style>
</head>
<body bgcolor=white>

	<br>
	<br>
	<hr width=500 color=#69491A>
	<h1 align=center><img src="../reservation/resv/roomlogo10.png" style="width: 55px"> Log-out Message</h1>
	<hr width=500 color=#69491A>
	<br>
	<br>

	<div align=center>
		<%
		session.invalidate();		
		out.println("<h2>You have been logged out.</h2>");
		out.println("<h2>Thank you :)</h2>");
		//로그아웃 후 일반적으로는 홈으로 간다(여기서는 login_test.jsp)
		out.println("<input type=button value='main page' onclick=\"location.href='adm_allview.jsp'\">");
		%>
	</div>
	
	
	
</body>
</html>