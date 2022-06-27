<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*, vo.*"%>
<%
request.setCharacterEncoding("UTF-8");
List<MemberVO> memberList = (List<MemberVO>) application.getAttribute("memberList");
// id 중복검사용 생성자
MemberVO joinMember = new MemberVO(request.getParameter("id"));
if (memberList.contains(joinMember)) {
	out.print("<script>");
	out.print("alert('이미 사용중인 아이디입니다.');");
	out.print("history.back();");
	out.print("</script>");
} else {
	String pass = request.getParameter("pass");
	String name = request.getParameter("name");
	String addr = request.getParameter("addr");
	String phone = request.getParameter("phone");
	String gender = request.getParameter("gender");
	String strAge = request.getParameter("age");
	int age = Integer.parseInt(strAge);
	joinMember.setPass(pass);
	joinMember.setName(name);
	joinMember.setAddr(addr);
	joinMember.setPhone(phone);
	joinMember.setGender(gender);
	joinMember.setAge(age);
	memberList.add(joinMember);
	String path = request.getContextPath();
	out.print("<script>");
	out.print("alert('회원가입이 완료되었습니다!');");
	out.print("location.href='" + path + "/index.jsp?page=login';");
	out.print("</script>");
}
%>
