<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="memberList" scope="application"
	class="java.util.ArrayList" type="java.util.ArrayList<vo.MemberVO>" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%request.setCharacterEncoding("UTF-8");%>
	<jsp:useBean id="m" class="vo.MemberVO" />
	<jsp:setProperty property="*" name="m" />
	<%
	if (memberList.contains(m)) {
	%>
	<script>
		alert('이미 존재하는 아이디입니다!');
		location.href = 'index.jsp?page=join';
	</script>
	<%
	} else {
		memberList.add(m);
	%>
	<script>
		alert('회원가입 성공!');
		location.href = 'index.jsp';
	</script>
	<%
	}
	%>
</body>
</html>