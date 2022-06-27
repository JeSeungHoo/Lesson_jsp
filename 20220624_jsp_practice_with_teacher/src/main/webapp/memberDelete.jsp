<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="checkAdmin.jsp"%>
<%@page import="java.sql.*, util.*"%>
<%
String num = request.getParameter("num");
Connection conn = null;
Statement stmt = null;
try {
	conn = DBCPUtil.getConnection();
	stmt = conn.createStatement();
	stmt.executeUpdate("DELETE FROM test_member WHERE num = " + num);
} catch (Exception e) {
	e.printStackTrace();
} finally {
	DBCPUtil.close(stmt, conn);
	response.sendRedirect("index.jsp?page=memberList");
}
%>