package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionDB {
	private static Connection con;

	public static synchronized Connection getInstance() {

		if (con == null) {

			final String url = "jdbc:mysql://34.85.92.60:3306/kopo22";
			try {
				Class.forName("com.mysql.cj.jdbc.Driver");
				System.out.println("board con start");
				con = DriverManager.getConnection(url, "kopo22", "kopo22");
				System.out.println("board con login");
			} catch (SQLException e) {
				e.printStackTrace();
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			}
		}

		return con;
	}
}