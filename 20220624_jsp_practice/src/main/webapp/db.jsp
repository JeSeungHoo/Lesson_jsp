<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.sql.*"%>
<%!
	Connection conn = null;
	Statement stmt = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	void dbClose() {
		try {
			if (rs != null) rs.close();
			if (pstmt != null) pstmt.close();
			if (stmt != null) stmt.close();
			if (conn != null) conn.close();
		} catch (Exception e) {
			System.out.println("==========dbClose 오류==========");
			e.printStackTrace();
			System.out.println("==========dbClose 오류==========");
		}
	}
%>
<%
	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bigdata", "bigdata", "12345");
	} catch (Exception e) {
		System.out.println("=====Connection 오류=====");
		e.printStackTrace();
		System.out.println("=====Connection 오류=====");
	}
%>