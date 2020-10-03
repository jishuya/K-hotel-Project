<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.text.*,java.util.*"%>
<%@ page import="java.sql.*, javax.sql.*, java.io.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
h2 {
	color: #d4a162;
}
</style>
</head>
<body bgcolor=black>
	<%
	request.setCharacterEncoding("UTF-8");
	String year = request.getParameter("year");
	String month = request.getParameter("month");
	String day = request.getParameter("day");
	
	
	%>
	
    <%
    try {
    	// jdbc 연결을 위한 driver class호출
    	Class.forName("com.mysql.cj.jdbc.Driver");
    	// 연결할 호스트를 문자열로 입력
    	String url = "jdbc:mysql://34.97.83.216:3306/kopo22";
    	// DriverManager 클래스는 JDBC 드라이버를 통하여 Connection을 만드는 역할
   		Connection con = DriverManager.getConnection(url, "root", "root");
    	// Connection 객체에 의해 프로그램에 리턴되는 객체에 의해 구현되는 일종의 메소드 집합을 정의
    	// query를 sql에 보냄
    	Statement stmt = con.createStatement();
    	stmt.execute("INSERT INTO resvTable (name, resv_date, room, address, phone_num,"
				+ "in_name, comment, write_date, processing)"
    			+ "VALUES('임지수0', '2020-08-05', 2, '집', '010-1111-2222', '임지수', '없음', '2020-08-04', 1);");
    	stmt.execute("INSERT INTO resvTable (name, resv_date, room, address, phone_num,"
				+ "in_name, comment, write_date, processing)"
    			+ "VALUES('임지수1', '2020-08-05', 3, '집', '010-1111-2222', '임지수', '없음', '2020-08-04', 1);");
    	stmt.execute("INSERT INTO resvTable (name, resv_date, room, address, phone_num,"
				+ "in_name, comment, write_date, processing)"
    			+ "VALUES('임지수2', '2020-08-06', 1, '집', '010-1111-2222', '임지수', '없음', '2020-08-04', 1);");
    	stmt.execute("INSERT INTO resvTable (name, resv_date, room, address, phone_num,"
				+ "in_name, comment, write_date, processing)"
    			+ "VALUES('임지수3', '2020-08-07', 1, '집', '010-1111-2222', '임지수', '없음', '2020-08-04', 1);");
    	stmt.execute("INSERT INTO resvTable (name, resv_date, room, address, phone_num,"
				+ "in_name, comment, write_date, processing)"
    			+ "VALUES('임지수4', '2020-08-08', 1, '집', '010-1111-2222', '임지수', '없음', '2020-08-04', 1);");
    	stmt.close();
    	con.close();
	} catch (Exception e) {
		System.out.println(e.getMessage());
	}
    %>


</body>
</html>