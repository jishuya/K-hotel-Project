<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.text.*,java.util.*"%>
<%@ page import="java.sql.*, javax.sql.*, java.io.*, domain3.*, service3.*, dao3.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<style>
#dialogoverlay{
	display: none;
	opacity: .8;
	position: fixed;
	top: 0px;
	left: 0px;
	background: #FFF;
	width: 100%;
	z-index: 10;
}
#dialogbox{
	display: none;
	position: fixed;
	background: #000;
	border-radius:7px; 
	width:550px;
	z-index: 10;
}
#dialogbox > div{ background:#FFF; margin:8px; }
#dialogbox > div > #dialogboxhead{ background: #666; font-size:19px; padding:10px; color:#CCC; }
#dialogbox > div > #dialogboxbody{ background:#333; padding:20px; color:#FFF; }
#dialogbox > div > #dialogboxfoot{ background: #666; padding:10px; text-align:right; }
</style>
<script>
function CustomAlert(){
    this.render = function(dialog){
        var winW = window.innerWidth;
        var winH = window.innerHeight;
        var dialogoverlay = document.getElementById('dialogoverlay');
        var dialogbox = document.getElementById('dialogbox');
        dialogoverlay.style.display = "block";
        dialogoverlay.style.height = winH+"px";
        dialogbox.style.left = (winW/2) - (550 * .5)+"px";
        dialogbox.style.top = "100px";
        dialogbox.style.display = "block";
        document.getElementById('dialogboxhead').innerHTML = "Acknowledge This Message";
        document.getElementById('dialogboxbody').innerHTML = dialog;
        document.getElementById('dialogboxfoot').innerHTML = '<button onclick="Alert.ok()">OK</button>';
    }
	this.ok = function(){
		document.getElementById('dialogbox').style.display = "none";
		document.getElementById('dialogoverlay').style.display = "none";
	}
}
var Alert = new CustomAlert();
</script>
<style>
h3 {
	color: #d4a162;
}
</style>
	<%
		request.setCharacterEncoding("UTF-8");
	ResvService resvService = new ResvService();
	ResvDao resvDao = new ResvDao();
	

	String name = request.getParameter("name");
	String date = request.getParameter("date");
	int room = Integer.parseInt(request.getParameter("room"));
	String address = request.getParameter("address");
	String phone_num = request.getParameter("phone_num");
	String in_name = request.getParameter("in_name");
	String text = request.getParameter("comment");
	String resvDate = request.getParameter("w_date");
	
	// 예약이 되었다면, 
	int processing = 1;
		Reservation reservation = new Reservation();

	// 	
	if (0 == resvDao.selectOne(date, room).getRoom() || resvDao.selectOne(date, room).getIn_name() == null || resvDao.selectOne(date, room).getIn_name() == "") {
		reservation = new Reservation(name, date, room, address, phone_num, in_name, text, resvDate, processing);
	} else {
		out.println("<script>alert('Already reserved'); location.href='../reservation/d_01.jsp';</script>");
		resvDao.delete(0, 0);
	}
	

	resvService.insertResv(reservation);
	
	String roomName = "";
	if (room == 1) {
		roomName = "Gold";
	} else if (room == 2) {
		roomName = "Silver";
	} else if (room == 3) {
		roomName = "Bronze";
	}
	
	out.println(date);
	
	String resvYear = date.substring(0, 4);
	String resvMonth = date.substring(4, 6);
	String resvDay = date.substring(6, 8);
	out.println(resvYear);
	out.println(resvMonth);
	out.println(resvDay);
	%>
</head>
<body bgcolor=white>
	<div>
		<hr width=800 color=#69491a>
	</div>
	
	<h2 align=center>K-hotel 예약이 완료되었습니다</h4>
	<h3 align=center><%=name%>님, 예약 내역입니다.
	<span style="color:#6E5B5F"><%=resvMonth%></span>월
	<span style="color:#6E5B5F"><%=resvDay%></span>일
	<span style="color:#6E5B5F"><%=roomName%></span> 룸 예약이 완료되었습니다.</h3>
	<p>
	<div>
		<hr width=800 color=#69491a>
	</div>
	<br>
	<h4 align=center>잠시 후 이전 페이지로 이동합니다.</h4>


</body>
<!-- 
fresh: 새로고침을 해주는 태그, 시간과 URL입력시 원하는 페이지로 이동가능
<meta http-equiv="fresh" content="시간(초 단위); URL=이동하고자 하는 웹페이지 또는 미디어주소">
 -->
<META http-equiv=refresh content="5;url=d_01.jsp">
</html>