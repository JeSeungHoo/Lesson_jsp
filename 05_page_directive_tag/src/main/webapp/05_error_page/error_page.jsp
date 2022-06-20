<%@ page pageEncoding="UTF-8"%>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오잉?</title>
</head>
<body>
	<h1>인터넷의 상태가...?</h1>
	<a href="/05_page_directive_tag/">아무거나!</a>
	<br />
	<a href="../index.jsp">눌러!</a>
	<br />
	<%= exception.getMessage() %>
</body>
</html>