<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.text.*,java.util.*"%>
<%@ page import="java.sql.*, javax.sql.*, java.io.*, domain3.*, service3.*, dao3.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<br>
	<br>
	<hr width=700 color=#69491A>
	<h1 align=center><img src="../reservation/resv/roomlogo10.png" style="width: 55px"> 업데이트 </h1>
	<hr width=700 color=#69491A>
	<h4 align=center> 예약정보가 업데이트 되었습니다 </h4>
	<div align=center>
	<input type=button value='관리자 페이지' onclick= "location.href='../admin/adm_allview.jsp'">
	</div>
	

	<%
	request.setCharacterEncoding("UTF-8");

	ResvService resvService = new ResvService();
	ResvDao resvDao = new ResvDao();
	
	String name = request.getParameter("name");
	int room = Integer.parseInt(request.getParameter("room"));
	String date = request.getParameter("date");
	String address = request.getParameter("address");
	String phone_num = request.getParameter("phone_num");
	String in_name = request.getParameter("in_name");
	String comment = request.getParameter("comment");
	String w_date = request.getParameter("w_date");
	
	String preDate = request.getParameter("preDate");
	int preRoom = Integer.parseInt(request.getParameter("preRoom"));
	
	Reservation reservation = new Reservation(name, date, room, address, phone_num, in_name, comment, w_date, 1);
	
	resvDao.delete(preDate, preRoom);
	resvDao.insertResv(reservation);
	%>
</body>
<META http-equiv=refresh content="0;url=../admin/adm_allview.jsp">
</html>