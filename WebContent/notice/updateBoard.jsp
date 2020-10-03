<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, javax.sql.*, java.io.*, java.util.*, java.text.*,dao2.*,domain2.*"%>
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
		if (form2.title.value == "") {
			alert("제목을 입력하여 주세요");
			chck1 = false;
		}
		if (form2.content.value == "") {
			alert("내용을 입력하여 주세요");
			chck1 = false;
		}
		
		var chck2 = true;
		if (form2.title.value.length > 20 || form2.title.value.length < 2) {
			alert("제목은 2~20자로 입력하여 주세요");
			chck2 = false;
		}
//		if (form2.content.length() > 1000) {
//			chck2 = false;
//		}
		var chck3 = true;
		var RegExp = /[ \{\}\[\]\/?.,;:|\)*~`!^\-_+┼<>@\#$%&\+'\"\\\(\=]/gi;
		if (RegExp.test(form2.title.value)) {
			alert("특수 문자는 입력하실 수 없습니다");
			chck3 = false;
		}

		if (chck1 && chck2 && chck3) {
			form2.action="updateBoard2.jsp"
			form2.submit();
		}
	}
</script>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
			NoticeDao noticeDao = new NoticeDao();

			String tmp = request.getParameter("no").replaceAll("[^0-9]", "");
			int no = Integer.parseInt(tmp);

			Notice notice = noticeDao.selectOne(no);
	%>

	<form name="form2" method="post">
		<table>
			<tr>
				<td>
					<table>
						<tr>
							<td>&nbsp;</td>
							<td align="center">번&nbsp;호</td>
							<td><input name="no" size="50" maxlength="10" value="<%=notice.getNo()%>(수정)" style="border: none;" readonly></td>
							<td><input type="hidden" name="no_grp" value=<%=notice.getGrp()%>></td>
						</tr>
						<tr height="1" bgcolor="#dddddd">
							<td colspan="4"></td>
						</tr>
						<tr>
							<td>&nbsp;</td>
							<td align="center">제&nbsp;목</td>
							<td><input name="title" size="50" maxlength="100" value=<%=notice.getTitle()%>></td>
							<td><input type="hidden" name="no_grp_order" value="<%=notice.getGrpOrder() + 1%>"></td>
						</tr>
						<tr height="1" bgcolor="#dddddd">
							<td colspan="4"></td>
						</tr>
						<tr>
							<td>&nbsp;</td>
							<td align="center">일&nbsp;자</td>
							<td><input name="date" size="50" maxlength="50" value=<%=notice.getDate()%> style="border: none;" readonly></td>
							<td><input type="hidden" name="layer" value=<%=notice.getLayer()%>></td>
						</tr>
						<tr height="1" bgcolor="#dddddd">
							<td colspan="4"></td>
						</tr>
						<tr>
							<td>&nbsp;</td>
							<td align="center">내&nbsp;용</td>
							<td><textarea name="content" cols="50" rows="13"
								style="resize: none; width: 550px; height: 500px; valign: top;"><%=notice.getContent()%></textarea></td>
							<td>&nbsp;</td>
						</tr>
						<tr height="1" bgcolor="#87cefa">
							<td colspan="4"></td>
						</tr>
						<tr height="3" bgcolor="#87cefa">
							<td colspan="4"></td>
						</tr>
						<tr align="right">
							<td>&nbsp;</td>
							<td colspan="2" height="50"><input type=button value="취소" onclick="javascript:history.back(-1)"> <input type=button value="저장"
								onclick=check()>
							<td>&nbsp;</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>
