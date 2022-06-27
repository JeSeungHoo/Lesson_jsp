<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="insert.jsp" method="post">
		이름 : <input type="text" name="name" />
		주소 : <input type="text" name="addr" />
		<button>등록</button>
	</form>
	<a href="<%=request.getContextPath()%>">메인으로</a>
</body>
</html>