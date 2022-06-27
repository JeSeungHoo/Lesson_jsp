<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*, util.*"%>
 <!-- header.jsp -->
 
<%
 Cookie[] cookies = request.getCookies();
 if (cookies != null) {
	 for (Cookie c : cookies) {
		 if (c.getName().equals("id")) {
			 String id = c.getValue();
			 Connection conn = null;
			 PreparedStatement pstmt = null;
			 ResultSet rs = null;
			 conn = JDBCUtil.getConnection();
			 String sql = "SELECT * FROM test_member WHERE id = ?";
			 try {
				 pstmt = conn.prepareStatement(sql);
				 pstmt.setString(1, id);
				 rs = pstmt.executeQuery();
				 if (rs.next()) {
					 vo.MemberVO vo = new vo.MemberVO();
					 vo.setNum(rs.getInt("num"));
					 vo.setId(rs.getString("id"));
					 vo.setPass(rs.getString("pass"));
					 vo.setName(rs.getString("name"));
					 vo.setAddr(rs.getString("addr"));
					 vo.setPhone(rs.getString("phone"));
					 vo.setGender(rs.getString("gender"));
					 vo.setAge(rs.getInt("age"));
					 session.setAttribute("loginMember", vo);
				 }
			 } catch (Exception e) {
				 e.printStackTrace();
			 } finally {
				 JDBCUtil.close(rs, pstmt, conn);
			 }
		 }
	 }
 }
 %>
 <jsp:useBean id="loginMember" class="vo.MemberVO" scope="session" />
<ul>
	<li><a href="index.jsp">home</a></li>
	<%
	if (loginMember.getName() == null) {
	%>
	<li><a href="index.jsp?page=login">로그인</a></li>
	<li><a href="index.jsp?page=join">회원가입</a></li>
	<%
	} else {
	%>
	<li><a href="index.jsp?page=info"><jsp:getProperty
				name="loginMember" property="name" />님 방가방가</a></li>
	<%
		if (loginMember.getId().equals("admin")) {
	%>
	<li><a href="index.jsp?page=memberList">회원관리</a></li>
	<%
		}
	%>
	<li><a href="logout.jsp">로그아웃</a> 
	<%
	 }	
 	%>
</ul>








