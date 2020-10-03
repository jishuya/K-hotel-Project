<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, javax.sql.*, java.io.*, java.util.*, java.text.*, dao.*, domain.*"%>
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

#find {
	
}
</style>
</head>
<body>
	<br>
	<br>
	<hr width=550 color=#69491A>
	<h1 align=center><img src="../reservation/resv/roomlogo10.png" style="width: 55px">Review</h1>
	<hr width=550 color=#69491A>
	<br>
	<br>
	<%
		Calendar cal = Calendar.getInstance();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
	SimpleDateFormat sdf2 = new SimpleDateFormat("HH:mm:ss");
	String nowDay = sdf.format(cal.getTime());
	String nowTime = sdf2.format(cal.getTime());
	String now = null;

	BoardDao boardDao = new BoardDao();
	List<Board> boardList = null;

	request.setCharacterEncoding("UTF-8");

	String search = request.getParameter("search");
	if ("제목".equals(search)) {
		search = "title";
	} else if ("내용".equals(search)) {
		search = "content";
	} else if ("작성자".equals(search)) {
		search = "writer";
	}

	String findThis = request.getParameter("findThis");
	if (findThis == "" || findThis == null) {
		boardList = boardDao.disOrderByTable();
	} else {
		boardList = boardDao.disOrderByTableFind(search, findThis);
	}

	int pageBlock = 10;

	int lineCnt = 0;
	int fromPT = 0;
	int cntPT = 10;
	int totalCnt = boardList.size();
	int totalPageBlock = 0;
	if (request.getParameter("pkey") == null || request.getParameter("pkey") == "") {
		totalPageBlock = ((totalCnt / cntPT) + ((totalCnt % cntPT) == 0 ? 0 : 1));
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
			<col width=400>
			<col width=100>
			<col width=80>
			<col width=70>
		</colgroup>
		<tr>
			<td class="first">번호</td>
			<td class="first">제목</td>
			<td class="first">작성자</td>
			<td class="first">등록일</td>
			<td class="first">조회수</td>
		</tr>
		<tr>
			<td colspan=5></td>
		</tr>

		<%
			String blank = "&nbsp;&nbsp;";

		int i = 0;
		if (currentPage == 1) {
			i = 0;
		} else {
			i = (cntPT * (currentPage - 1));
		}

		while (i < boardList.size()) {
			if (lineCnt < fromPT) {
				lineCnt++;
				continue;
			}

			if (lineCnt > fromPT + cntPT - 1) {
				break;
			}

			String tmp = boardList.get(i).getDate();
			if (tmp.substring(0, 10).equals(nowDay)) {
				now = tmp.substring(11);
			} else {
				now = tmp.substring(0, 10);
			}
		%>

		<tr>
			<td class="first"><%=boardList.get(i).getNo()%></td>
			<td class="second"><a href="./readBoard.jsp?no=<%=boardList.get(i).getNo()%>"> <%
 	for (int j = 1; j < boardList.get(i).getLayer(); j++) {
 	out.println(blank);
 }
 %> <%=boardList.get(i).getTitle()%></a></td>
			<td class="first"><%=boardList.get(i).getWriter()%></td>
			<td class="first" id="date"><%=now%></td>
			<td class="first" id="date"><%=boardList.get(i).getCount()%></td>
		</tr>

		<%
			i++;
		lineCnt++;
		}
		boardList.clear();
		%>

		<tr>
			<td colspan=5></td>
		</tr>
		<tr style="border-top: 1px solid #1AAB8A; border-bottom: 0px;">
			<td colspan=5 height=50><button class="r" onclick="location='writeBoard.jsp'">글쓰기</button></td>
		</tr>

	</table>
	<%
		if (totalCnt > 0) {
		int pageCount = totalCnt / cntPT + (totalCnt % cntPT == 0 ? 0 : 1);
		int startPage = ((int) (currentPage / pageBlock) - (currentPage % pageBlock == 0 ? 1 : 0)) * pageBlock + 1;
		int endPage = startPage + pageBlock - 1;
		if (endPage > pageCount) {
			endPage = pageCount;
		}
	%>
	<p align=center>
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
		}
	%>

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





























