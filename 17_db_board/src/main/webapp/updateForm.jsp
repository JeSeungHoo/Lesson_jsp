<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="conn.jsp"%>
<% 
	String num = request.getParameter("board_num");
	Statement stmt = null;
	ResultSet rs = null;
	String sql = "SELECT * FROM board_test WHERE board_num = " + num;
	String title = "";
	String auth = "";
	String content = "";
	try {
		stmt = conn.createStatement();
		rs = stmt.executeQuery(sql);
		if (rs.next()) {
			title = rs.getString("board_title");
			auth = rs.getString("board_auth");
			content = rs.getString("board_content");
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
	<title>게시글 수정</title>
</head>
<body>
	<form action="updateSubmit.jsp" method="post">
		<input type="hidden" name="board_num" value="<%=num%>" />
		<table>
			<tr>
				<td>제목</td>
				<td><input type="text" name ="board_title" value="<%=title%>" autofocus required /></td>
			</tr>
			<tr>
				<td>작성자</td>
				<td><input type="text" name ="board_auth" value="<%=auth%>" required /></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea name="board_content" rows="20" cols="50"><%=content%></textarea></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="수정완료" />
					<input type="reset" value="재작성" />
					<input type="button" value="메인으로" onclick="location.href='index.jsp'" />
				</td>
			</tr>
		</table>
	</form>
</body>
</html>