<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, javax.sql.*, java.io.*, java.util.*, dao.*, domain.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
	BoardDao boardDao = new BoardDao();
	List<Board> boardList = boardDao.selectAll();

	String tmp = request.getParameter("no").replaceAll("[^0-9]", "");
	int no = Integer.parseInt(tmp);

	int grp = Integer.parseInt(request.getParameter("no_grp"));
	int grpOrder = Integer.parseInt(request.getParameter("no_grp_order"));
	int layer = Integer.parseInt(request.getParameter("layer")) + 1;
	String writer = request.getParameter("writer");
	String title = request.getParameter("title");
	String date = request.getParameter("date");
	String content = request.getParameter("content");
	int count = 0;

	Board board = new Board(no, grp, grpOrder, layer, writer, title, date, content, count);

	boardDao.insertReply(board);
	boardDao.updateReply(board);
	boardList.clear();
	%>
</body>
<META http-equiv=refresh content="0;url=pagination.jsp">
</html>