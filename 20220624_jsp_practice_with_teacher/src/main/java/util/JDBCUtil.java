package util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class JDBCUtil {
	private static final String driver = "com.mysql.cj.jdbc.Driver";
	private static final String url = "jdbc:mysql://localhost:3306/bigdata";
	private static final String user = "bigdata";
	private static final String pass = "12345";
	
	public static Connection getConnection() {
		Connection conn = null;
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, user, pass);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return conn;
	}
	
	public static void close(AutoCloseable... closer) {
		for (AutoCloseable a : closer) {
			try {
				if (a != null) a.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
}