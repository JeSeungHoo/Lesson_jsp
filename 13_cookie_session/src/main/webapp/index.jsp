<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%response.sendRedirect("member/index.jsp");%>
<!-- 

	<h1>Index Page</h1>
	<%
	request.setCharacterEncoding("UTF-8");
	// 클라이언트 브라우저에 저장된 Cookie 항목
	Cookie[] cookies = request.getCookies();
	if (cookies != null) {
		for (Cookie c : cookies) {
			System.out.println("name : " + c.getName());
			System.out.println("value : " + c.getValue());
			System.out.println("domain : " + c.getDomain());
		}
	}
	
	/*
	쿠키 등록
	Cookie cookie = new Cookie("key", "value~");
	// Cookie 유지 시간(초)
	cookie.setMaxAge(60*60*24*15);
	cookie.setPath("/");
	// cookie.setDomain("192.168.1.102");
	response.addCookie(cookie);
	*/
	
	// 쿠키 삭제(덮어쓰기)
	// 네임과 패스가 동일한 쿠키에 덮어씌웁니다
	Cookie cookie = new Cookie("key", "");
	cookie.setPath("/");
	cookie.setMaxAge(0); // 유지 시간이 0 -- 삭제
	response.addCookie(cookie);
	%>
	
 -->
</body>
</html>