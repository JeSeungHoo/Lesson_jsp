<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>include test1</title>
</head>
<body>
	<%response.addHeader("aaa", "AAA");%>
	<h1>include test1</h1>
	<%--
		directive tag로 include하면 하나의 서블릿으로 생성 
		<%@ include file="include2.jsp"%>
	 --%>
	 
	 <!-- action tag로 include하면 별개의 서블릿 -->
	<jsp:include page="include2.jsp">
		<jsp:param value="star" name="name" /> <!-- include2로 파라미터 전달 -->
	</jsp:include>
	
	<%-- <%=str%> include2에서 선언된 변수 공유 불가--%>
</body>
</html>