<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.text.*,java.util.*"%>
<%@ page import="java.sql.*, javax.sql.*, java.io.*, domain3.*, service3.*, dao3.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
<%
request.setCharacterEncoding("UTF-8");

String preDate = request.getParameter("preDate");

int preRoom = Integer.parseInt(request.getParameter("preRoom"));

ResvService resvService = new ResvService();
ResvDao resvDao = new ResvDao();


resvDao.delete(preDate, preRoom);

out.println(preRoom);
out.println(preDate);
%>

</body>
<META http-equiv=refresh content="0;url=d_01.jsp">
</html>