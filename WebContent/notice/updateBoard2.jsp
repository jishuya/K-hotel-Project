<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, javax.sql.*, java.io.*, java.util.*, java.text.*,dao2.*,domain2.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");

			Calendar cal = Calendar.getInstance();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
			SimpleDateFormat sdf2 = new SimpleDateFormat("HH:mm:ss");
			String nowDay = sdf.format(cal.getTime());
			String nowTime = sdf2.format(cal.getTime());
			
			String tmp = request.getParameter("no").replaceAll("[^0-9]", "");
			int no = Integer.parseInt(tmp);
			
			String title = request.getParameter("title");
			String date = nowDay + " " + nowTime;
			String content = request.getParameter("content");

			NoticeDao noticeDao = new NoticeDao();
			Notice notice = new Notice(no, title, date, content);
			noticeDao.update(notice);
	%>
</body>
<META http-equiv=refresh content="0;url=pagination.jsp">
</html>
