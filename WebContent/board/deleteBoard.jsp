<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, javax.sql.*, java.io.*, java.util.*, dao.*, domain.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	<%
		int no = Integer.parseInt(request.getParameter("no"));

	BoardDao boardDao = new BoardDao();
	Board board = new Board();
	board = boardDao.selectOne(no);

	int grp = board.getGrp();
	int grpOrder = board.getGrpOrder();
	int layer = board.getLayer();

	List<Board> boardList = boardDao.disOrderByTable();

	List<Board> tmpList = new ArrayList<>();
	for (int i = 0; i < boardList.size(); i++) {
		if (grp == boardList.get(i).getGrp()) {
			tmpList.add(boardList.get(i));
		}
	}

	for (int i = grpOrder; i < tmpList.size(); i++) {
		boardDao.delete(tmpList.get(i).getNo());
		if (tmpList.get(i).getLayer() < layer) {
			break;
		}
	}

	boardDao.alterTable(boardList.size());
	boardList.clear();
	tmpList.clear();
	%>

</body>
<META http-equiv=refresh content="0;url=pagination.jsp">
</html>