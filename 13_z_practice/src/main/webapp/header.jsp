<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="memberList" scope="application"
	class="java.util.ArrayList" type="java.util.ArrayList<vo.MemberVO>" />
<jsp:useBean id="loginMember" class="vo.MemberVO" scope="session" />
<header>
	<a href="index.jsp?page=default">home</a>
	<%
	if (loginMember.getId() == null) {
	%>
	<a href="index.jsp?page=login">로그인</a>
	<a href="index.jsp?page=join">회원가입</a>
	<%
	} else {
	%>
	<a href="index.jsp?page=info">
		<%=loginMember.getName()%>님 반갑습니다.
	</a> 
	<a href="logout.jsp">로그아웃</a>
	<%
	}
	%>
	<hr />
</header>