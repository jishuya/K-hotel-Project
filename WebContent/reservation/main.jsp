<style type="text/css">
a:link {
	font-family: "";
	font-size: 14pt;
	text-decoration: none;
	color: darkblue;
}

a:visited {
	font-family: "";
	font-size: 14pt;
	text-decoration: none;
	color: darkblue;
}

a:hover {
	font-family: "";
	font-size: 14pt;
	text-decoration: :none;
	color: #43658b;
}

font {
	font-family: "";
	font-size: 14pt;
	text-decoration: none;
}

.inputline {
	border: 1 solid;
	color: white;
}

.input {
	border: 1 solid
}

.head {
	font-family: "arial";
	font-size: 10pt;
	font-weight: bold;
	color: white;
}

.text_jp {
	font-family: "";
	font-size: 9pt;
	line-height: 12pt
}

.text_sjp {
	font-family: "";
	font-size: 8pt;
	line-height: 12pt
}

.text_mjp {
	font-family: "";
	font-size: 11pt;
	line-height: 12pt
}

.text_bjp {
	font-family: "";
	font-size: 12pt;
	line-height: 12pt
}

.body1 {
	font-size: 38px;
}

.body2 {
	font-size: 26px;
}

.body3 {
	font-size: 14px;
}

.body4 {
	font-size: 8px;
}

.body5 {
	font-size: 10px;
}

.body6 {
	font-size: 9px;
}

.lt {
	font-size: 12pt;
	text-decoration: line-through
}

input.locked {
	background-color: #DDDDDD;
}

#day {
	color: white;
	font-size: 20px;
	width: 150;
}
</style>
<%@ page import="java.text.*,java.util.*" contentType="text/html;charset=UTF-8"%>
<%
	int year;
int month;
Calendar today = Calendar.getInstance();
Calendar cal = new GregorianCalendar();
year = (request.getParameter("year") == null) ? today.get(Calendar.YEAR) : Integer.parseInt(request.getParameter("year").trim());

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
<html>
<body>
	<table align="center">

		<table align="center" border=0 height=700>
			<tr height=50>
				<td align="center" height='20' valign='center' colspan="7"><a
					href='main.jsp?year=<%=cal.get(Calendar.YEAR)%>&month=<%=((cal.get(Calendar.MONTH) + 1) - 1)%>'> <font color='#69491A' style="font-size: 30px">◀
					</font></a> <font color='white' style="font-size: 40px"><%=cal.get(Calendar.YEAR)%> / <%=(cal.get(Calendar.MONTH) + 1)%></font> <a
					href='main.jsp?year=<%=cal.get(Calendar.YEAR)%>&month=<%=((cal.get(Calendar.MONTH) + 1) + 1)%>'> <font color='#69491A' style="font-size: 30px">▶
					</font></a></td>
			</tr>
			<tr align="center" bgcolor="d4a162">
				<td bgcolor="#d8d3cd" id="day">SUN</td>
				<td id="day">MON</td>
				<td id="day">TUE</td>
				<td id="day">WED</td>
				<td id="day">THU</td>
				<td id="day">FRI</td>
				<td bgcolor="#d8d3cd" id="day">SAT</td>
			</tr>

			<%
				cal.set(year, month - 1, 1);
			int dayOfWeek = cal.get(Calendar.DAY_OF_WEEK);
			%>
			<tr align="right" valign="top" bgcolor="white">
				<%
					for (int i = 1; i < dayOfWeek; i++) {
				%><td align="right" valign="top" bgcolor="black"></td>
				<%
					}

				for (int i = 1; i <= cal.getActualMaximum(Calendar.DAY_OF_MONTH); i++) {
				%>
				<td><a href='day.jsp?year=<%=cal.get(Calendar.YEAR)%>&month=<%=((cal.get(Calendar.MONTH) + 1))%>&day=<%=i%>'><%=i%></a></td>
				<%
					if ((dayOfWeek - 1 + i) % 7 == 0) {
				%>
			</tr>
			<tr align="right" valign="top" bgcolor="white">
				<%
					}
				}
				%>

			</tr>
		</table>
	</table>
</body>
</html>