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
	border-bottom: 2px solid lightgray;
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

#log {
	width: 90px;
	pointer
}

#logBtn {
	width: 60px;
	margin: 0;
	padding: 0;
	border: 0;
	background-color: white;
	cursor: pointer;
	float: right;
}
</style>

<script>
	function adminlogin() {
		location.href = "../admin/login.jsp?jump=../notice/pagination.jsp";
	}

	function adminlogout() {
		location.href = "../admin/logout.jsp";
	}
</script>

</head>
<body>

    <br>
	<br>
	<hr width=550 color=#69491A>
	<h1 align=center><img src="../reservation/resv/roomlogo10.png" style="width: 55px"> Notice</h1>
	<hr width=550 color=#69491A>
	<br>
	<br>
	
	<table border=0>
		<colgroup>
			<col width=150>
			<col width=200>
			<col width=150>
		<tr>
			<td style="border-bottom: 2px solid white;"></td>
			<td style="border-bottom: 2px solid white;"></td>
			<td style="border-bottom: 2px solid white;">
				<%
					String loginbool = "";

				if (session.getAttribute("login_ok") != null) {
					loginbool = (String) session.getAttribute("login_ok");
				}
				if (loginbool.equals("yes")) {
				%>
				<button id=logBtn onclick="adminlogout()">
					<image id=log src="../images/logout.png">
				</button> <%
 	} else {
 %>
				<button id=logBtn onclick="adminlogin()">
					<image id=log src="../images/login.png">
				</button> <%
 	}
 %>
			</td>
		</tr>
	</table>
	<br>
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
		noticeList = noticeDao.disOrderByTable();
	} else {
		noticeList = noticeDao.disOrderByTableFind(search, findThis);
	}

	int pageBlock = 10;

	int lineCnt = 0; // 전체 라인수 세는 거
	int fromPT = 0; // 시작번호
	int cntPT = 10; // 갯수
	int totalCnt = noticeList.size(); // 글의 전체 수
	int totalPageBlock = 0;
	if (request.getParameter("pkey") == null || request.getParameter("pkey") == "") {
		totalPageBlock = ((totalCnt / cntPT) + ((totalCnt % cntPT) == 0 ? 0 : 1)); // 전체 페이지 블럭의 수 // 10으로 나눠지면 +0 나머지가 생기면 +1
	} else {
		totalPageBlock = Integer.parseInt(request.getParameter("pkey"));
	}

	String pageNum = request.getParameter("pageNum");

	if (pageNum == null || pageNum == "") {
		pageNum = "1";
	}

	int currentPage = Integer.parseInt(pageNum);
	fromPT = (currentPage - 1) * cntPT + 1;
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

		int i = 0; // 0부터시작하는 글의 번호
		if (currentPage == 1) {
			i = 0;
		} else {
			i = (cntPT * (currentPage - 1));
		}

		while (i < noticeList.size()) {
			if (lineCnt < fromPT) { //  < 1
				lineCnt++;
				continue;
			}

			if (lineCnt > fromPT + cntPT - 1) { // 11 > 10
				break;
			}

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
			i++; // 2
		lineCnt++; // 3
		}
		noticeList.clear();
		%>

		<tr>
			<td colspan=3></td>
		</tr>
		<tr style="border-top: 1px solid #1AAB8A; border-bottom: 0px;">
		<%
		if (loginbool.equals("yes")) {
		%>
			<td colspan=3 height=50><button class="r" onclick="location='writeBoard.jsp'">글쓰기</button></td>
		<%} %>
		</tr>

	</table>
	<%
		if (totalCnt > 0) { // 12
		int pageCount = totalCnt / cntPT + (totalCnt % cntPT == 0 ? 0 : 1); // 전체 블럭의 수
		int startPage = ((int) (currentPage / pageBlock) - (currentPage % pageBlock == 0 ? 1 : 0)) * pageBlock + 1; // 
		int endPage = startPage + pageBlock - 1;
		if (endPage > pageCount) {
			endPage = pageCount;
		}

		if (findThis != null) {
	%><p align=center>
		<a href="pagination.jsp?&pkey=<%=totalPageBlock%>&search=<%=search%>&findThis=<%=findThis%>">[처음으로]</a>
		<%
			if (startPage > pageBlock) {
		%><a href="pagination.jsp?pageNum=<%=startPage - pageBlock%>&pkey=<%=totalPageBlock%>&search=<%=search%>&findThis=<%=findThis%>">[이전]</a>
		<%
			}
		for (int k = startPage; k <= endPage; k++) {
		%><a href="pagination.jsp?pageNum=<%=k%>&pkey=<%=totalPageBlock%>&search=<%=search%>&findThis=<%=findThis%>">[<%=k%>]
		</a>
		<%
			}
		if (endPage < pageCount) {
		%><a href="pagination.jsp?pageNum=<%=startPage + pageBlock%>&pkey=<%=totalPageBlock%>&search=<%=search%>&findThis=<%=findThis%>">[다음]</a>
		<%
			}
		%><a href="pagination.jsp?pageNum=<%=totalPageBlock%>&pkey=<%=totalPageBlock%>&search=<%=search%>&findThis=<%=findThis%>">[마지막으로]</a>
	</p>
	<%
		} else {
	%><p align=center>
		<a href="pagination.jsp">[처음으로]</a>
		<%
			if (startPage > pageBlock) {
		%><a href="pagination.jsp?pageNum=<%=startPage - pageBlock%>">[이전]</a>
		<%
			}
		for (int k = startPage; k <= endPage; k++) {
		%><a href="pagination.jsp?pageNum=<%=k%>">[<%=k%>]
		</a>
		<%
			}
		if (endPage < pageCount) {
		%><a href="pagination.jsp?pageNum=<%=startPage + pageBlock%>">[다음]</a>
		<%
			}
		%><a href="pagination.jsp?pageNum=<%=totalPageBlock%>">[마지막으로]</a>
	</p>
	<%
		}
	}
	%>

	<br>
	<br>
	<form name="formFind" method="post">
		<div class="find" align="center">
			<select name="search">
				<option>제목</option>
				<option>내용</option>
				<option>작성자</option>
			</select> <input name="findThis" type="text"> <input type="submit" value="검색" onclick="javascript: formFind.action='pagination.jsp'"> <input
				type="hidden" name="totalPageBlock" value="<%=totalPageBlock%>"> <input type="hidden" name="size" value="<%=totalCnt%>">
		</div>
	</form>
</body>
</html>





























