<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, javax.sql.*, java.io.*, java.util.*, java.text.*,dao2.*,domain2.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
//		if (form0.content.length() > 1000) {
//			chck2 = false;
//		}
		var chck3 = true;
		var RegExp = /[\{\}\[\]\/?.,;:|\)*~`!^\-_+┼<>@\#$%&\+'\"\\\(\=]/gi;
		if (RegExp.test(form0.title.value)) {
			alert("특수 문자는 입력하실 수 없습니다");
			chck3 = false;
		}

		if (chck1 && chck2 && chck3) {
			form0.action="insertBoard.jsp"
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
	%>

	<form name="form0" method="post">
		<table>
			<tr>
				<td>
					<table>
						<tr>
							<td>&nbsp;</td>
							<td align="center">번&nbsp;호</td>
							<td><input name="no" size="50" maxlength="10" value="<%=no%>" readonly style="border: none;"></td>
							<td>&nbsp;</td>
						</tr>
						<tr height="1" bgcolor="#dddddd">
							<td colspan="4"></td>
						</tr>
						<tr>
							<td>&nbsp;</td>
							<td align="center">제&nbsp;목</td>
							<td><input name="title" size="50" maxlength="100"></td>
							<td>&nbsp;</td>
						</tr>
						<tr height="1" bgcolor="#dddddd">
							<td colspan="4"></td>
						</tr>
						<tr>
							<td>&nbsp;</td>
							<td align="center">일&nbsp;자</td>
							<td><input name="date" size="50" value="<%=now%>" readonly style="border: none;"></td>
							<td>&nbsp;</td>
						</tr>
						<tr height="1" bgcolor="#dddddd">
							<td colspan="4"></td>
						</tr>
						<tr>
							<td>&nbsp;</td>
							<td align="center">내&nbsp;용</td>
							<td><textarea name="content" cols="50" rows="13" style="resize: none; width: 550px; height: 500px;"></textarea></td>
							<td>&nbsp;</td>
						</tr>
						<tr height="1" bgcolor="#87cefa">

						<tr height="3" bgcolor="lightgray">
							<td colspan="4"></td>
						</tr>
						<tr align="right">
							<td>&nbsp;</td>
							<td colspan="2" height="50"><input type=button value="등록" onclick=check()> <input type=button
								OnClick="javascript:history.back(-1)" value="취소">
							<td>&nbsp;</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>
