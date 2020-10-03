<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.text.*,java.util.*"%>
<%@ page import="java.sql.*, javax.sql.*, java.io.*, domain3.*, service3.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.0/themes/base/jquery-ui.css" />
<script src="http://code.jquery.com/jquery-1.8.3.js"></script>
<script src="http://code.jquery.com/ui/1.10.0/jquery-ui.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<link rel="stylesheet" href="/resources/demos/style.css" />
<script>
	$(function() {
		$("#datepicker").datepicker({
			dateFormat : 'yymmdd',
			monthNamesShort : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월' ],
			dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ],
			changeMonth : true, //월변경가능
			changeYear : true, //년변경가능
			showMonthAfterYear : true, //년 뒤에 월 표시
			minDate : 0,
			maxDate : 30
		});
	});


</script>
<script>
	function check() {
		var chck1 = true;
		var chck2 = true;
		if (form0.name.value == "") {
			swal("Please enter your name correctly", "이름을 입력하여 주세요", "error");
			chck1 = false;
		} else {
			if (form0.name.value.length > 8 || form0.name.value.length < 2) {
				swal("error", "이름을 7 글자 이하로 입력해 주세요", "error");
				chck2 = false;
			}
		}

		/*
		if (form0.room.value == "") {
			alert("원하시는 방을 선택해 주세요");
			chck1 = false;
		}
		 */

		if (form0.address.value == "") {
			swal("error", "Please enter your address correctly", "error");
			chck1 = false;
		}

		if (form0.phone_num.value == "") {
			swal("error", "Please enter your phone-number correctly", "error");
			chck1 = false;
		}

		if (form0.in_name.value == "") {
			swal("error", "Please enter reservation name correctly", "error");
			chck1 = false;
		}
		
		if (chck1 && chck2) {
			form0.action = "insertResv.jsp"
			form0.submit();
		}
	}

	function onlyNumber(event) {
		event = event || window.event;
		var keyID = (event.which) ? event.which : event.keyCode;
		if ((keyID >= 48 && keyID <= 57) || (keyID >= 96 && keyID <= 105)
				|| keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39
				|| keyID == 9)
			return;
		else
			return false;
	}

	function removeChar(event) {
		event = event || window.event;
		var keyID = (event.which) ? event.which : event.keyCode;
		if (keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39
				|| keyID == 9)
			return;
		else
			event.target.value = event.target.value.replace(/[^0-9]/g, "");
	}
</script>
<style>
html {
	color: black;
}

h2, h1 {
	color: #a35d6a;
}

input {
	border-radius: 10px;
}

#container {
	display: flex;
	flex-direction: row;
	justify-content: space-between;
}

tr {
	height: 35px;
}

.a {
	border: none;
	float: left;
	outline: none;
	color:#d4a162;
	background-color: black;
	padding-left: 10px;
}



