<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, javax.sql.*, java.io.*, java.util.*,dao2.*,domain2.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
			NoticeDao noticeDao = new NoticeDao();
			List<Notice> boardList = noticeDao.selectAll();

			String tmp = request.getParameter("no").replaceAll("[^0-9]", "");
			int no = Integer.parseInt(tmp);

			String title = request.getParameter("title");
			String date = request.getParameter("date");
			String content = request.getParameter("content");

			Notice notice = new Notice(no, title, date, content);

			noticeDao.insertBoard(notice);
			boardList.clear();
	%>
</body>
<META http-equiv=refresh content="0;url=pagination.jsp">
</html>