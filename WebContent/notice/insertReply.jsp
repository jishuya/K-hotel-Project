<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, javax.sql.*, java.io.*, java.util.*,dao2.*,domain2.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
			NoticeDao noticeDao = new NoticeDao();
			List<Notice> noticeList = noticeDao.selectAll();

			String tmp = request.getParameter("no").replaceAll("[^0-9]", "");
			int no = Integer.parseInt(tmp);
			
			int grp = Integer.parseInt(request.getParameter("no_grp"));
			int grpOrder = Integer.parseInt(request.getParameter("no_grp_order"));
			int layer = Integer.parseInt(request.getParameter("layer")) + 1;
			int parent = Integer.parseInt(request.getParameter("parent"));
			String title = request.getParameter("title");
			String date = request.getParameter("date");
			String content = request.getParameter("content");

			Notice notice = new Notice(no, grp, grpOrder, layer, parent, title, date, content);

			noticeDao.insertReply(notice);
			noticeDao.updateReply(notice);
			noticeList.clear();
	%>
</body>
<META http-equiv=refresh content="0;url=pagination.jsp">
</html>