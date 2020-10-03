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
<link rel="stylesheet" href="/resources/demos/style.css" />
<script>
	$(function() {
		$("#datepicker").datepicker(
				{
					dateFormat : 'yymmdd',
					monthNamesShort : [ '1월', '2월', '3월', '4월', '5월', '6월',
							'7월', '8월', '9월', '10월', '11월', '12월' ],
					dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ],
					changeMonth : true, //월변경가능
					changeYear : true, //년변경가능
					showMonthAfterYear : true, //년 뒤에 월 표시
					beforeShowDay: disableAllTheseDays
				});
	});

	$(function() {
		$("#datepicker2").datepicker(
				{
					dateFormat : 'yymmdd',
					monthNamesShort : [ '1월', '2월', '3월', '4월', '5월', '6월',
							'7월', '8월', '9월', '10월', '11월', '12월' ],
					dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ],
					changeMonth : true, //월변경가능
					changeYear : true, //년변경가능
					showMonthAfterYear : true, //년 뒤에 월 표시
				});
	});
</script>
<script>
	function check() {
		
		var chck1 = true;
		if (form0.name.value == "") {
			alert("이름을 입력하여 주세요");
			chck1 = false;
		}
/*
		if (form0.room.value == "" || form0.room.value == null) {
			alert("원하시는 방을 선택해 주세요");
			chck1 = false;
		}
*/
		if (form0.date.value == "") {
			alert("주소를 입력하여 주세요");
			chck1 = false;
		}
		
		if (form0.address.value == "") {
			alert("주소를 입력하여 주세요");
			chck1 = false;
		}

		if (form0.phone_num.value == "") {
			alert("전화번호를 입력하여 주세요");
			chck1 = false;
		}

		if (form0.in_name.value == "") {
			alert("예약자 이름을 입력하여 주세요");
			chck1 = false;
		}
		
		var chck2 = true;
		if (form0.name.value.length > 4 || form0.name.value.length < 2) {
			alert("이름은 2~4자로 입력하여 주세요");
			chck2 = false;
		}

		if (chck1 && chck2) {
			form0.action = "insertResv.jsp"
			form0.submit();
		}
	}
</script>
<style>
html {
	color: white;
}

h2 {
	color: #d4a162;
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

h1 {
	color: #d4a162;
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
	%>

	<hr width=500 color=#d4a162>
	<h1 align=center>RESERVATION</h1>
	<hr width=500 color=#d4a162>

	<form name="form0" method="post">
		<table align=center>
			<!--border=1 border-color=white-->
			<colgroup>
				<col width=100>
				<col width=150>
				<col width=150>
			<tr>
				<td>NAME</td>
				<td><input name="name" type="text" style="border: none;"></td>
				<td></td>
			</tr>

			<tr>
				<td>ROOM No.</td>
				<td colspan=2>
					<div id="container">
						<div>
							<input name="room" type="radio" style="border: none;" value="1"><label>Gold</label>
						</div>
						<div>
							<input name="room" type="radio" style="border: none;" value="2"><label>Silver</label>
						</div>
						<div>
							<input name="room" type="radio" style="border: none;" value="3"><label>Bronze</label>
						</div>
					</div>
				</td>
			</tr>

			<tr>
				<td>DATE</td>
				<td colspan=2><input name="date" type="text" id="datepicker" style="border: none; float: left"></td>
			</tr>

			<tr>
				<td>ADDRESS</td>
				<td colspan=2><input name="address" type="text" size="50" style="border: none;"></td>
			</tr>

			<tr>
				<td>PHONE</td>
				<td colspan=2><input name="phone_num" type="text" size="50" style="border: none;"></td>
			</tr>

			<tr>
				<td>BOOKER</td>
				<td><input name="in_name" type="text" style="border: none;"></td>
				<td></td>
			</tr>

			<tr>
				<td>MEMO</td>
				<td colspan=2><input name="comment" type="text" size="50" style="border: none;"></td>
			</tr>

			<tr align="right">
				<td><input type="hidden" name="w_date" value=<%=now%>></td>
				<td colspan="2" height="50"><input type=button value="등록" onclick="check()"> <input type=button onclick="javascript:history.back(-1)"
					value="취소"></td>
			</tr>
		</table>
	</form>
	<div>
		<hr width=500 color=#d4a162>
	</div>
</body>
</html>