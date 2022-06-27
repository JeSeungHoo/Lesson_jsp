<%@page import="java.util.*, vo.*"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
List<MemberVO> memberList = (ArrayList<MemberVO>) (application.getAttribute("memberList"));
if (memberList == null) {
	memberList = new ArrayList<>();
	application.setAttribute("memberList", memberList);
}
System.out.println(memberList);
MemberVO loginMember = (MemberVO) session.getAttribute("loginMember");
Cookie[] cookies = request.getCookies();
if (loginMember == null && cookies != null) {
	for (Cookie c : cookies) {
		if (c.getName().equals("rememberMe")) {
			for (MemberVO m : memberList) {
				if (m.getId().equals(c.getValue())) {
					loginMember = m;
					session.setAttribute("loginMember", m);
					break;
				}
			}
			break;
		}
	}
}
%>
<ul>
	<li><a href="index.jsp">HOME</a></li>
	<% if (loginMember != null) {%>
	<li><a href="index.jsp?page=info"><%=loginMember.getName()%>님 반갑습니다.</a></li>
	<li><a href="logout.jsp">로그아웃</a></li>
	<% } else { %>
	<li><a href="index.jsp?page=login">로그인</a></li>
	<li><a href="index.jsp?page=join">회원가입</a></li>
	<% } %>
</ul>