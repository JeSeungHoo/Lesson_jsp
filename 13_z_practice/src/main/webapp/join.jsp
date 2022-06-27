<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<form action="joinCheck.jsp" method="post">
	<table cellspacing="10">
		<tr>
			<th colspan="2">회원가입</th>
		</tr>
		<tr>
			<td>아이디</td>
			<td><input type="text" name="id" required /></td>
		</tr>
		<tr>
			<td>비밀번호</td>
			<td><input type="password" name="pass" required /></td>
		</tr>
		<tr>
			<td>이름</td>
			<td><input type="text" name="name" required /></td>
		</tr>
		<tr>
			<td>주소</td>
			<td><input type="text" name="addr" required /></td>
		</tr>
		<tr>
			<td>전화번호</td>
			<td><input type="text" name="phone" required /></td>
		</tr>
		<tr>
			<td>성별</td>
			<td>
				<input type="radio" name="gender" value="male" checked /> 남성
				<input type="radio" name="gender" value="female" /> 여성
			</td>
		</tr>
		<tr>
			<td>나이</td>
			<td><input type="number" name="age" required /></td>
		</tr>
		<tr>
			<td colspan="2">
				<button>회원가입</button>
			</td>
		</tr>
	</table>
</form>