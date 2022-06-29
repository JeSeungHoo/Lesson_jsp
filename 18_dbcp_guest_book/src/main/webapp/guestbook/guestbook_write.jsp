<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%-- <%@page import="javax.sql.*"%> --%>
<%-- <%@page import="javax.naming.*"%> --%>
<%@page import="util.DBCPUtil"%>
<%
request.setCharacterEncoding("UTF-8");
String msg = "";
%>
<jsp:useBean id="guestbook" class="vo.Guestbook" />
<jsp:setProperty name="guestbook" property="*" />
<%
//DataSource ds = (DataSource) new InitialContext().lookup("java:comp/env/jdbc/MySQLDBCP");
//Connection conn = null;
Connection conn = DBCPUtil.getConnection();
PreparedStatement pstmt = null;
try {
//	conn = ds.getConnection();
	pstmt = conn.prepareStatement("INSERT INTO test_guestbook VALUES (NULL, ?, ?, ?)");
	pstmt.setString(1, guestbook.getGuestName());
	pstmt.setString(2, guestbook.getPassword());
	pstmt.setString(3, guestbook.getMessage());
	msg = (pstmt.executeUpdate() > 0) ? "방명록 등록 성공" : "방명록 등록 실패";
} catch (Exception e) {
	e.printStackTrace();
} finally {
//	if (pstmt != null) pstmt.close();
//	if (conn != null) conn.close();
	DBCPUtil.close(pstmt, conn);
}
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>방명록 작성 확인</title>
</head>
<body>
	<h1><%=msg%></h1>
	<!-- 방명록 작성 후 이동할 페이지 링크 -->
	<a href="guestbook_list.jsp">[목록 보기]</a>
</body>
</html>