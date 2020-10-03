<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, javax.sql.*, java.io.*, java.util.*, java.text.*, dao2.*, domain2.*"%>
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
<script>
	function check() {
		var chck1 = true;
		if (form0.title.value == "") {
			alert("제목을 입력하여 주세요");
			chck1 = false;
		}
		if (form0.content.value == "") {
			alert("내용을 입력하여 주세요");
			chck1 = false;
		}
		
		var chck2 = true;
		if (form0.title.value.length > 40 || form0.title.value.length < 2) {
			alert("제목은 2~40자로 입력하여 주세요");
			chck2 = false;
		}
		
		var chck3 = true;
		var RegExp = /[\{\}\[\]\/?.,;|*~`!^\-_+┼<>@\#$%&\+'\"\\\=]/gi;
		if (RegExp.test(form0.title.value)) {
			alert("특수 문자는 입력하실 수 없습니다");
			chck3 = false;
		}

		if (chck1 && chck2 && chck3) {
			form0.action="insertReply.jsp"
			form0.submit();
		}
		
	}
</script>
</head>
<body>
	<%
		int no = 0;
	NoticeDao noticeDao = new NoticeDao();
	List<Notice> noticeList = noticeDao.selectAll();
	if (noticeList.size() == 0) {
		no = 1;
	} else {
		no = (noticeList.get(noticeList.size() - 1).getNo() + 1);
		noticeList.clear();
	}

	Calendar cal = Calendar.getInstance();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
	SimpleDateFormat sdf2 = new SimpleDateFormat("HH:mm:ss");
	String nowDay = sdf.format(cal.getTime());
	String nowTime = sdf2.format(cal.getTime());
	String now = nowDay + " " + nowTime;

	request.setCharacterEncoding("UTF-8");
	String title = request.getParameter("title");
	String grp = request.getParameter("no_grp");
	int grpOrder = Integer.parseInt(request.getParameter("no_grp_order"));
	int layer = Integer.parseInt(request.getParameter("layer"));
	int parent = 0;
	if (request.getParameter("parentReply") == null || Integer.parseInt(request.getParameter("parentReply")) != no) {
		parent = Integer.parseInt(request.getParameter("parent"));
	} else {
		parent = Integer.parseInt(request.getParameter("parentReply"));
	}
	%>

	<form name="form0" method="post">
		<table>
			<tr>
				<td>
					<table>
						<tr>
							<td>&nbsp;</td>
							<td align="center">번&nbsp;호</td>
							<td><input name="no" size="50" maxlength="10" value="<%=no%>(신규)" style="border: none;" readonly></td>
							<td><input type="hidden" name="no_grp" value=<%=grp%>></td>
						</tr>
						<tr height="1" bgcolor="#dddddd">
							<td colspan="4"></td>
						</tr>
						<tr>
							<td>&nbsp;</td>
							<td align="center">제&nbsp;목</td>
							<td><input name="title" size="50" maxlength="100" placeholder="re: <%=title%>" value="re: <%=title%>" readonly></td>
							<td><input type="hidden" name="no_grp_order" value=<%=grpOrder%>></td>
						</tr>
						<tr height="1" bgcolor="#dddddd">
							<td colspan="4"></td>
						</tr>
						<tr>
							<td>&nbsp;</td>
							<td align="center">일&nbsp;자</td>
							<td><input name="date" size="50" value="<%=now%>" style="border: none;" readonly></td>
							<td><input type="hidden" name="layer" value=<%=layer%>></td>
						</tr>
						<tr height="1" bgcolor="#dddddd">
							<td colspan="4"></td>
						</tr>
						<tr>
							<td>&nbsp;</td>
							<td align="center">내&nbsp;용</td>
							<td><textarea name="content" cols="50" rows="13" style="resize: none; width: 550px; height: 500px;"></textarea></td>
							<td><input type="hidden" name="parent" value=<%=parent%>></td>
						</tr>
						<tr height="1" bgcolor="#87cefa">
							<td colspan="4"></td>
						</tr>
						<tr height="3" bgcolor="#87cefa">
							<td colspan="4"></td>
						</tr>
						<tr align="right">
							<td><input type="hidden" name="parentReply" value=<%=no%>></td>
							<td colspan="2" height="50"><input type=button value="등록" onclick=check()><input type=button OnClick="javascript:history.back(-1)"
								value="취소">
							<td>&nbsp;</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>
