<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.*, util.DBCPUtil"%>
<%
request.setCharacterEncoding("UTF-8");
String title = request.getParameter("boardTitle");
String auth = request.getParameter("boardAuth");
String content = request.getParameter("boardContent");
Connection conn = DBCPUtil.getConnection();
PreparedStatement pstmt = null;
String msg = "";
String sql = "INSERT INTO tblBoard VALUES (NULL, ?, ?, ?, 0, now())";
try {
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, title);
	pstmt.setString(2, auth);
	pstmt.setString(3, content);
	int result = pstmt.executeUpdate();
	if (result >0) {
		msg = "게시글 작성 완료";
	} else {
		msg = "게시글 작성 실패";
	}
} catch (Exception e) {
	e.printStackTrace();
	msg = "작성 실패";
} finally {
	DBCPUtil.close(pstmt, conn);
}
%>
<script>
	alert('<%=msg%>');
	location.href="board_list_page.jsp";
</script>