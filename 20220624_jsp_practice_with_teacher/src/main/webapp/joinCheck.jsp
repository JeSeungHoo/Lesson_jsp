<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.sql.*, util.*"%>
<%
request.setCharacterEncoding("UTF-8");
/* 
vo. MemberVO joinMember = (vo.MemberVO) pageContext.getAttribute("joinMember");
if (joinMember == null) {
	joinMember = new vo.MemberVO();
	pageContext.setAttribute("joinMember", joinMember);
} 
== <jsp:useBean id="joinMember" class="vo.MemberVO" /> 
*/
%>
<jsp:useBean id="joinMember" class="vo.MemberVO" />
<jsp:setProperty name="joinMember" property="*" />
<%=joinMember%>
<%
Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;
String msg = "";
String nextPage = "";
try {
	conn = JDBCUtil.getConnection();
	String sql = "SELECT id FROM test_member WHERE id = ?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, joinMember.getId());
	rs = pstmt.executeQuery();
	if (rs.next()) {
		msg = "이미 사용중인 아이디입니다.";
		nextPage = "join";
	} else {
		if (pstmt != null) pstmt.close();
		sql = "INSERT INTO test_member VALUES(NULL, ?, ?, ?, ?, ?, ?, ?)";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, joinMember.getId());
		pstmt.setString(2, joinMember.getPass());
		pstmt.setString(3, joinMember.getName());
		pstmt.setString(4, joinMember.getAddr());
		pstmt.setString(5, joinMember.getPhone());
		pstmt.setString(6, joinMember.getGender());
		pstmt.setInt(7, joinMember.getAge());
		if (pstmt.executeUpdate() > 0) {
	msg = "회원가입 완료";
	nextPage = "login";
		}
	}
} catch (Exception e) {
	e.printStackTrace();
	msg = "회원가입 실패";
	nextPage = "join";
} finally {
	JDBCUtil.close(rs, pstmt, conn);
	out.print("<script>alert('" + msg + "');location.href='index.jsp?page=" + nextPage + "';</script>");
}
%>