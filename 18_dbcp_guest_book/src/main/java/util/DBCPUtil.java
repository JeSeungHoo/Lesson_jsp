package util;

import java.sql.Connection;
import java.sql.SQLException;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class DBCPUtil {
	public static Connection getConnection() {
		Connection conn = null;
		try {
			DataSource ds = (DataSource) new InitialContext().lookup("java:comp/env/jdbc/MySQLDBCP");
			conn = ds.getConnection();
		} catch (NamingException e) {
			e.printStackTrace();
			System.out.println("DBCP not found");
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("db connect fail");
		}
		return conn;
	}
	
	public static void close(AutoCloseable... closer) {
		for (AutoCloseable a : closer) {
			if (a != null)
				try {
					a.close();
				} catch (Exception e) {}
		}
	}
}