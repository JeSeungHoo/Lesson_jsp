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
		pageContext.setAttribute("aaa","111");
		request.setAttribute("aaa", "111");
	%>
	<h3>page : <%=pageContext.getAttribute("aaa")%></h3>
	<h3>request : <%=request.getAttribute("aaa")%></h3>
	<a href="response?id=id001">response get</a>
	<a href="forward?id=id001"">forward get</a>
	<form action="response" method="post">
	 	<input type="text" name="id" value="id001" />
	 	<button>확인</button>
	</form>
	<br />
</body>
</html>