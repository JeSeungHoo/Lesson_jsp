<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="conn.jsp"%>
<%
	String sql = "DELETE FROM board_test WHERE board_num = " + request.getParameter("board_num");
	Statement stmt = null;
	String message = "";
	try {
		stmt = conn.createStatement();
		int result = stmt.executeUpdate(sql);
		message = (result > 0) ? "삭제 완료" : "삭제 오류";
	} catch (Exception e) {
		e.printStackTrace();
		message = "삭제 실패";
	} finally {
		if (stmt != null) stmt.close();
		if (conn != null) conn.close();
	}
%>
<script>
	alert('<%=message%>');
	location.href='index.jsp';
</script>