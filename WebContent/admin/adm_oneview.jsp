<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.text.*,java.util.*"%>
<%@ page import="java.sql.*, javax.sql.*, java.io.*, domain3.*, service3.*, dao3.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.0/themes/base/jquery-ui.css" />
<script src="http://code.jquery.com/jquery-1.8.3.js"></script>
<script src="http://code.jquery.com/ui/1.10.0/jquery-ui.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<link rel="stylesheet" href="/resources/demos/style.css" />
<style>
html {
	color: black;
}

h2, h1 {
	color: #69491A;
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
	color: #69491A;
	background-color: black;
}
</style>
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

	function check() {
		var chck1 = true;
		var chck2 = true;
		if (form0.name.value == "") {
			swal("Please enter your name correctly", "이름을 입력하여 주세요", "Error");
			chck1 = false;
		} else {
			if (form0.name.value.length > 5 || form0.name.value.length < 2) {
				swal("Error", "이름을 2~4 글자로 입력해 주세요", "Error");
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
			swal("Error", "Please enter your address correctly", "Error");
			chck1 = false;
		}

		if (form0.phone_num.value == "") {
			swal("Error", "Please enter your phone-number correctly", "Error");
			chck1 = false;
		}

		if (form0.in_name.value == "") {
			swal("Error", "Please enter reservation name correctly", "Error");
			chck1 = false;
		}
		
		if (chck1 && chck2) {
			form0.action = "../reservation/updateResv.jsp"
			form0.submit();
		}
	}

	// 숫자만 입력 받기
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

	// 숫자만 입력 받기2
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
<script>

function delete() {
	form0.action = "../reservation/deleteResv.jsp"
	form0.submit();	
}

</script>
</head>
<body bgcolor=#FFEEE4>
	<%
		request.setCharacterEncoding("UTF-8");

	Calendar cal = Calendar.getInstance();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	String now = sdf.format(cal.getTime());

	String year = request.getParameter("year");
	String month = request.getParameter("month");
	String day = request.getParameter("day");
	int room = Integer.parseInt(request.getParameter("room"));

	String date = year + "-" + month + "-" + day;

	ResvService resvService = new ResvService();
	ResvDao resvDao = new ResvDao();

	Reservation reservation = resvDao.selectOne(date, room);

	%>
	<br>
	<br>
	<hr width=500 color=#69491A>
	<h1 align=center>RESERVATION</h1>
	<hr width=500 color=#69491A>

	<form name="form0" method="post">
		<table align=center>
			<!--border=1 border-color=white-->
			<colgroup>
				<col width=100>
				<col width=150>
				<col width=150>
			<tr>
				<td>NAME</td>
				<td><input name="name" type="text" style="border: none;padding-left: 10px;" required value="<%=reservation.getName()%>"></td>
				<!-- 수정할때, date와 room으로 조회하기때문에 hidden으로 숨겨서 값을 둔다 -->
				<td><input type="hidden" name="preDate" value=<%=date%>><input type="hidden" name="preRoom" value=<%=room%>></td>
			</tr>

			<tr>
				<td>ROOM No.</td>
				<td colspan=2>
					<div id="container">
						<%
							if (1 == reservation.getRoom()) {
						%>
						<div>
							<input name="room" type="radio" style="border: none;padding-left: 10px;" value="1" checked><label>Gold</label>
						</div>
						<div>
							<input name="room" type="radio" style="border: none;padding-left: 10px;" value="2"><label>Silver</label>
						</div>
						<div>
							<input name="room" type="radio" style="border: none;padding-left: 10px;" value="3"><label>Bronze</label>
						</div>
						<%
							} else if (2 == reservation.getRoom()) {
						%>
						<div>
							<input name="room" type="radio" style="border: none;padding-left: 10px;" value="1"><label>Gold</label>
						</div>
						<div>
							<input name="room" type="radio" style="border: none;padding-left: 10px;" value="2" checked><label>Silver</label>
						</div>
						<div>
							<input name="room" type="radio" style="border: none;padding-left: 10px;" value="3"><label>Bronze</label>
						</div>
						<%
							} else if (3 == reservation.getRoom()) {
						%>
						<div>
							<input name="room" type="radio" style="border: none;padding-left: 10px;" value="1"><label>Gold</label>
						</div>
						<div>
							<input name="room" type="radio" style="border: none;padding-left: 10px;" value="2"><label>Silver</label>
						</div>
						<div>
							<input name="room" type="radio" style="border: none;padding-left: 10px;" value="3" checked><label>Bronze</label>
						</div>
						<%
							}
						%>
					</div>
				</td>
			</tr>

			<tr>
				<td>DATE</td>
				<%
				String[] resvDate = reservation.getDate().split("-");
				String resvYear = resvDate[0];				
				String resvMonth = resvDate[1];				
				String resvDay = resvDate[2];				
				%>
				<td colspan=2><input name="date" type="text" id="datepicker" style="border: none; float: left;padding-left: 10px;" required
					value="<%=resvYear + resvMonth + resvDay%>" onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)'></td>
			</tr>

			<tr>
				<td>ADDRESS</td>
				<td colspan=2><input name="address" type="text" size="50" style="border: none;padding-left: 10px;" required value="<%=reservation.getAddress()%>"></td>
			</tr>

			<tr>
				<td>PHONE</td>
				<td colspan=2><input name="phone_num" type="text" size="50" style="border: none;padding-left: 10px;" required value="<%=reservation.getPhone_num()%>"
					onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)'></td>
			</tr>

			<tr>
				<td>BOOKER</td>
				<td><input name="in_name" type="text" style="border: none;padding-left: 10px;" required value="<%=reservation.getIn_name()%>"></td>
				<td></td>
			</tr>

			<tr>
				<td>MEMO</td>
				<td colspan=2><input name="comment" type="text" size="50" style="border: none;padding-left: 10px;" value="<%=reservation.getComment()%>"></td>
			</tr>

			<tr align="right">
				<td>
				<input type="hidden" name="w_date" value=<%=now%>></td>
				<td>
				<div align=left>
				<input type=submit value="삭제하기" onclick="javascript: form0.action='../reservation/deleteResv.jsp'" style="background-color: lightcoral">
				<!--  
				<input type=button value="CANCLE" onclick="javascript:history.back(-1)" style="background-color: lightcoral">
				-->
				<input type=button value="수정하기" onclick="check()" style="background-color: lightskyblue">
				</div>
			</tr>


		</table>
	</form>
	<div>
		<hr width=500 color=#69491A>
	</div>
</body>
</html>