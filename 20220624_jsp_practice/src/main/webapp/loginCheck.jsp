<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="db.jsp"%>
<%
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	String pass = request.getParameter("pass");
	String login = request.getParameter("login");
	String sql = "SELECT * FROM test_member WHERE id = ? AND pass = ?";
	String msg = "로그인 실패";
	try {
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		pstmt.setString(2, pass);
		rs = pstmt.executeQuery();
		if (rs.next()) {
			vo.MemberVO dbMember = new vo.MemberVO();
			dbMember.setAddr(rs.getString("addr"));
			dbMember.setAge(rs.getInt("age"));
			dbMember.setGender(rs.getString("gender"));
			dbMember.setId(rs.getString("id"));
			dbMember.setName(rs.getString("name"));
			dbMember.setNum(rs.getInt("num"));
			dbMember.setPass(rs.getString("pass"));
			dbMember.setPhone(rs.getString("phone"));
			session.setAttribute("loginMember", dbMember);
			if (login != null) {
				Cookie cookie = new Cookie("loginCookie",rs.getString("id"));
				cookie.setMaxAge(60*60*24*7);
				response.addCookie(cookie);
			}
			msg = "로그인 성공!";
		}
	} catch (Exception e) {
		msg = "로그인 실패";
		System.out.println("==========login 오류==========");
		e.printStackTrace();
		System.out.println("==========login 오류==========");
	} finally {
		dbClose();
	}
%>
<script>
	alert('<%=msg%>');
	<%=msg.equals("로그인 성공!") ? "location.href='index.jsp';" : "location.href='index.jsp?page=login';"%>
</script>