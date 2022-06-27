<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>Error Page</h1>
	<h1>잘못된 값이 전달되었습니다</h1>
	<h2><%=exception.getMessage()%></h2>
	<h2><%=exception.toString()%></h2>
	<a href="../">메인으로</a>
</body>
</html>