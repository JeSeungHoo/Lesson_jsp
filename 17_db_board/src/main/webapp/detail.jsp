<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="conn.jsp"%>
<%
	String num = request.getParameter("board_num");
	String sql = "SELECT * FROM board_test WHERE board_num = " + num;
	String title = "";
	String auth = "";
	String content = "";
	java.util.Date date = null;
	Statement stmt = null;
	ResultSet rs = null;
	try {
		stmt = conn.createStatement();
		rs = stmt.executeQuery(sql);
		if (rs.next()) {
			title = rs.getString("board_title");
			auth = rs.getString("board_auth");
			content= rs.getString("board_content");
			date = rs.getDate("board_date");
		}
	} catch (Exception e) {
		e.printStackTrace();		
	} finally {
		if (rs != null) rs.close();
		if (stmt != null) stmt.close();
		if (conn != null) conn.close();
	}
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title><%=num%>번 게시글 보기</title>
</head>
<body>
	<table>
		<tr>
			<th colspan="2">게시글 상세보기</th>
		</tr>
		<tr>
			<td>제목</td>
			<td><%=title%></td>
		</tr>
		<tr>
			<td>작성자</td>
			<td><%=auth%></td>
		</tr>
		<tr>
			<td>내용</td>
			<td><%=content%></td>
		</tr>
		<tr>
			<td>내용</td>
			<td><%=date.toLocaleString()%></td>
		</tr>
		<tr>
			<th colspan="2"><input type="button" value="메인으로" onclick="location.href='index.jsp'"/>
		</tr>
	</table>
</body>
</html>