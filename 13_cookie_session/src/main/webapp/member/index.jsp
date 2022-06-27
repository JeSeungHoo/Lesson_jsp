<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="joinMember" class="beans.MemberBean" scope="application" />
<jsp:useBean id="loginMember" class="beans.MemberBean" scope="session" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>Homepage</h1>
	<%
	request.setCharacterEncoding("UTF-8");
	Cookie[] cookies = request.getCookies();
	if (cookies != null && joinMember.getId() != null && loginMember.getId() == null){
		for (Cookie c : cookies){
			if(c.getName().equals("id")){
				if(c.getValue().equals(joinMember.getId())){
					session.setAttribute("loginMember", joinMember);
					loginMember = joinMember;
				}
			}
		}
	}
	%>
	<%
	String name = loginMember.getName();
	if (name != null){
	%>
	<%=name%>님 안녕하세요 | <a href="logout.jsp">로그아웃</a>
	<%
	} else {
	%>
	<a href="./join.jsp">회원가입</a> <br />
	<a href="./login.jsp">로그인</a> <br />
	<%	
	}
	%>
</body>
</html>
