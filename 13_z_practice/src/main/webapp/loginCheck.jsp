<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="memberList" scope="application"
	class="java.util.ArrayList" type="java.util.ArrayList<vo.MemberVO>" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	String pass = request.getParameter("pass");
	String login = request.getParameter("login");
	for (vo.MemberVO m : memberList) {
		if (m.getId().equals(id) && m.getPass().equals(pass)) {
			session.setAttribute("loginMember", m);
			if (login != null) {
				Cookie cookie = new Cookie("id", id);
				cookie.setMaxAge(60 * 60 * 24 * 7);
				response.addCookie(cookie);
			}
	%>
	<script>
		alert('로그인 성공!');
		location.href = 'index.jsp';
	</script>
	<%
		}
	}
	%>
	<script>
		alert('일치하는 회원 정보가 없습니다!');
		location.href = 'index.jsp?page=login';
	</script>
</body>
</html>