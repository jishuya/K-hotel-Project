<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, javax.sql.*, java.io.*, java.util.*,dao2.*,domain2.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	<%
		int no = Integer.parseInt(request.getParameter("no"));
			

			NoticeDao noticeDao = new NoticeDao();
			Notice notice = new Notice();
			notice = noticeDao.selectOne(no);
			
			int grp = notice.getGrp();
			int grpOrder = notice.getGrpOrder();
			int layer = notice.getLayer();
			
			List<Notice> noticeList = noticeDao.disOrderByTable();
			
			List<Notice> tmpList = new ArrayList<>();
			for (int i = 0; i < noticeList.size(); i++) {
		if (grp == noticeList.get(i).getGrp()) {
			tmpList.add(noticeList.get(i));
		}
			}
			
			for (int i = grpOrder; i < tmpList.size(); i ++) {
		noticeDao.delete(tmpList.get(i).getNo());
		if (tmpList.get(i).getLayer() < layer) {
			break;
		}
			}
			
			noticeDao.alterTable(noticeList.size());
			noticeList.clear();
			tmpList.clear();
	%>

</body>
<META http-equiv=refresh content="0;url=pagination.jsp">
</html>