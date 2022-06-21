<%@page import="test.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>Beans Result</h1>
	<%
	request.setCharacterEncoding("UTF-8");
	String name = request.getParameter("name");
	String addr = request.getParameter("addr");
	String email = request.getParameter("email");
	UserVO vo = new UserVO(name, addr, email);
	session.setAttribute("vo", vo);
	%>
	<p><%=session.getAttribute("vo")%></p>
	<jsp:useBean id="user" class="test.UserVO" scope="session" />
	<!-- 따로 value가 없으면 request의 parameter에서 자동으로 같은 propery 찾음 -->
	<%-- <jsp:setProperty property="name" name="user" />
	<jsp:setProperty property="addr" name="user" />
	<jsp:setProperty property="email" name="user" /> --%>
	<jsp:setProperty property="*" name="user" />
	<p><%=session.getAttribute("user")%></p>
</body>
</html>