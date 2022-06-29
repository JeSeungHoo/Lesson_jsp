<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>정말로 삭제하시겠습니까?</title>
</head>
<body>
	<h1>메시지 삭제 확인</h1>
	<form action="guestbook_delete.jsp" method="post">
		<input type="hidden" name="id" value="<%=request.getParameter("id")%>"/>
		<p><%=request.getParameter("id")%>번 메시지를 삭제하시려면 비밀번호를 입력하세요</p>
		<input type="password" name="password" />
		<input type="submit" value="삭제" />
	</form>
</body>
</html>