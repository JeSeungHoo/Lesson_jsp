<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="connection.jsp"%>
<%
	String sql = "SELECT * FROM member WHERE num = ?";
	String mNum = request.getParameter("num");
	int num = 0;
	if (mNum == null) {
		out.print("<script>alert('OMG');history.go(-1);</script>");
		return;
	}
	num = Integer.parseInt(mNum);
	PreparedStatement pstmt = conn.prepareStatement(sql);
	pstmt.setInt(1, num);
	ResultSet rs = pstmt.executeQuery();
	String name = "";
	String addr = "";
	if (rs.next()) {
		name = rs.getString("name");
		addr = rs.getString("addr");
}
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
</head>
<body>
	<form action="update.jsp" method="post">
		번호 : <input type="text" name="num" value="<%=num%>" />
		이름 : <input type="text" name="name" value="<%=name%>" />
		주소 : <input type="text" name="addr" value="<%=addr%>" />
		<button>수정완료</button>
	</form>
</body>
</html>