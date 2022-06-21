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
	request.setCharacterEncoding("UTF-8");
	String requestPage = request.getParameter("resultPage");
	// response.sendRedirect(requestPage);
	%>
	<jsp:forward page="<%=requestPage%>">
		<jsp:param value="010-1234-5678" name="tel" />
	</jsp:forward>
</body>
</html>