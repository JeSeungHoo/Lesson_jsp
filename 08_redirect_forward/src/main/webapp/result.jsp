<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>Result</h1>
	<h3>page aaa : <%=pageContext.getAttribute("aaa")%></h3>
	<h3>request aaa : <%=request.getAttribute("aaa")%></h3>
	<h3>request id : <%=request.getParameter("id")%></h3>
	<h3>request answer: <%=request.getAttribute("answer")%></h3>
</body>
</html>