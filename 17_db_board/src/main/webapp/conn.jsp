<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.sql.*"%>
<%
	Connection conn = null;
	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		out.println("Driver Class 로드 완료<br />");
		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bigdata", "bigdata", "12345");
		out.println("DB 연결 완료");
	} catch (java.lang.ClassNotFoundException e) {
		out.println("Dirver Class 로드 실패");
	} catch (SQLException e) {
		out.println("DB 연결 실패" + e.toString());
	}
%>