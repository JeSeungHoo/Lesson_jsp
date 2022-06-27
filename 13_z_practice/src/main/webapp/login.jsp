<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<form action="loginCheck.jsp" method="post">
	<table cellspacing="10">
		<tr>
			<th colspan="2">로그인</th>
		</tr>
		<tr>
			<td>아이디</td>
			<td><input type="text" name="id" required /></td>
		</tr>
		<tr>
			<td>비밀번호</td>
			<td><input type="text" name="pass" required /></td>
		</tr>
		<tr>
			<td colspan="2">
				<label> 
					<input type="checkbox" name="login" value="login" /> 
					로그인 상태 유지
				</label>
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<button>로그인</button>
			</td>
		</tr>
	</table>
</form>
</body>
</html>