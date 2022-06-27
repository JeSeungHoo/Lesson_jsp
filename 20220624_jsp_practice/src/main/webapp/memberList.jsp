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
	String sql = "SELECT * FROM test_member";
	try {
		stmt = conn.createStatement();
		rs = stmt.executeQuery(sql);
	} catch (Exception e) {
		System.out.println("=====memberList 오류=====");
		e.printStackTrace();
		System.out.println("=====memberList 오류=====");
	}
%>
<table border="1">
	<tr>
		<th colspan="7">회원목록</th>
	</tr>
	<tr>
		<th>번호</th>
		<th>아이디</th>
		<th>이름</th>
		<th>주소</th>
		<th>전화번호</th>
		<th>성별</th>
		<th>나이</th>
	</tr>
	<%
	while (rs.next()) {
	%>
	<tr onclick="location.href='index.jsp?page=memberInfo&num=<%=rs.getString("num")%>'">
		<th><%=rs.getInt("num")%></th>
		<th><%=rs.getString("id")%></th>
		<th><%=rs.getString("name")%></th>
		<th><%=rs.getString("addr")%></th>
		<th><%=rs.getString("phone")%></th>
		<th><%=rs.getString("gender")%></th>
		<th><%=rs.getInt("age")%></th>
	</tr>
	<%				
	}
	dbClose();
	%>
</table>