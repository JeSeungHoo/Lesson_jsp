<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="util.DBCPUtil" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="updateBoard" class="vo.BoardVO" />
<jsp:setProperty name="updateBoard" property="*" />
<%=updateBoard%>
<%
Connection conn = DBCPUtil.getConnection();
PreparedStatement pstmt = null;
String msg = "";
String sql = "UPDATE tblBoard SET boardTitle = ?, boardAuth = ?, boardContent =? WHERE boardNum = ?";
try {
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, updateBoard.getBoardTitle());
	pstmt.setString(2, updateBoard.getBoardAuth());
	pstmt.setString(3, updateBoard.getBoardContent());
	pstmt.setInt(4, updateBoard.getBoardNum());
	int result = pstmt.executeUpdate();
	if (result > 0) {
		msg = "수정 완료";
	} else {
		msg = "수정 실패";
	}
} catch (Exception e) {
	e.printStackTrace();
	msg = "수정 실패";
} finally {
	DBCPUtil.close(pstmt, conn);
}
%>
<script>
	alert('<%=msg%>');
	location.href= 'board_read.jsp?boardNum=<%=updateBoard.getBoardNum()%>';
</script>