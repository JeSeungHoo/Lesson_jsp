<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="db.jsp"%>
<%request.setCharacterEncoding("UTF-8");%>
<jsp:useBean id="loginMember" class="vo.MemberVO" scope="session" />
<%
	if (!"admin".equals(loginMember.getId())) {
%>
<script>
	alert('접근할 수 없는 메뉴입니다!');
	history.go(-1);
</script>
<%		
	}
%>
<jsp:useBean id="updateMember" class="vo.MemberVO" />
<jsp:setProperty property="*" name="updateMember" />
<%
	String sql = "UPDATE test_member SET id = ?, pass = ?, name = ?, addr = ?, phone = ?, gender = ?, age = ? WHERE num = ?";
	String msg = "";
	try {
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, updateMember.getId());
		pstmt.setString(2, updateMember.getPass());
		pstmt.setString(3, updateMember.getName());
		pstmt.setString(4, updateMember.getAddr());
		pstmt.setString(5, updateMember.getPhone());
		pstmt.setString(6, updateMember.getGender());
		pstmt.setInt(7, updateMember.getAge());
		pstmt.setInt(8, updateMember.getNum());
		int result = pstmt.executeUpdate();
		msg = (result > 0) ? "수정 완료!" : "수정 실패";
	} catch (SQLException e) {
		e.printStackTrace();
	} finally {
		dbClose();
	}
%>
<script>
	alert('<%=msg%>');
	<%=msg.equals("수정 완료!") ? "location.href='index.jsp?page=memberList';" : "history.go(-1);"%>
</script>