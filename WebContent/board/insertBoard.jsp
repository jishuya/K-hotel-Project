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

	String title = request.getParameter("title");
	String writer = request.getParameter("writer");
	String date = request.getParameter("date");
	String content = request.getParameter("content");

	Board board = new Board(no, writer, title, date, content);

	boardDao.insertBoard(board);
	boardList.clear();
	%>
</body>
<META http-equiv=refresh content="0;url=pagination.jsp">
</html>