</style>
</head>
<body bgcolor=white>

	<%
		request.setCharacterEncoding("UTF-8");

	Calendar cal = Calendar.getInstance();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	String now = sdf.format(cal.getTime());

	ResvService resvService = new ResvService();
	List<Reservation> resvList = resvService.selectAll();

	String room = request.getParameter("room");
	if (room == "" || room == null) {
		room = "0";
	}
	
	
	%>

	<br>
	<br>
	<hr width=500 color=#69491A>
	<h1 align=center><img src="./resv/roomlogo10.png" style="width: 55px">  K- Hotel Reservation </h1>
	<hr width=500 color=#69491A>

	<form name="form0" method="post">
		<table align=center>
			<!--border=1 border-color=white-->
			<colgroup>
				<col width=100>
				<col width=150>
				<col width=150>
			<tr>
				<th>Name</th>
				<td><input name="name" type="text" style="border:1px dotted #d3c09a ;padding-left: 10px;" required placeholder="name"></td>
				<td></td>
			</tr>

			<tr>
				<th>Room</th>
				<td colspan=2>
					<div id="container">
						<%
							if ("0".equals(room)) {
						%>
						<div>
							<input name="room" type="radio" style="border: 1px dotted #d3c09a;" value="1" required><label>Gold</label>
						</div>
						<div>
							<input name="room" type="radio" style="border: 1px dotted #d3c09a;" value="2" required><label>Silver</label>
						</div>
						<div>
							<input name="room" type="radio" style="border: 1px dotted #d3c09a;" value="3" required><label>Bronze</label>
						</div>
						<%
							} else if ("1".equals(room)) {
						%>
						<div style="color:#d4a162">
							<input name="room" type="radio" style="border: 1px dotted #d3c09a;" value="1" checked><label>Gold</label>
						</div>
						<div style="color:dimgray">
							<input name="room" type="radio" style="border: 1px dotted #d3c09a;" disabled><label>Silver</label>
						</div>
						<div style="color:dimgray">
							<input name="room" type="radio" style="border: 1px dotted #d3c09a;" disabled><label>Bronze</label>
						</div>
						<%
							} else if ("2".equals(room)) {
						%>
						<div style="color:dimgray">
							<input name="room" type="radio" style="border: 1px dotted #d3c09a;" disabled><label>Gold</label>
						</div>
						<div style="color:#d4a162">
							<input name="room" type="radio" style="border: 1px dotted #d3c09a;" value="2" checked><label>Silver</label>
						</div>
						<div style="color:dimgray">
							<input name="room" type="radio" style="border: 1px dotted #d3c09a;" disabled><label>Bronze</label>
						</div>
						<%
							} else if ("3".equals(room)) {
						%>
						<div style="color:dimgray">
							<input name="room" type="radio" style="border: 1px dotted #d3c09a;" disabled><label>Gold</label>
						</div>
						<div style="color:dimgray">
							<input name="room" type="radio" style="border: 1px dotted #d3c09a;" disabled><label>Silver</label>
						</div>
						<div style="color:#d4a162">
							<input name="room" type="radio" style="border: 1px dotted #d3c09a;" value="3" checked><label>Bronze</label>
						</div>
						<%
							}
						%>
						
					</div>
				</td>
			</tr>

			<tr>
				<th>Date</th>
				<td colspan=2>
				<%	
					if (request.getParameter("year") == null || request.getParameter("year") == "") {
						%>
						<input name="date" type="text" id="datepicker" style="border: 1px dotted #d3c09a; float: left; padding-left: 10px;" required placeholder="20200101" onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)'>
						<%
						// 이전 페이지에서 날짜를 선택하여 페이지를 넘어오는 경우
					} else {
						String year = request.getParameter("year");
						String month = request.getParameter("month");
						String day = request.getParameter("day");
						
						if (month.length() == 1) {
							if (day.length() == 1) {
								%>
								<input name="date" type="text" value="<%=year%>0<%=month%>0<%=day%>" class=a readonly>
								<%
							} else {
								%>
								<input name="date" type="text" value="<%=year%>0<%=month%><%=day%>" class=a readonly>
								<%
							}
						} else {
							if (day.length() == 1) {
								%>
								<input name="date" type="text" value="<%=year%><%=month%>0<%=day%>" class=a readonly>
								<%
							} else {
								%>
								<input name="date" type="text" value="<%=year%><%=month%><%=day%>" class=a readonly>
								<%
							}
						}
					}
				%>
				</td>
			</tr>

			<tr>
				<th>E-mail</th>
				<td colspan=2><input name="address" type="text" size="50" style="border: 1px dotted #d3c09a;padding-left: 10px;" required placeholder="e-mail address"></td>
			</tr>

			<tr>
				<th>Phone</th>
				<td colspan=2><input name="phone_num" type="text" size="50" style="border: 1px dotted #d3c09a;padding-left: 10px;" required placeholder="phone number" onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)'></td>
			</tr>

			<tr>
				<th>Booker</th>
				<td><input name="in_name" type="text" style="border: 1px dotted #d3c09a;padding-left: 10px;" required placeholder="booker name"></td>
				<td></td>
			</tr>

			<hr width=500 color=#d4a162>
			<tr>
				<th>Memo</th>
				<td colspan=2><input name="comment" type="text" size="50" style="border: 1px dotted #d3c09a;padding-left: 10px;"></td>
			</tr>
			
			

			<tr align="right">
				<td><input type="hidden" name="w_date" value=<%=now%>></td>
				<td colspan="2" height="50"><input type=button value="RESERVATIOM" onclick="check()" style="background-color: #d3c09a"> <input type=button onclick="javascript:history.back(-1)"
					value="CANCLE" style="background-color: #d9adad"></td>
			</tr>


		</table>
	</form>
	<div>
		<hr width=500 color=#d4a162>
	</div>
</body>
</html>