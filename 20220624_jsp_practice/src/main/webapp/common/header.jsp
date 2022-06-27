<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../db.jsp"%>
<jsp:useBean id="loginMember" class="vo.MemberVO" scope="session" />
<%
	Cookie[] cookies = request.getCookies();
	if (cookies != null && loginMember.getId() == null) {
		for (Cookie c : cookies) {
			if (c.getName().equals("loginCookie")) {
				String sql = "SELECT * FROM test_member WHERE id = ?";
				try {
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, c.getValue());
					rs = pstmt.executeQuery();
					if (rs.next()) {
						vo.MemberVO dbMember = new vo.MemberVO();
						dbMember.setAddr(rs.getString("addr"));
						dbMember.setAge(rs.getInt("age"));
						dbMember.setGender(rs.getString("gender"));
						dbMember.setId(rs.getString("id"));
						dbMember.setName(rs.getString("name"));
						dbMember.setNum(rs.getInt("num"));
						dbMember.setPass(rs.getString("pass"));
						dbMember.setPhone(rs.getString("phone"));
						session.setAttribute("loginMember", dbMember);
						loginMember = dbMember;
					}
				} catch (Exception e) {
					System.out.println("==========Header 오류==========");
					e.printStackTrace();
					System.out.println("==========Header 오류==========");
				} finally {
					dbClose();
				}
			}
		}
	}
%>
<ul>
 	<li><a href="index.jsp">home</a></li>
<%
	if (loginMember.getId() == null) {
%>
	<li><a href="index.jsp?page=login">로그인</a></li>
 	<li><a href="index.jsp?page=join">회원가입</a></li>
<%				
	} else {
%>			
 	<li><a href="index.jsp?page=info"><%=loginMember.getName()%>님 반갑습니다.</a></li>
<%
		if (loginMember.getId().equals("admin")) {
%>				
	<li><a href="index.jsp?page=memberList">회원관리</a>
<%
		}
%>
 	<li><a href="logout.jsp">로그아웃</a></li>
<%
	}
%>
 </ul>
 
 
 
 
 
 
 
 
 