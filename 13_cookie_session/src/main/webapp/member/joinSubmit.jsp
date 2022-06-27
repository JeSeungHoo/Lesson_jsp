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
	%>
	<jsp:useBean id="joinMember" class="beans.MemberBean" scope="application"/>
	<jsp:setProperty property="*" name="joinMember" />
	<%=application.getAttribute("joinMember")%>
	<br />
	<a href="./index.jsp">메인화면으로</a>
</body>
</html>