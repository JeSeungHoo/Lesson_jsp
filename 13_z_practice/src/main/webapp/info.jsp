<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="loginMember" class="vo.MemberVO" scope="session" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	if (loginMember.getId() != null) {
	%>
	<table  cellspacing="10">
		<tr>
			<td>
				아이디
			</td>
			<td>
				<%=loginMember.getId()%>
			</td>
		</tr>
		<tr>
			<td>
				비밀번호
			</td>
			<td>
				<%=loginMember.getPass()%>
			</td>
		</tr>
		<tr>
			<td>
				이름
			</td>
			<td>
				<%=loginMember.getName()%>
			</td>
		</tr>
		<tr>
			<td>
				주소
			</td>
			<td>
				<%=loginMember.getAddr()%>
			</td>
		</tr>
		<tr>
			<td>
				전화번호
			</td>
			<td>
				<%=loginMember.getPhone()%>
			</td>
		</tr>
		<tr>
			<td>
				성별
			</td>
			<td>
				<%
				String gender = loginMember.getGender();
				if(gender.equals("male")){
				%>
				<input type="radio" name="gender" checked disabled /> 남성
				<input type="radio" name="gender" disabled /> 여성
				<%
				} else {
				%>
				<input type="radio" name="gender" disabled /> 남성
				<input type="radio" name="gender" checked disabled /> 여성
				<%	
				}
				%>
			</td>
		</tr>
		<tr>
			<td>
				나이
			</td>
			<td>
				<%=loginMember.getAge()%>
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<button onclick="location.href='index.jsp'">메인</button>			
			</td>
		</tr>
	</table>
	<%
	} else {
	%>
	<script>
		alert('먼저 로그인을 하세요!');
		location.href='index.jsp';
	</script>
	<%
	}
	%>
</body>
</html>