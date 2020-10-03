<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, javax.sql.*, java.io.*, java.util.*, java.text.*,dao2.*,domain2.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
table {
	margin-right: auto;
	margin-left: auto;
	border: 0px;
	border-collapse: collapse;
}

tr {
	border-bottom: 1px solid #87cefa;
}

td {
	font-size: 15px;
}

a {
	text-decoration: none;
}

.r {
	float: right;
}

.first {
	text-align: center;
}

.second {
	text-indent: 50px;
}

#date {
	color: #666;
	font-size: 13px;
}

#find {
	
}
</style>
</head>
<body>
	<%
		Calendar cal = Calendar.getInstance();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
	SimpleDateFormat sdf2 = new SimpleDateFormat("HH:mm:ss");
	String nowDay = sdf.format(cal.getTime());
	String nowTime = sdf2.format(cal.getTime());
	String now = null;

	NoticeDao noticeDao = new NoticeDao();
	List<Notice> noticeList = null;

	request.setCharacterEncoding("UTF-8");

	String search = request.getParameter("search");
	if (search == "제목") {
		search = "title";
	} else if (search == "내용") {
		search = "content";
	} else if (search == "작성자") {
		search = "writer";
	}

	search = "title";

	String findThis = request.getParameter("findThis");
	if (findThis == "" || findThis == null) {
		noticeList = noticeDao.orderByTable();
	} else {
		noticeList = noticeDao.orderByTableFind(search, findThis);
	}
	%>
	<table>
		<colgroup>
			<col width=50>
			<col width=470>
			<col width=80>
		</colgroup>
		<tr>
			<td class="first">번호</td>
			<td class="first">제목</td>
			<td class="first">등록일</td>
		</tr>
		<tr>
			<td colspan=3></td>
		</tr>

		<%
			String blank = "&nbsp;&nbsp;";
		for (int i = noticeList.size() - 1; i >= 0; i--) {
			String tmp = noticeList.get(i).getDate();
			if (tmp.substring(0, 10).equals(nowDay)) {
				now = tmp.substring(11);
			} else {
				now = tmp.substring(0, 10);
			}
		%>

		<tr>
			<td class="first"><%=noticeList.get(i).getNo()%></td>
			<td class="second"><a href="./readBoard.jsp?no=<%=noticeList.get(i).getNo()%>"> <%
 	for (int j = 1; j < noticeList.get(i).getLayer(); j++) {
 	out.println(blank);
 }
 %> <%=noticeList.get(i).getTitle()%></a></td>
			<td class="first" id="date"><%=now%></td>
		</tr>

		<%
			}
		noticeList.clear();
		%>

		<tr>
			<td colspan=3></td>
		</tr>
		<tr style="border-top: 1px solid #1AAB8A; border-bottom: 0px;">
			<td colspan=3 height=50><button class="r" onclick="location='writeBoard.jsp'">글쓰기</button></td>
		</tr>

	</table>
	<form name="formFind" method="post">
		<div class="find" align="center">
			<select name="search">
				<option>제목</option>
				<option>내용</option>
				<option>작성자</option>
			</select> <input name="findThis" type="text"> <input type="submit" value="검색" onclick="javascript: formFind.action='searchThis.jsp'">
		</div>
	</form>
</body>
</html>