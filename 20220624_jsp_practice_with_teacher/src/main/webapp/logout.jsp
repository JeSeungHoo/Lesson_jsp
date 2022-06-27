<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
session.removeAttribute("loginMember");
Cookie cookie = new Cookie("id", "");
cookie.setMaxAge(0);
response.addCookie(cookie);
%>
<script>
	alert('처리 완료');
	location.href='index.jsp';
</script>