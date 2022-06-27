<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="db.jsp"%>
<jsp:useBean id="loginMember" class="vo.MemberVO" scope="session" />
<%
String num = request.getParameter("num");
if (num == null) {
	num = String.valueOf(loginMember.getNum());
}
request.setCharacterEncoding("UTF-8");
String sql = "DELETE FROM test_member WHERE num = " + num;
boolean bool = false;
try {
	stmt = conn.createStatement();
	int result = stmt.executeUpdate(sql);
	if (result > 0) {
		bool = true;		
	}
} catch (Exception e) {
	e.printStackTrace();
} finally {
	dbClose();
}
if (bool) {
%>
	<script>
	alert('삭제되었습니다.');
<%		
	if (loginMember.getId().equals("admin")) {
%>
		location.href='index.jsp?page=memberlist';
<%			
	} else {
%>
		location.href='logout.jsp';
<%			
	}
%>
	</script>
<%
} else {
%>
	<script>
	alert('오류발생!');
	history.go(-1);
	</script>
<%
}
%>