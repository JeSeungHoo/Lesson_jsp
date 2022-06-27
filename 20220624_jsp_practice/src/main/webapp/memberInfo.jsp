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
<table>
	<tr>
		<th colspan="2"><%=rs.getInt("num")%>번 회원의 정보</th>
	</tr>
	<tr>
		<td>아이디</td>
		<td><%=rs.getString("id")%></td>
	</tr>
	<tr>
		<td>이름</td>
		<td><%=rs.getString("id")%></td>
	</tr>
	<tr>
		<td>주소</td>
		<td><%=rs.getString("id")%></td>
	</tr>
	<tr>
		<td colspan="2">
			<a href="index.jsp?page=memberUpdateForm&num=<%=rs.getString("num")%>">수정</a>
			<% if (!rs.getString("id").equals("admin")) { %>
			|
			<a id="delete" href="withdraw.jsp?num=<%=rs.getString("num")%>">삭제</a>
			<% } %>
		</td>
	</tr>
</table>
<script>
	window.onload = function(){
		let link = document.querySelector("#delete");
		link.onclick = function(event){
			let bool = confirm("<%=rs.getString("num")%>회원 정보를 정말로 삭제하시겠습니까?");
			if (!bool) {
				event.preventDefault();
			}
		}
	}
</script>
<%dbClose();%>