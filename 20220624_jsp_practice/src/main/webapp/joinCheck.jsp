<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="db.jsp"%>
<%request.setCharacterEncoding("UTF-8");%>
<jsp:useBean id="joinMember" class="vo.MemberVO" />
<jsp:setProperty property="*" name="joinMember" />
<%
	String sql = "INSERT INTO test_member VALUES (NULL, ?, ?, ?, ?, ?, ?, ?)";
	String msg = "";
	try {
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, joinMember.getId());
		pstmt.setString(2, joinMember.getPass());
		pstmt.setString(3, joinMember.getName());
		pstmt.setString(4, joinMember.getAddr());
		pstmt.setString(5, joinMember.getPhone());
		pstmt.setString(6, joinMember.getGender());
		pstmt.setInt(7, joinMember.getAge());
		int result = pstmt.executeUpdate();
		msg = (result > 0) ? "회원가입 성공!" : "회원가입 실패";
	} catch (SQLException e) {
		msg = "이미 사용중인 아이디입니다.";
	} finally {
		dbClose();
	}
%>
<script>
	alert('<%=msg%>');
	<%=msg.equals("회원가입 성공!") ? "location.href='index.jsp?page=login';" : "history.go(-1);"%>
</script>