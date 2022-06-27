<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, vo.*" %>
<%
List<MemberVO> memberList = (List<MemberVO>) application.getAttribute("memberList");
MemberVO loginMember = (MemberVO) session.getAttribute("loginMember");
if (memberList.remove(loginMember)) {
	response.sendRedirect("logout.jsp");
}
%>