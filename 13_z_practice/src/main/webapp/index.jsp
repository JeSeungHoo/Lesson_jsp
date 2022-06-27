<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="memberList" scope="application"
	class="java.util.ArrayList" type="java.util.ArrayList<vo.MemberVO>" />
<jsp:useBean id="loginMember" class="vo.MemberVO" scope="session" />
<%
Cookie[] cookies = request.getCookies();
if (loginMember.getId() == null && cookies != null) {
	a: for (Cookie c : cookies) {
		if (c.getName().equals("id")) {
			for (vo.MemberVO m : memberList) {
				if (m.getId().equals(c.getValue())) {
					session.setAttribute("loginMember", m);
					break a;
				}
			}
		}
	}
}
%>
<!DOCTYPE html>
<html>
<head>
<style>
body {
	margin: 0 auto;
	width: 900px;
}

div {
	box-sizing: border-box;
}

div#header, div#footer {
	height: 100px;
}

div#header {
	text-align: right;
	padding-top: 60px;
}

div#body {
	height: 500px;
	display: flex;
	flex-direction: column;
	text-align: center;
}

div#body * {
	margin: auto;
}

div#footer {
	text-align: center;
}

th{
	font-size: 24px;
}


</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	String bodyPage = request.getParameter("page");
	if (bodyPage == null) {
		bodyPage = "default";
	}
	bodyPage += ".jsp";
	%>
	<div id="header">
		<jsp:include page="header.jsp" />
	</div>
	<div id="body">
		<jsp:include page="<%=bodyPage%>" />
	</div>
	<div id="footer">
		<jsp:include page="footer.jsp" />
	</div>
</body>
</html>