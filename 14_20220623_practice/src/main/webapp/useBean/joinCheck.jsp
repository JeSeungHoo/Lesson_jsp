<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, vo.*"%>
<%request.setCharacterEncoding("UTF-8");%>
<!-- List<MemberVO> memberList = new java.util.ArrayList() -->
<jsp:useBean id="memberList" class="java.util.ArrayList" type="List<MemberVO>" scope="application"></jsp:useBean>
<jsp:useBean id="joinMember" class="vo.MemberVO" />
<jsp:setProperty property="*" name="joinMember" />
<%
if (memberList.contains(joinMember)) {
	out.print("<script>");
	out.print("alert('이미 사용중인 아이디입니다.');");
	out.print("history.back();");
	out.print("</script>");
} else {
	memberList.add(joinMember);
	String path = request.getContextPath();
	out.print("<script>");
	out.print("alert('회원가입이 완료되었습니다!');");
	out.print("location.href='" + path + "/index.jsp?page=login';");
	out.print("</script>");
}
%>
