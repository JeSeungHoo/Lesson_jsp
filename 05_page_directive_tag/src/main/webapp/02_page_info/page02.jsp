<%@page import="java.util.Date"%>
<%@ page pageEncoding="UTF-8" %>
<%@ page info="Date 클래스를 이용한 날짜 출력하기" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>info</title>
</head>
<body>
	Today is <%= new Date() %>
	<br />
	<%= getServletInfo() %>
</body>
</html>