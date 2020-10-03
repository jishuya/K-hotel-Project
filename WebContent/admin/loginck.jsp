<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, javax.sql.*, java.net.*, java.io.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	<div align=center>
	
		<!-- login.jsp에서 id와 passwd를 받아온다  -->
		<%
			request.setCharacterEncoding("utf-8");
		 

		String jump = request.getParameter("jump");
		// out.println("[" + jump + "]");
		String id = request.getParameter("id");
		// out.println("[" + id + "]");
		String pass = request.getParameter("passwd");
		// out.println("[" + passwd + "]");
		

		
		boolean bPassChk = false;

		//아이디 패스워드 체크
		if (id.replace(" ", "").equals("admin") && pass.replaceAll(" ", "").equals("admin")) {
			bPassChk = true;
		} else {
			bPassChk = false;

		}

		//패스워드 체크가 끝나면, 세션을 기록하고 점프한다.
		if (bPassChk) {
			session.setAttribute("login_ok", "yes");
			session.setAttribute("login_id", id);
			response.sendRedirect(jump); //특정 조건일 때에 지정한 페이지로 이동, 로그인체크 이후 돌아갈 곳이다
		} else {
			out.println("<br>");
			out.println("<hr width=800 color=#69491a>");
			out.println("<h2>아이디 또는 패스워드 오류. </h2>");
			out.println("<input type=button value='로그인' onclick=\"location.href='login.jsp?jump=" + jump + "'\">");
		}
		%>
	</div>

</body>
	<div>
		<hr width=800 color=#69491a>
	</div>
	
	</div>
	<br>
	<h4 align=center>잠시 후 이전 페이지로 이동합니다.</h4>


</body>
<!-- 
fresh: 새로고침을 해주는 태그, 시간과 URL입력시 원하는 페이지로 이동가능
<meta http-equiv="fresh" content="시간(초 단위); URL=이동하고자 하는 웹페이지 또는 미디어주소">
 -->
<META http-equiv=refresh content="5; url=reservation/d_01.jsp">
</html>