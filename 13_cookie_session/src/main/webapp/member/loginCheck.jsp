<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="joinMember" class="beans.MemberBean"
		scope="application" />
	<%
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String login = request.getParameter("login");

	String message = "";
	String nextPage = "";

	if (joinMember.getId() == null) {
		message = "회원가입을 먼저 진행해주세요.";
		nextPage = "join.jsp";
	} else if (joinMember.getId().equals(id) && joinMember.getPw().equals(pw)) {
		message = "로그인 성공";
		nextPage = "index.jsp";
		session.setAttribute("loginMember", joinMember);
		if (login != null) {
			Cookie cookie = new Cookie("id", id);
			cookie.setMaxAge(60*60*24*7);
			response.addCookie(cookie);
		}
	} else {
		message = "아이디 혹은 비밀번호가 일치하지 않습니다.";
		nextPage = "login.jsp";
	}
	out.print("<script>");
	out.print("alert('" + message + "');");
	out.print("location.href='" + nextPage + "';");
	out.print("</script>");
	%>
</body>
</html>