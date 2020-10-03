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
	font-size: 10pt;
	text-decoration: none;
	color: darkblue
}

a:visited {
	font-family: "";
	font-size: 10pt;
	text-decoration: none;
	color: darkblue
}

a:hover {
	font-family: "";
	font-size: 10pt;
	text-decoration: none;
	color: crimson
}

.header {
	text-decoration: none;
	height: 80px;
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

h1 {
	color: #69491A;
}

.roomName {
	color: #69491A;
	font-size: 10px;
}


</style>
<%
	String loginOK = null;

// 로그인이 되면 이 페이지로 다시 돌아올 수 있도록 써준다
String jumpURL = "login.jsp?jump=adm_allview.jsp";

//먼저 세션에 “login_ok”이라는 키로 쓰여진 값이 있는지 읽어옴
// 해당 값이 null이거나  yes가 아닌 경우 로그인 페이지(adm_login.jsp)로 이동 -> login.jsp?jump=null
// 이동시 현재 페이지의 URL을 매개변수로 넘겨줌

loginOK = (String) session.getAttribute("login_ok");
if (loginOK == null) {
	response.sendRedirect(jumpURL);
	return;
}

if (!loginOK.equals("yes")) {
	response.sendRedirect(jumpURL);
	return;
}

request.setCharacterEncoding("UTF-8");

// # 캐시 제어를 위한 응답 헤더
// 데이터가 변경되었음에도 불구하고 웹 브라우저가 변경된 내역을 출력되지 않는 경우 → 실제 서버가 생성한 결과를 출력하지 않고 캐시에 저장된 데이터를 출력하기 때문
// 그러나, 게시판과 같이 내용이 자주 변경되는 사이트는 웹 브라우저 캐시가 적용되면 사용자는 변경된 내용을 확인할 수 없다.
// HTTP는 특수한 응답 헤더를 통해서 웹 브라우저가 응답 결과를 캐시 할 것인지에 대한 설정을 할 수 있다.
// - Cache-control 응답헤더 : HTTP 1.1 버전에서 지원하는 헤더, 값을 'no-cache'로 지정하면 캐시에 저장하지 않는다.
// - Pragma 응답헤더 :HTTP 1.0 버전에서 지원하는 헤더, 값을 'no-cache'로 지정하면 캐시에 저장하지 않는다.
// - addHeader(String name, String value) → name 헤더에 value를 값으로 추가한다.
// - setIntHeader(String name, String/int value) → name 헤더의 값을 정수 값 value로 지정한다

response.setHeader("cache-control","no-store, no-cache, must-revalidate");
response.addHeader("Cache-Control", "post-check=0, pre-check=0"); 

response.setHeader("expires","0");
response.setHeader("pragma","no-cache");

int year;
int month;
Calendar today = Calendar.getInstance(); // 현재 날짜와 시간
Calendar cal = new GregorianCalendar();

//삼항연산자를 이용: (조건)?(피연산자1):(피연산자2)  -> 조건이 참이면 피연산자1, 조건이 거짓이면 피연산자2
year = (request.getParameter("year") == null) ? today.get(Calendar.YEAR) : Integer.parseInt(request.getParameter("year").trim());
month = (request.getParameter("month") == null) ? today.get(Calendar.MONTH) + 1 : Integer.parseInt(request.getParameter("month").trim());

// 해 넘어갈때 년도 바꿔주기 : - 값이 나오는경우, 13개월이상 되는 경우
if (month <= 0) {
	month = 12;
	year = year - 1;
} else if (month >= 13) {
	month = 1;
	year = year + 1;
}

// cal에 내가 출력하고자하는 달의 년,월,일을 세팅해준다
cal.set(Calendar.YEAR, year);
cal.set(Calendar.MONTH, (month - 1));
cal.set(Calendar.DATE, 1);
%>
</head>

<body bgcolor=white>
	<br>
	<br>
	<hr width=800 color=#69491A>
	<h1 align=center>RESERVATION STATUS for Administrator</h1>
	<hr width=800 color=#69491A>

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
		<!-- 월 출력 부분 -->
		<tr class="header" height=50>
			<td></td>
			<td></td>
			<!-- align은 넓이를 기준, valign은 높이를 기준 -->>
			<td align="center" height='20' valign='center' colspan="3">
				<%
					if (month <= (today.get(Calendar.MONTH) + 1)) {
				%> <font color=69491A style="font-size: 30px">◀</font> <%
				 	} else {
				 %> <a href='adm_allview.jsp?year=<%=cal.get(Calendar.YEAR)%>&month=<%=((cal.get(Calendar.MONTH) + 1) - 1)%>'> <font color='#69491A'
									style="font-size: 30px">◀</font>
							</a> <%
				 	}
				 %> <font color='#69491A' style="font-size: 40px"><%=cal.get(Calendar.YEAR)%> / <%=(cal.get(Calendar.MONTH) + 1)%></font> <%
				 	if (month > (today.get(Calendar.MONTH) + 1)) {
				 %> <font color=black style="font-size: 30px">▶</font> <%
				 	} else {
				 %> <a href='adm_allview.jsp?year=<%=cal.get(Calendar.YEAR)%>&month=<%=((cal.get(Calendar.MONTH) + 1) + 1)%>'> <font color='#69491A'
					style="font-size: 30px">▶</font>
					</a> <%
				 	}
				 %>
			</td>
		</tr>
		
		<!-- 요일 넣어주기  -->
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
		//DAY_OF_WEEK 요일을 의미하며 1~7리턴
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
			// getMaximum은 Calender자체가 최대로 가질수 있는 값,  getActualMaximum는 날짜가 셋팅 된 Calender가 가질수 있는 최대값
			for (int i = 1; i <= cal.getActualMaximum(Calendar.DAY_OF_MONTH); i++) {
			String calDay = "";
			if (i < 10) {			// 10보다 작은 숫자는 앞에다 0붙여주자  ex) 09
				calDay = "0" + Integer.toString(i);
			} else {
				calDay = Integer.toString(i);
			}

			// Service와 Dao 불러오기 
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

				<div align=center>
					<%
						if (1 == resvDao.selectOne(resv_date, 1).getProcessing()) {
					%>
					<a href='adm_oneview.jsp?year=<%=calYear%>&month=<%=calMonth%>&day=<%=calDay%>&room=1'> <%=resvDao.selectOne(resv_date, 1).getIn_name()%> </a><br>
					<%
						} else {
					%>
					-<br>
					<%
						}
					%>
					<%
						if (1 == resvDao.selectOne(resv_date, 2).getProcessing()) {
					%>
					<a href='adm_oneview.jsp?year=<%=calYear%>&month=<%=calMonth%>&day=<%=calDay%>&room=2'> <%=resvDao.selectOne(resv_date, 2).getIn_name()%> </a><br>
					<%
						} else {
					%>
					-<br>
					<%
						}
					%>
					<%
						if (1 == resvDao.selectOne(resv_date, 3).getProcessing()) {
					%>
					<a href='adm_oneview.jsp?year=<%=calYear%>&month=<%=calMonth%>&day=<%=calDay%>&room=3'> <%=resvDao.selectOne(resv_date, 3).getIn_name()%> </a>
					<%
						} else {
					%>
					-<br>
					<%
						}
					%>
				</div></td>
			<%
				// 일요일일 경우의 출력
			} else if ((dayOfWeek - 1 + i) % 7 == 1) {
			%>
			<td id="date" bgcolor=e0ece4><%=i%>

				<div align=center>
					<%
						if (1 == resvDao.selectOne(resv_date, 1).getProcessing()) {
					%>
					<a href='adm_oneview.jsp?year=<%=calYear%>&month=<%=calMonth%>&day=<%=calDay%>&room=1'> <%=resvDao.selectOne(resv_date, 1).getIn_name()%> </a><br>
					<%
						} else {
					%>
					-<br>
					<%
						}
					if (1 == resvDao.selectOne(resv_date, 2).getProcessing()) {
					%>
					<a href='adm_oneview.jsp?year=<%=calYear%>&month=<%=calMonth%>&day=<%=calDay%>&room=2'> <%=resvDao.selectOne(resv_date, 2).getIn_name()%> </a><br>
					<%
						} else {
					%>
					-<br>
					<%
						}
					if (1 == resvDao.selectOne(resv_date, 3).getProcessing()) {
					%>
					<a href='adm_oneview.jsp?year=<%=calYear%>&month=<%=calMonth%>&day=<%=calDay%>&room=3'> <%=resvDao.selectOne(resv_date, 3).getIn_name()%> </a>
					<%
						} else {
					%>
					-<br>
					<%
						}
					%>
				</div></td>
			<%
				// 일반적인 출력
			} else {
			%>
			<td id="date"><%=i%>

				<div align=center>
					<%
						if (1 == resvDao.selectOne(resv_date, 1).getProcessing()) {
					%>
					<a href='adm_oneview.jsp?year=<%=calYear%>&month=<%=calMonth%>&day=<%=calDay%>&room=1'> <%=resvDao.selectOne(resv_date, 1).getIn_name()%> </a><br>
					<%
						} else {
					%>
					-<br>
					<%
						}
					%>
					<%
						if (1 == resvDao.selectOne(resv_date, 2).getProcessing()) {
					%>
					<a href='adm_oneview.jsp?year=<%=calYear%>&month=<%=calMonth%>&day=<%=calDay%>&room=2'> <%=resvDao.selectOne(resv_date, 2).getIn_name()%> </a><br>
					<%
						} else {
					%>
					-<br>
					<%
						}
					%>
					<%
						if (1 == resvDao.selectOne(resv_date, 3).getProcessing()) {
					%>
					<a href='adm_oneview.jsp?year=<%=calYear%>&month=<%=calMonth%>&day=<%=calDay%>&room=3'> <%=resvDao.selectOne(resv_date, 3).getIn_name()%> </a>
					<%
						} else {
					%>
					-<br>
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

				<div align=center>
					<%
						if (1 == resvDao.selectOne(resv_date, 1).getProcessing()) {
					%>
					<a href='adm_oneview.jsp?year=<%=calYear%>&month=<%=calMonth%>&day=<%=calDay%>&room=1'> <%=resvDao.selectOne(resv_date, 1).getIn_name()%> </a><br>
					<%
						} else {
					%>
					-<br>
					<%
						}
					%>
					<%
						if (1 == resvDao.selectOne(resv_date, 2).getProcessing()) {
					%>
					<a href='adm_oneview.jsp?year=<%=calYear%>&month=<%=calMonth%>&day=<%=calDay%>&room=2'> <%=resvDao.selectOne(resv_date, 2).getIn_name()%> </a><br>
					<%
						} else {
					%>
					-<br>
					<%
						}
					%>
					<%
						if (1 == resvDao.selectOne(resv_date, 3).getProcessing()) {
					%>
					<a href='adm_oneview.jsp?year=<%=calYear%>&month=<%=calMonth%>&day=<%=calDay%>&room=3'> <%=resvDao.selectOne(resv_date, 3).getIn_name()%> </a>
					<%
						} else {
					%>
					-<br>
					<%
						}
					%>
				</div></td>
			<%
				// 일요일일 경우의 출력
			} else if ((dayOfWeek - 1 + i) % 7 == 1) {
			%>
			<td id="date" bgcolor=e0ece4><%=i%>

				<div align=center>
					<%	// 예약이 된 경우 -> Processing = 1
						if (1 == resvDao.selectOne(resv_date, 1).getProcessing()) {
					%>
					<a href='adm_oneview.jsp?year=<%=calYear%>&month=<%=calMonth%>&day=<%=calDay%>&room=1'> <%=resvDao.selectOne(resv_date, 1).getIn_name()%> </a><br>
					<%
						} else {
					%>
					-<br>
					<%
						}
					if (1 == resvDao.selectOne(resv_date, 2).getProcessing()) {
					%>
					<a href='adm_oneview.jsp?year=<%=calYear%>&month=<%=calMonth%>&day=<%=calDay%>&room=2'> <%=resvDao.selectOne(resv_date, 2).getIn_name()%> </a><br>
					<%
						} else {
					%>
					-<br>
					<%
						}
					if (1 == resvDao.selectOne(resv_date, 3).getProcessing()) {
					%>
					<a href='adm_oneview.jsp?year=<%=calYear%>&month=<%=calMonth%>&day=<%=calDay%>&room=3'> <%=resvDao.selectOne(resv_date, 3).getIn_name()%> </a>
					<%
						} else {
					%>
					-<br>
					<%
						}
					%>
				</div></td>
			<%
				// 일반적인 출력
			} else {
			%>
			<td id="date"><%=i%>

				<div align=center>
					<%
						if (1 == resvDao.selectOne(resv_date, 1).getProcessing()) {
					%>
					<a href='adm_oneview.jsp?year=<%=calYear%>&month=<%=calMonth%>&day=<%=calDay%>&room=1'> <%=resvDao.selectOne(resv_date, 1).getIn_name()%> </a><br>
					<%
						} else {
					%>
					-<br>
					<%
						}
					%>
					<%
						if (1 == resvDao.selectOne(resv_date, 2).getProcessing()) {
					%>
					<a href='adm_oneview.jsp?year=<%=calYear%>&month=<%=calMonth%>&day=<%=calDay%>&room=2'> <%=resvDao.selectOne(resv_date, 2).getIn_name()%> </a><br>
					<%
						} else {
					%>
					-<br>
					<%
						}
					%>
					<%
						if (1 == resvDao.selectOne(resv_date, 3).getProcessing()) {
					%>
					<a href='adm_oneview.jsp?year=<%=calYear%>&month=<%=calMonth%>&day=<%=calDay%>&room=3'> <%=resvDao.selectOne(resv_date, 3).getIn_name()%> </a>
					<%
						} else {
					%>
					-<br>
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