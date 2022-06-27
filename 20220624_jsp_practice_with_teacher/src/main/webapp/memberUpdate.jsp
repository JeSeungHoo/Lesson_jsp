<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="checkAdmin.jsp" %>
<%@page import="java.sql.*, util.*, vo.*"%>
<%
request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="m" class="vo.MemberVO" />
<jsp:setProperty name="m" property="*" />
<%
Connection conn = DBCPUtil.getConnection();
PreparedStatement pstmt = null;
try {
	pstmt =conn.prepareStatement("UPDATE test_member SET pass = ?, name = ?, addr = ?, phone =?, gender =?, age = ? WHERE id = ?");
	pstmt.setString(1, m.getPass());
	pstmt.setString(2, m.getName());
	pstmt.setString(3, m.getAddr());
	pstmt.setString(4, m.getPhone());
	pstmt.setString(5, m.getGender());
	pstmt.setInt(6, m.getAge());
	pstmt.setString(7, m.getId());
	pstmt.executeUpdate();
} catch (Exception e) {
	e.printStackTrace();
} finally {
	DBCPUtil.close(pstmt, conn);
	response.sendRedirect("index.jsp?page=memberList");
}
%>