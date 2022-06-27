<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<a href="test/test_500.jsp">test 500</a> <br />
	<a href="test/page_error.jsp">test page error</a> <br />
	<a href="test/test_number.jsp">test exception error</a> <br />
	<a href="wow.jsp">test 404</a> <br />
	<a href="test/test_403.jsp">test 403</a>
	<h4>우선순위</h4>
	<p>errorPage > exception-type > error-code</p>
</body>
</html>