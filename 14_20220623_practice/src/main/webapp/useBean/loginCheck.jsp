<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, vo.*"%>
<%request.setCharacterEncoding("UTF-8");%>
<jsp:useBean id="memberList" class="java.util.ArrayList" type="List<MemberVO>" scope="application"></jsp:useBean>
<jsp:useBean id="loginMember" class="vo.MemberVO" />
<jsp:setProperty property="*" name="loginMember" />
<%
int index = memberList.indexOf(loginMember);
MemberVO sessionMember = memberList.get(index);
if (sessionMember != null && loginMember.getPass().equals(sessionMember.getPass())) {
	session.setAttribute("loginMember", sessionMember);
	String rememberMe = request.getParameter("rememberMe");
	if (rememberMe != null) {
		Cookie cookie = new Cookie("rememberMe",loginMember.getId());
		cookie.setPath("/");
		cookie.setMaxAge(60*60*24*7);
		response.addCookie(cookie);
	}
	String path = request.getContextPath();
	out.print("<script>");
	out.print("alert('로그인 성공!');");
	out.print("location.href='" + path + "/index.jsp';");
	out.print("</script>");
} else {
	out.print("<script>");
	out.print("alert('일치하는 회원 정보가 없습니다.');");
	out.print("history.go(-1);");
	out.print("</script>");
}
%>