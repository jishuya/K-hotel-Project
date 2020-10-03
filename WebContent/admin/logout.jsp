<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, javax.sql.*, java.net.*, java.io.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	<br>
	<br>
	<hr width=700 color=#69491A>
	<h1 align=center><img src="../reservation/resv/roomlogo10.png" style="width: 55px"> Log Out</h1>
	<hr width=700 color=#69491A>
	<div align=center>
		<%
		// 세션지우기
		session.invalidate();
		out.println("<h2>You have been logged out.</h2>");
		//로그아웃 후 일반적으로는 홈으로 간다(여기서는 login_test.jsp)
		out.println("<input type=button value='메인페이지' onclick=\"location.href='../main.html'\">");
		%>
	</div>
	
	
	
</body>
</html>