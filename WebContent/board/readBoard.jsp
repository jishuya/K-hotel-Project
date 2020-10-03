<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, javax.sql.*, java.io.*, java.util.*, java.text.*, dao.*, domain.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
table {
	margin-right: auto;
	margin-left: auto;
}
</style>
</head>
<body>
	<%
		String loginbool = "";

	if (session.getAttribute("login_ok") != null) {
		loginbool = (String) session.getAttribute("login_ok");
	}
	
		int no = 0;
	BoardDao boardDao = new BoardDao();
	Board board = boardDao.selectOne(Integer.parseInt(request.getParameter("no")));
	List<Board> boardList = boardDao.selectAll();
	if (boardList.size() == 0) {
		no = 1;
	} else {
		no = (boardList.get(boardList.size() - 1).getNo() + 1);
	}
	boardDao.updateCount(board);
	%>

	<form name="form1" method="post">
		<table>
			<tr>
				<td>
					<table>
						<tr>
							<td>&nbsp;</td>
							<td align="center">번&nbsp;&nbsp;&nbsp;호</td>
							<td><input name="no" size="50" maxlength="10" value=<%=board.getNo()%> readonly style="border: none;outline: none;"></td>
							<td><input type="hidden" name="no_grp" value=<%=board.getGrp()%>></td>
						</tr>
						<tr height="1" bgcolor="#dddddd">
							<td colspan="4"></td>
						</tr>
						<tr>
							<td>&nbsp;</td>
							<td align="center">제&nbsp;&nbsp;&nbsp;목</td>
							<td><input name="title" size="50" maxlength="100" value="<%=board.getTitle()%>" readonly style="border: none;outline: none;"></td>
							<td><input type="hidden" name="no_grp_order" value="<%=board.getGrpOrder() + 1%>"></td>
						</tr>
						<tr height="1" bgcolor="#dddddd">
							<td colspan="4"></td>
						</tr>
						<tr>
							<td>&nbsp;</td>
							<td align="center">작성자</td>
							<td><input name="writer" size="50" maxlength="100" value="<%=board.getWriter()%>" readonly style="border: none;outline: none;"></td>
							<td><input type="hidden" name="layer" value=<%=board.getLayer()%>></td>
						</tr>
						<tr height="1" bgcolor="#dddddd">
							<td colspan="4"></td>
						</tr>
						<tr>
							<td>&nbsp;</td>
							<td align="center">일&nbsp;&nbsp;&nbsp;자</td>
							<td><input name="date" size="50" maxlength="50" value="<%=board.getDate()%>" readonly style="border: none;outline: none;"></td>
							<td><input name="count" size="1" value="h:<%=board.getCount()%>" readonly style="border: none;outline: none;"></td>
						</tr>
						<tr height="1" bgcolor="#dddddd">
							<td colspan="4"></td>
						</tr>
						<tr>
							<td>&nbsp;</td>
							<td align="center">내&nbsp;&nbsp;&nbsp;용</td>
							<td><textarea name="content" cols="50" rows="13" style="resize: none; width: 550px; height: 500px; valign: top;outline: none;" readonly><%=board.getContent()%></textarea></td>
							<td><input type="hidden" name="parent" value=<%=board.getNo()%>></td>
						</tr>
						<tr height="1" bgcolor="teal">
							<td colspan="4"></td>
						</tr>
						<tr height="3" bgcolor="teal">
							<td colspan="4"></td>
						</tr>
						<tr align="left">
							<td>&nbsp;</td>
							<td colspan="2" height="50"><input type=button value="목록" onclick="location.href='pagination.jsp'">
							<%
							if (loginbool.equals("yes")) {
							%>
							<input type=submit value="수정"
								onclick="javascript: form1.action='updateBoard.jsp'"> <input type=submit value="삭제"
								onclick="javascript: form1.action='deleteBoard.jsp'"> <input type=submit value="답글"
								onclick="javascript: form1.action='replyBoard.jsp'">
								<%} %>
							<td>&nbsp;</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
		<%
			boardList.clear();
		%>
	</form>
</body>
</html>
