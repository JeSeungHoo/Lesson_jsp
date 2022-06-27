<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	Cookie cookie = new Cookie("id","");
	cookie.setMaxAge(0);
	response.addCookie(cookie);
	session.removeAttribute("loginMember");
	%>
	<script>
		alert('로그아웃 완료!');
		location.href='index.jsp';
	</script>
</body>
</html>