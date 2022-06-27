<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="db.jsp"%>
<jsp:useBean id="loginMember" class="vo.MemberVO" scope="session" />
<%
	if (!"admin".equals(loginMember.getId())) {
%>
<script>
	alert('접근할 수 없는 메뉴입니다!');
	history.go(-1);
</script>
<%		
	}
%>
<%
	request.setCharacterEncoding("UTF-8");
	String sql = "SELECT * FROM test_member WHERE num = " + request.getParameter("num");
	try {
		stmt = conn.createStatement();
		rs = stmt.executeQuery(sql);
		rs.next();
	} catch (Exception e) {
		System.out.println("=====memberInfo 오류=====");
		e.printStackTrace();
		System.out.println("=====memberInfo 오류=====");
	}
%>
<script type="text/javascript" src="js/inputCheck.js"></script>
<form action="memberUpdate.jsp" method="POST">
	<input type="hidden" name="num" value=<%=Integer.parseInt(request.getParameter("num"))%> />
	<table>
		<tr>
			<td colspan="2"><h1>회원가입</h1></td>
		</tr>
		<tr>
			<td>아이디</td>
			<td>
				<input type="text" name="id" data-msg="아이디" value="<%=rs.getString("id")%>" readonly />
			</td>
		</tr>
		<tr>
			<td>비밀번호</td>
			<td>
				<input type="password" name="pass" data-msg="비밀번호" value="<%=rs.getString("pass")%>"/>
			</td>
		</tr>
		<tr>
			<td>이름</td>
			<td>
				<input type="text" name="name" data-msg="이름" value="<%=rs.getString("name")%>" />
			</td>
		</tr>
		<tr>
			<td>주소</td>
			<td>
				<input type="text" name="addr" data-msg="주소" value="<%=rs.getString("addr")%>" />
			</td>
		</tr>
		<tr>
			<td>전화번호</td>
			<td>
				<input type="text" name="phone" data-msg="전화번호" value="<%=rs.getString("phone")%>" />
			</td>
		</tr>
		<tr>
			<td>성별</td>
			<td>
				<label>
				<input type="radio" name="gender" value="남성" <%=rs.getString("gender").equals("남성") ? "checked" : ""%> />
				남성
				</label>
				<label>
				<input type="radio" name="gender" value="여성" <%=rs.getString("gender").equals("여성") ? "checked" : ""%>/>
				여성
				</label>
			</td>
		</tr>
		<tr>
			<td>나이</td>
			<td>
				<input type="number" name="age" data-msg="나이" value="<%=rs.getInt("age")%>"/>
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<button>회원가입</button>
			</td>
		</tr>
	</table>
</form>
<%dbClose();%>