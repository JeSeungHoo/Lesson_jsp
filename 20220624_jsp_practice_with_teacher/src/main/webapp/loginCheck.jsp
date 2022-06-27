<%@page import="java.sql.*, util.*" language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="loginMember" class="vo.MemberVO" />
<jsp:setProperty name="loginMember" property="*" />
<!-- id와 password가 등록되어 있을 것 -->
<%
Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;
String msg = "";
String nextPage = "";
conn = JDBCUtil.getConnection();
String sql = "SELECT * FROM test_member WHERE id = ? AND pass =?";
try {
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, loginMember.getId());
	pstmt.setString(2, loginMember.getPass());
	rs = pstmt.executeQuery();
	if (rs.next()) {
		loginMember.setNum(rs.getInt("num"));
		loginMember.setName(rs.getString("name"));
		loginMember.setAddr(rs.getString("addr"));
		loginMember.setPhone(rs.getString("phone"));
		loginMember.setGender(rs.getString("gender"));
		loginMember.setAge(rs.getInt("age"));
		session.setAttribute("loginMember", loginMember);
		msg = "로그인 성공";
		nextPage = "default";
		String login = request.getParameter("login");
		if (login != null) {
			Cookie cookie = new Cookie("id", loginMember.getId());
			cookie.setMaxAge(Integer.MAX_VALUE);
			response.addCookie(cookie);
		}
	} else {
		msg = "로그인 실패";
		nextPage = "login";
	}
} catch (Exception e) {
	msg = "로그인 실패";
	nextPage = "login";
} finally {
	JDBCUtil.close(rs, pstmt, conn);
	out.print("<script>alert('" + msg + "');location.href='index.jsp?page=" + nextPage + "';</script>");
}
%>