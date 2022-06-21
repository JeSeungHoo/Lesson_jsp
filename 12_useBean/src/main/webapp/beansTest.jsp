<%@page import="test.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>Beans Test</h1>
	<%
	Member member = null;
	if (pageContext.findAttribute("member") == null) {
		member = new Member();
		System.out.println(member.getName());
		member.setName("김연아");
		pageContext.setAttribute("member", member);
	} else {
		member = (Member) pageContext.findAttribute("member");
	}
	%>
	<%=pageContext.getAttribute("member")%>
	<br />
	<jsp:useBean id="pageMem" class="test.Member" scope="page" />
	<jsp:useBean id="requestMem" class="test.Member" scope="request" />
	<jsp:useBean id="sessionMem" class="test.Member" scope="session" />
	<jsp:useBean id="appMem" class="test.Member" scope="application" />
	<jsp:setProperty property="name" name="pageMem" value="김연아" />
	<%=pageMem.getName()%>
	<br />
	<%
	Member mem = (Member) pageContext.getAttribute("pageMem");
	out.print(mem.getName());
	%>
	<h3><jsp:getProperty property="name" name="appMem" /></h3>
	<a href="beansTest2.jsp">ㄱㄱ</a>
	</body>
</html>