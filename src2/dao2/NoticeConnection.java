package dao2;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class NoticeConnection {
	private static Connection con;

	public static synchronized Connection getInstance() {

		if (con == null) {

			final String url = "jdbc:mysql://34.85.92.60:3306/kopo22";
			try {
				Class.forName("com.mysql.cj.jdbc.Driver");
				con = DriverManager.getConnection(url, "kopo22", "kopo22");
				   System.out.println("mysql start");
				   System.out.println(con);
				   System.out.println("mysql end");
			} catch (SQLException e) {
				e.printStackTrace();
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			}
		}

		return con;
	}
}