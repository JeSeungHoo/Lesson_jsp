<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="conn.jsp"%>
<%
	request.setCharacterEncoding("UTF-8");
	String num = request.getParameter("board_num");
	String title = request.getParameter("board_title");
	String auth = request.getParameter("board_auth");
	String content = request.getParameter("board_content");
	String sql = "UPDATE board_test SET board_title = ?, board_auth = ?, board_content = ? WHERE board_num = " + num;
	PreparedStatement pstmt = null;
	String message = "";
	try {
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, title);
		pstmt.setString(2, auth);
		pstmt.setString(3, content);
		int result = pstmt.executeUpdate();
		message = (result > 0) ? "수정 완료" : "수정 오류";
	} catch (Exception e) {
		e.printStackTrace();
		message = "수정 실패";
	} finally {
		if (pstmt != null) pstmt.close();
		if (conn != null) conn.close();
	}
%>
<script>
	alert('<%=message%>');
	location.href='index.jsp';
</script>