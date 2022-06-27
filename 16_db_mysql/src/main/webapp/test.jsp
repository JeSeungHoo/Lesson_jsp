<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@page import="java.sql.*"%>
	<%
	String driver = "com.mysql.cj.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/bigdata";
	String user = "bigdata";
	String password = "12345";
	
	Connection conn = null;
	try {
		Class.forName(driver);
		conn = DriverManager.getConnection(url, user, password);
		out.println("DB와 연결되었습니다.");
	} catch (ClassNotFoundException e) {
		out.println("Driver Class를 찾을수 없습니다.");
	} catch (SQLException e) {
		out.println("DB 연결 정보가 잘못되었습니다.");
	}
	%>
	<a href="<%=request.getContextPath()%>">메인으로</a>
</body>
</html>