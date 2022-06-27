<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:useBean id="loginMember" class="vo.MemberVO" scope="session" />
<%
if (!"admin".equals(loginMember.getId())) {
	out.print("<script>alert('올바른 접근이 아닙니다.');history.back();</script>");
	return;
}
%>