<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	session.removeAttribute("loginMember");
	Cookie cookie = new Cookie("loginCookie","");
	cookie.setMaxAge(0);
	response.addCookie(cookie);
	response.sendRedirect("index.jsp");
%>