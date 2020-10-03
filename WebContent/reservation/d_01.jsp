<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.text.*,java.util.*"%>
<%@ page import="java.sql.*, javax.sql.*, java.io.*, domain3.*, service3.*, dao3.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
a:link {
	font-family: "";
	font-size: 14pt;
	text-decoration: none;
	color: darkblue
}

a:visited {
	font-family: "";
	font-size: 14pt;
	text-decoration: none;
	color: darkblue
}

a:hover {
	font-family: "";
	font-size: 14pt;
	text-decoration: none;
	color: crimson
}

.header {
	text-decoration: none;
}

#day {
	color: white;
	font-size: 20px;
	width: 100;
}

tr {
	height: 80px;
	color: midnightblue;
	font-weight: bold;
}

#date:hover {
	background: #dbe3e5;
}

body .btn-bg {
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
}

body .btn-bg.bg-1 .btn-1 button {
	color: #69491A;
	background: transparent;
	border: 3px solid #69491A;
	border-radius: 15px;
	-webkit-transition: all 0.5s ease;
	transition: all 0.5s ease;
	-webkit-transform: translate(0, 0);
	transform: translate(0, 0);
}

body .btn-bg.bg-1 .btn-1 button a {
	color: #c7f8f9;
}

body .btn-bg.bg-1 .btn-1 button:hover {
	background: #white;
	color: #86c4ba;
	border: 3px solid #86c4ba;
	-webkit-transition: all 0.35s ease;
	transition: all 0.35s ease;
}

body .btn-bg.bg-1 .btn-1 button:active {
	-webkit-transform: translate(5px, 5px);
	transform: translate(5px, 5px);
}

button {
	cursor: pointer;
	overflow: hidden;
	outline: none;
	color: #84a9ac;
	position: relative;
	padding: 0.1rem 0.5rem 0.1rem 0.5rem;
	font-size: 1rem;
}

h1 {
	color: #aa4a30;
}

#logo {
	width: 25px;
}

#logo:hover {
	content: url('./resv/roomlogo7.png');
}

.roomName {
	color: #1b262c;
	font-size: 10px;
}
</style>
<%
	int year;
	int month;
	Calendar today = Calendar.getInstance();
	Calendar cal = new GregorianCalendar();
	
	// 받아온 year값을 정수형으로 변환시켜 준다
	year = (request.getParameter("year") == null) ? today.get(Calendar.YEAR) : Integer.parseInt(request.getParameter("year").trim());
	
	// month는 0~11까지라서 +1 해줘야한다
	month = (request.getParameter("month") == null) ? today.get(Calendar.MONTH) + 1 : Integer.parseInt(request.getParameter("month").trim());
	
	if (month <= 0) {
		month = 12;
		year = year - 1;
	} else if (month >= 13) {
		month = 1;
		year = year + 1;
	}
	cal.set(Calendar.YEAR, year);
	cal.set(Calendar.MONTH, (month - 1));
	cal.set(Calendar.DATE, 1);
