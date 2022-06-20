<%@ page pageEncoding="UTF-8"%>
<%@ page errorPage="error_page.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오류가 발생하는 페이지입니다.</title>
</head>
<body>
	<%
		String name = request.getParameter("name");
		out.println(name.toString());
	%>
</body>
</html>