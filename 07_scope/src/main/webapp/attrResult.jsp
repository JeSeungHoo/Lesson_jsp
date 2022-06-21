<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>Attribute Result</h1>
	<h3>pageContext attr : <%=pageContext.getAttribute("page")%></h3>
	<h3>request attr : <%=request.getAttribute("request")%></h3>
	<h3>session email : <%=session.getAttribute("email")%></h3>
	<h3>application id : <%=application.getAttribute("id")%></h3>
</body>
</html>