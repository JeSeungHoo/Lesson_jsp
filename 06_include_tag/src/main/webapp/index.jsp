<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>include</title>
</head>
<body>
	<%@ include file="./common/header.jsp" %>
	<h3>	index에 있는 내용이다.</h3>
	<p><%= h %></p>
	<p><%= f %></p>
	<p><strong>include된 파일의 변수는 공유 가능하다</strong></p>
	<hr />
	<%@ include file="./content.jsp" %>
	<%@ include file="./common/footer.jsp" %>
</body>
</html>