<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<hr />
<h1>include test2</h1>
<%!String str = "page2 str field";%>
<%response.addHeader("bbb", "BBB");%>
<%
request.setCharacterEncoding("UTF-8");
String name = request.getParameter("name");
%>
name : <%=name%>
<hr />