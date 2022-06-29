<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.*, util.*"%>
<%
request.setCharacterEncoding("UTF-8");
String msg= "";
String paramId = request.getParameter("id");
int id = Integer.parseInt(paramId);
String password = request.getParameter("password");
Connection conn = DBCPUtil.getConnection();
PreparedStatement pstmt = null;
String sql = "DELETE FROM test_guestbook WHERE id = ? AND password = ?";
try {
	pstmt = conn.prepareStatement(sql);
	pstmt.setInt(1, id);
	pstmt.setString(2, password);
	int result = pstmt.executeUpdate();
	msg = (result >0) ? "삭제 성공" : "삭제 실패";
} catch (Exception e) {
	e.printStackTrace();
	msg = "삭제 실패";
} finally {
	DBCPUtil.close(pstmt, conn);
}
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title><%=msg%></title>
</head>
<body>
	<h1>메시지 삭제</h1>
	<h2><%=msg%></h2>
	<a href="guestbook_list.jsp">[목록 보기]</a>
</body>
</html>