%>
</head>
<body bgcolor=white>
	<br>
	<br>
	<hr width=500 color=#69491A>
	<h1 align=center><img src="./resv/roomlogo10.png" style="width: 55px">  K- Hotel Reservation </h1>
	<hr width=500 color=#69491A>

	<table align="center" border=0 cellpadding=0>
		<colgroup>
			<col width=100>
			<col width=100>
			<col width=100>
			<col width=100>
			<col width=100>
			<col width=100>
			<col width=100>
		</colgroup>
		
		<!-- # 월 출력 부분 -->
		<tr class="header" height=50>
			<td></td>
			<td></td>
			<td align="center" height='20' valign='center' colspan="3">
				<%
					if (month <= (today.get(Calendar.MONTH) + 1)) {
				%> <font color=69491A style="font-size: 30px">◀</font> <%
 				} else {
				%> <a href='d_01.jsp?year=<%=cal.get(Calendar.YEAR)%>&month=<%=((cal.get(Calendar.MONTH) + 1) - 1)%>'> <font color='#69491A'
					style="font-size: 30px">◀</font>
				</a> <%
 				}
				%> <font color='#69491A' style="font-size: 40px"><%=cal.get(Calendar.YEAR)%> - <%=(cal.get(Calendar.MONTH) + 1)%></font> <%
					if (month > (today.get(Calendar.MONTH) + 1)) {
				%> <font color=black style="font-size: 30px">▶</font> <%
					} else {
				%> <a href='d_01.jsp?year=<%=cal.get(Calendar.YEAR)%>&month=<%=((cal.get(Calendar.MONTH) + 1) + 1)%>'> <font color='#69491A'
					style="font-size: 30px">▶</font>
				</a> <%
 				}
				%>
			</td>
			<td colspan=2 align=center>
				<table cellpadding=0 cellspacing=0>
					<colgroup>
						<col width=60>
						<col width=60>
						<col width=60>
					<tr align=center style="height: 30px">
						<td><a href=../room/a_01.html><img src="./resv/roomlogo1.png" style="width: 30px"> </a></td>
						<td><a href=../room/a_02.html><img src="./resv/roomlogo1.png" style="width: 30px"> </a></td>
						<td><a href=../room/a_03.html><img src="./resv/roomlogo1.png" style="width: 30px"> </a></td>
					</tr>
					<tr align=center style="height: 10px">
						<td><span class=roomName>GOLD</span></td>
						<td><span class=roomName>SILVER</span></td>
						<td><span class=roomName>BRONZE</span></td>
					</tr>
				</table>
			</td>
		</tr>
		<!-- 요일의 시작 -->
		<tr align="center" bgcolor="797a7e" style="height: 50px">
			<td bgcolor='9cada4' id="day">SUN</td>
			<td id="day">MON</td>
			<td id="day">TUE</td>
			<td id="day">WED</td>
			<td id="day">THU</td>
			<td id="day">FRI</td>
			<td bgcolor='9cada4' id="day">SAT</td>
		</tr>

		<!-- 달력의 시작 -->
		<%
		cal.set(year, month - 1, 1);
		int dayOfWeek = cal.get(Calendar.DAY_OF_WEEK);
		%>
		<tr align="right" valign="top" bgcolor="e3e3e3">
			<%
				for (int i = 1; i < dayOfWeek; i++) {
			%>
			<td align="right" valign="top" bgcolor="white"></td>
			<%
				}

			// 달력에 날짜 입력
			for (int i = 1; i <= cal.getActualMaximum(Calendar.DAY_OF_MONTH); i++) {
			String calDay = "";
			if (i < 10) {
				calDay = "0" + Integer.toString(i);
			} else {
				calDay = Integer.toString(i);
			}

			ResvService resvService = new ResvService();
			ResvDao resvDao = new ResvDao();

			String calYear = Integer.toString(cal.get(Calendar.YEAR));
			String calMonth = "";

			if ((cal.get(Calendar.MONTH) + 1) < 10) {
				calMonth = "0" + Integer.toString((cal.get(Calendar.MONTH) + 1));
			} else {
				calMonth = Integer.toString((cal.get(Calendar.MONTH) + 1));
			}

			String resv_date = calYear + "-" + calMonth + "-" + calDay;

			if (month == (today.get(Calendar.MONTH) + 1)) {
				if (i < today.get(Calendar.DATE)) {
					// 토요일일 경우의 출력
					if ((dayOfWeek - 1 + i) % 7 == 0) {
			%>
			<td id="date" bgcolor='e0ece4'><%=i%>
				<div class="btn-bg bg-1">
					<div class="btn btn-1">
						<button style="visibility: hidden"></button>
					</div>
				</div></td>
			<%
				// 일요일일 경우의 출력
			} else if ((dayOfWeek - 1 + i) % 7 == 1) {
			%>
			<td id="date" bgcolor=e0ece4><%=i%>
				<div class="btn-bg bg-1">
					<div class="btn btn-1">
						<button style="visibility: hidden"></button>
					</div>
				</div></td>
			<%
				// 일반적인 출력
			} else {
			%>
			<td id="date"><%=i%>
				<div class="btn-bg bg-1">
					<div class="btn btn-1">
						<button style="visibility: hidden"></button>
					</div>
				</div></td>
			<%
				}
			// 한 주가 끝나면 개행
			if ((dayOfWeek - 1 + i) % 7 == 0) {
			%>
		</tr>
		<tr align="right" valign="top" bgcolor="e3e3e3">
			<%
				}
			} else {
			// 토요일일 경우의 출력
			if ((dayOfWeek - 1 + i) % 7 == 0) {
			%>
			<td id="date" bgcolor='e0ece4'><%=i%>
				<div class="btn-bg bg-1">
					<div class="btn btn-1">
						<%
							if (0 != resvDao.selectOne(resv_date, 1).getProcessing() && 0 != resvDao.selectOne(resv_date, 2).getProcessing()
								&& 0 != resvDao.selectOne(resv_date, 3).getProcessing()) {
						%>
						<button style="visibility: hidden; height: 30px"></button>
						<%
							} else {
						%>
						<button onclick="location.href='d_02.jsp?year=<%=cal.get(Calendar.YEAR)%>&month=<%=(cal.get(Calendar.MONTH) + 1)%>&day=<%=i%>'">Check-in</button>
						<%
							}
						%>
					</div>
				</div>

				<div align=center>
					<%
						if (0 == resvDao.selectOne(resv_date, 1).getProcessing()) {
					%>
					<a href='d_02.jsp?year=<%=calYear%>&month=<%=calMonth%>&day=<%=calDay%>&room=1'> <img src="./resv/roomlogo1.png" id=logo>
					</a>
					<%
						} else {
					%>
					<img src="./resv/roomlogo5.png" style="width: 25px">
					<%
						}
					%>
					<%
						if (0 == resvDao.selectOne(resv_date, 2).getProcessing()) {
					%>
					<a href='d_02.jsp?year=<%=calYear%>&month=<%=calMonth%>&day=<%=calDay%>&room=2'> <img src="./resv/roomlogo1.png" id=logo>
					</a>
					<%
						} else {
					%>
					<img src="./resv/roomlogo5.png" style="width: 25px">
					<%
						}
					%>
					<%
						if (0 == resvDao.selectOne(resv_date, 3).getProcessing()) {
					%>
					<a href='d_02.jsp?year=<%=calYear%>&month=<%=calMonth%>&day=<%=calDay%>&room=3'> <img src="./resv/roomlogo1.png" id=logo>
					</a>
					<%
						} else {
					%>
					<img src="./resv/roomlogo5.png" style="width: 25px">
					<%
						}
					%>
				</div></td>
			<%
				// 일요일일 경우의 출력
			} else if ((dayOfWeek - 1 + i) % 7 == 1) {
			%>
			<td id="date" bgcolor=e0ece4><%=i%>
				<div class="btn-bg bg-1">
					<div class="btn btn-1">
						<%
							if (0 != resvDao.selectOne(resv_date, 1).getProcessing() && 0 != resvDao.selectOne(resv_date, 2).getProcessing()
								&& 0 != resvDao.selectOne(resv_date, 3).getProcessing()) {
						%>
						<button style="visibility: hidden; height: 30px"></button>
						<%
							} else {
						%>
						<button onclick="location.href='d_02.jsp?year=<%=cal.get(Calendar.YEAR)%>&month=<%=(cal.get(Calendar.MONTH) + 1)%>&day=<%=i%>'">Check-in</button>
						<%
							}
						%>
					</div>
				</div>

				<div align=center>
					<%
						if (0 == resvDao.selectOne(resv_date, 1).getProcessing()) {
					%>
					<a href='d_02.jsp?year=<%=calYear%>&month=<%=calMonth%>&day=<%=calDay%>&room=1'> <img src="./resv/roomlogo1.png" id=logo>
					</a>
					<%
						} else {
					%>
					<img src="./resv/roomlogo5.png" style="width: 25px">
					<%
						}
					if (0 == resvDao.selectOne(resv_date, 2).getProcessing()) {
					%>
					<a href='d_02.jsp?year=<%=calYear%>&month=<%=calMonth%>&day=<%=calDay%>&room=2'> <img src="./resv/roomlogo1.png" id=logo>
					</a>
					<%
						} else {
					%>
					<img src="./resv/roomlogo5.png" style="width: 25px">
					<%
						}
					if (0 == resvDao.selectOne(resv_date, 3).getProcessing()) {
					%>
					<a href='d_02.jsp?year=<%=calYear%>&month=<%=calMonth%>&day=<%=calDay%>&room=3'> <img src="./resv/roomlogo1.png" id=logo>
					</a>
					<%
						} else {
					%>
					<img src="./resv/roomlogo5.png" style="width: 25px">
					<%
						}
					%>
				</div></td>
			<%
				// 일반적인 출력
			} else {
			%>
			<td id="date"><%=i%>
				<div class="btn-bg bg-1">
					<div class="btn btn-1">
						<%
							if (0 != resvDao.selectOne(resv_date, 1).getProcessing() && 0 != resvDao.selectOne(resv_date, 2).getProcessing()
								&& 0 != resvDao.selectOne(resv_date, 3).getProcessing()) {
						%>
						<button style="visibility: hidden; height: 30px"></button>
						<%
							} else {
						%>
						<button onclick="location.href='d_02.jsp?year=<%=cal.get(Calendar.YEAR)%>&month=<%=(cal.get(Calendar.MONTH) + 1)%>&day=<%=i%>'">Check-in</button>
						<%
							}
						%>
					</div>
				</div>

				<div align=center>
					<%
						if (0 == resvDao.selectOne(resv_date, 1).getProcessing()) {
					%>
					<a href='d_02.jsp?year=<%=calYear%>&month=<%=calMonth%>&day=<%=calDay%>&room=1'> <img src="./resv/roomlogo1.png" id=logo>
					</a>
					<%
						} else {
					%>
					<img src="./resv/roomlogo5.png" style="width: 25px">
					<%
						}
					%>
					<%
						if (0 == resvDao.selectOne(resv_date, 2).getProcessing()) {
					%>
					<a href='d_02.jsp?year=<%=calYear%>&month=<%=calMonth%>&day=<%=calDay%>&room=2'> <img src="./resv/roomlogo1.png" id=logo>
					</a>
					<%
						} else {
					%>
					<img src="./resv/roomlogo5.png" style="width: 25px">
					<%
						}
					%>
					<%
						if (0 == resvDao.selectOne(resv_date, 3).getProcessing()) {
					%>
					<a href='d_02.jsp?year=<%=calYear%>&month=<%=calMonth%>&day=<%=calDay%>&room=3'> <img src="./resv/roomlogo1.png" id=logo>
					</a>
					<%
						} else {
					%>
					<img src="./resv/roomlogo5.png" style="width: 25px">
					<%
						}
					%>
				</div></td>
			<%
				}
			// 한 주가 끝나면 개행
			if ((dayOfWeek - 1 + i) % 7 == 0) {
			%>
		</tr>
		<tr align="right" valign="top" bgcolor="e3e3e3">
			<%
				}
			}
			} else {
			// 토요일일 경우의 출력
			if ((dayOfWeek - 1 + i) % 7 == 0) {
			%>
			<td id="date" bgcolor='e0ece4'><%=i%>
				<div class="btn-bg bg-1">
					<div class="btn btn-1">
						<%
							if (0 != resvDao.selectOne(resv_date, 1).getProcessing() && 0 != resvDao.selectOne(resv_date, 2).getProcessing()
								&& 0 != resvDao.selectOne(resv_date, 3).getProcessing()) {
						%>
						<button style="visibility: hidden; height: 30px"></button>
						<%
							} else {
						%>
						<button onclick="location.href='d_02.jsp?year=<%=cal.get(Calendar.YEAR)%>&month=<%=(cal.get(Calendar.MONTH) + 1)%>&day=<%=i%>'">Check-in</button>
						<%
							}
						%>
					</div>
				</div>

				<div align=center>
					<%
						if (0 == resvDao.selectOne(resv_date, 1).getProcessing()) {
					%>
					<a href='d_02.jsp?year=<%=calYear%>&month=<%=calMonth%>&day=<%=calDay%>&room=1'> <img src="./resv/roomlogo1.png" id=logo>
					</a>
					<%
						} else {
					%>
					<img src="./resv/roomlogo5.png" style="width: 25px">
					<%
						}
					%>
					<%
						if (0 == resvDao.selectOne(resv_date, 2).getProcessing()) {
					%>
					<a href='d_02.jsp?year=<%=calYear%>&month=<%=calMonth%>&day=<%=calDay%>&room=2'> <img src="./resv/roomlogo1.png" id=logo>
					</a>
					<%
						} else {
					%>
					<img src="./resv/roomlogo5.png" style="width: 25px">
					<%
						}
					%>
					<%
						if (0 == resvDao.selectOne(resv_date, 3).getProcessing()) {
					%>
					<a href='d_02.jsp?year=<%=calYear%>&month=<%=calMonth%>&day=<%=calDay%>&room=3'> <img src="./resv/roomlogo1.png" id=logo>
					</a>
					<%
						} else {
					%>
					<img src="./resv/roomlogo5.png" style="width: 25px">
					<%
						}
					%>
				</div></td>
			<%
				// 일요일일 경우의 출력
			} else if ((dayOfWeek - 1 + i) % 7 == 1) {
			%>
			<td id="date" bgcolor='e0ece4'><%=i%>
				<div class="btn-bg bg-1">
					<div class="btn btn-1">
						<%
							if (0 != resvDao.selectOne(resv_date, 1).getProcessing() && 0 != resvDao.selectOne(resv_date, 2).getProcessing()
								&& 0 != resvDao.selectOne(resv_date, 3).getProcessing()) {
						%>
						<button style="visibility: hidden; height: 30px"></button>
						<%
							} else {
						%>
						<button onclick="location.href='d_02.jsp?year=<%=cal.get(Calendar.YEAR)%>&month=<%=(cal.get(Calendar.MONTH) + 1)%>&day=<%=i%>'">Check-in</button>
						<%
							}
						%>
					</div>
				</div>

				<div align=center>
					<%
						if (0 == resvDao.selectOne(resv_date, 1).getProcessing()) {
					%>
					<a href='d_02.jsp?year=<%=calYear%>&month=<%=calMonth%>&day=<%=calDay%>&room=1'> <img src="./resv/roomlogo1.png" id=logo>
					</a>
					<%
						} else {
					%>
					<img src="./resv/roomlogo5.png" style="width: 25px">
					<%
						}
					if (0 == resvDao.selectOne(resv_date, 2).getProcessing()) {
					%>
					<a href='d_02.jsp?year=<%=calYear%>&month=<%=calMonth%>&day=<%=calDay%>&room=2'> <img src="./resv/roomlogo1.png" id=logo>
					</a>
					<%
						} else {
					%>
					<img src="./resv/roomlogo5.png" style="width: 25px">
					<%
						}
					if (0 == resvDao.selectOne(resv_date, 3).getProcessing()) {
					%>
					<a href='d_02.jsp?year=<%=calYear%>&month=<%=calMonth%>&day=<%=calDay%>&room=3'> <img src="./resv/roomlogo1.png" id=logo>
					</a>
					<%
						} else {
					%>
					<img src="./resv/roomlogo5.png" style="width: 25px">
					<%
						}
					%>
				</div></td>
			<%
				// 일반적인 출력
			} else {
			%>
			<td id="date"><%=i%>
				<div class="btn-bg bg-1">
					<div class="btn btn-1">
						<%
							if (0 != resvDao.selectOne(resv_date, 1).getProcessing() && 0 != resvDao.selectOne(resv_date, 2).getProcessing()
								&& 0 != resvDao.selectOne(resv_date, 3).getProcessing()) {
						%>
						<button style="visibility: hidden; height: 30px"></button>
						<%
							} else {
						%>
						<button onclick="location.href='d_02.jsp?year=<%=cal.get(Calendar.YEAR)%>&month=<%=(cal.get(Calendar.MONTH) + 1)%>&day=<%=i%>'">Check-in</button>
						<%
							}
						%>
					</div>
				</div>

				<div align=center>
					<%
						if (0 == resvDao.selectOne(resv_date, 1).getProcessing()) {
					%>
					<a href='d_02.jsp?year=<%=calYear%>&month=<%=calMonth%>&day=<%=calDay%>&room=1'> <img src="./resv/roomlogo1.png" id=logo>
					</a>
					<%
						} else {
					%>
					<img src="./resv/roomlogo5.png" style="width: 25px">
					<%
						}
					%>
					<%
						if (0 == resvDao.selectOne(resv_date, 2).getProcessing()) {
					%>
					<a href='d_02.jsp?year=<%=calYear%>&month=<%=calMonth%>&day=<%=calDay%>&room=2'> <img src="./resv/roomlogo1.png" id=logo>
					</a>
					<%
						} else {
					%>
					<img src="./resv/roomlogo5.png" style="width: 25px">
					<%
						}
					%>
					<%
						if (0 == resvDao.selectOne(resv_date, 3).getProcessing()) {
					%>
					<a href='d_02.jsp?year=<%=calYear%>&month=<%=calMonth%>&day=<%=calDay%>&room=3'> <img src="./resv/roomlogo1.png" id=logo>
					</a>
					<%
						} else {
					%>
					<img src="./resv/roomlogo5.png" style="width: 25px">
					<%
						}
					%>
				</div></td>
			<%
				}
			// 한 주가 끝나면 개행
			if ((dayOfWeek - 1 + i) % 7 == 0) {
			%>
		</tr>
		<tr align="right" valign="top" bgcolor="e3e3e3">
			<%
				}
			}
			}
			%>
		</tr>
	</table>
</body>
</html>