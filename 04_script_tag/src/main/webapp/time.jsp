<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<!-- 선언문 클래스 블럭에 정의된다. -->
<%!
	// 필드 선언
	String s = "선언문에 선언되는 변수는 전역 변수입니다. ";
	int count = 0;
	
	// 메소드 선언
	String getStr(String str){
		s += str;
		++count;
		return s;
	}
	
	// System.out.println("선언문에서는 실행문 작성 불가");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>Time JSP</h1>
	
	<!-- 표현문 service()에 정의된다.-->
	<%= getStr("새로고침을 눌러 보세요~~! " + count) %>
	
	<!-- 스크립틀릿 service()에 정의된다.-->
	<%
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		String date = sdf.format(new Date());
	%>
	현재시간 : <%= date %> <br />
	기본시간 : <%= new Date() %> <br />

</body>
</html>