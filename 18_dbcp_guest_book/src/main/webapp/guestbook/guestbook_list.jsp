<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.sql.*, util.*, java.util.*, vo.*"%>
<%
String path = request.getContextPath();

Connection conn = DBCPUtil.getConnection();
PreparedStatement pstmt = null;
ResultSet rs = null;
ArrayList<Guestbook> list = new ArrayList<>();
// 페이징 처리
int currentPage = 1; // 요청이 들어온 페이지 번호
int pageCount = 5; // 한 페이지에 보여줄 게시물 수
int startRow = 0; // 테이블에서 검색을 시작할 인덱스
int endRow = 0; // 테이블에서 검색할 게시물 수
String paramPage = request.getParameter("page");
if (paramPage != null) {
	currentPage = Integer.parseInt(paramPage);
}
startRow = (currentPage - 1) * pageCount;
endRow = pageCount;
String sql = "SELECT * FROM test_guestbook ORDER BY id DESC LIMIT ?, ?";
try {
	pstmt = conn.prepareStatement(sql);
	pstmt.setInt(1, startRow);
	pstmt.setInt(2, endRow);
	rs = pstmt.executeQuery();
	while (rs.next()) {
		list.add(new Guestbook(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4)));
	}
} catch (Exception e) {
	e.printStackTrace();
} finally {
	DBCPUtil.close(rs, pstmt);
}
// 페이징 블럭 처리
int listCount = 0; // 전체 게시물 수
int startPage = 0; // 현재 블럭의 첫 페이지
int endPage = 0; // 현재 블럭의 마지막 페이지
int maxPage = 0; // 최대 페이지
int displayPageNum = 5; // 한 번에 보여줄 페이지 블럭 개수
Statement stmt = null;
sql = "SELECT count(id) FROM test_guestbook";
try {
	stmt = conn.createStatement();
	rs = stmt.executeQuery(sql);
	if (rs.next()) {
		listCount = rs.getInt(1);
		/* maxPage = (int) Math.ceil((listCount / pageCount)); */
		maxPage = (listCount -1) / pageCount + 1;
		startPage = (currentPage -1) / displayPageNum * displayPageNum + 1;
		endPage = startPage + displayPageNum - 1 ;
		if (endPage > maxPage) endPage = maxPage;
	}
} catch (Exception e) {
	e.printStackTrace();
} finally {
	DBCPUtil.close(rs, stmt, conn);
}
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>방명록</title>
	<style>
		body {
			margin: 0 auto;
			width: 960px;
			border: 1px solid black;
		}
		div.child {
			float: left;
			width: 50%;
			text-align: center;
		}
		div#wrap {
			background: lightyellow;
			padding: 10px;
			overflow: hidden;
		}
		h1 {
			text-align: center;
		}
		form, table {
			margin: 0 auto;
			text-align: left;
		}
		a {
			text-decoration: none;
			color: blue;
		}
		form h2 {
			text-align: center;
		}
		span {
			color : red;
			font-weight: bold;
		}
	</style>
</head>
<body>
	<div id="wrap">
		<!-- 방명록 작성을 위한 form -->
		<h1>방명록</h1>
		<div class="child">
			<form action="<%=path%>/guestbook/guestbook_write.jsp" method="post">
				<table>
					<tr>
						<td colspan="3">
							<h2>방명록 작성</h2>
						</td>
					</tr>
					<tr>
						<td colspan="2"></td>
						<td rowspan="4">
							<input style="margin-left:20px; width:100px; height:100px;" type="submit" value="메시지 남기기" />
						</td>
					</tr>
					<tr>
						<td>이름</td>
						<td>
							<input style="width:100%;" type="text" name="guestName" />
						</td>
					</tr>
					<tr>
						<td>비밀번호</td>
						<td>
							<input style="width:100%;" type="password" name="password" />
						</td>					
					</tr>
					<tr>
						<td>메시지</td>
						<td>
							<textarea cols="35" rows="3" name="message"></textarea>
						</td>
					</tr>
				</table>
			</form>
		</div>
		<div class="child">
			<h2>방명록 목록</h2>
		<%
		if (!list.isEmpty()) {
		%>
			<table border="1" cellspacing="0" cellpadding="10">
		<%
			for (Guestbook gb : list) {
		%>
				<tr>
					<td>
						[<%=gb.getId()%>]
						작성자 : <%=gb.getGuestName()%> <br />
						: <%=gb.getMessage()%> <br />
						<a href="<%=path%>/guestbook/guestbook_confirm.jsp?id=<%=gb.getId()%>">[삭제]</a>
					</td>
				</tr>
		<%		
			}
		%>	
			</table>	
		<%
		} else {
		%>
			<h3>등록된 메시지가 없습니다.</h3>
		<%		
		}
		%>
		<%
		if (startPage > 1) {
		%>
			<a href="<%=path%>/guestbook/guestbook_list.jsp?page=1">[처음]</a>
			<a href="<%=path%>/guestbook/guestbook_list.jsp?page=<%=startPage-1%>">[이전]</a>
		<%			
		}
		for (int i = startPage; i <= endPage; i++) {
			if (currentPage == i) {
		%>
				<span>[<%=i%>]</span>
		<%
			} else {
		%>
			<a href="<%=path%>/guestbook/guestbook_list.jsp?page=<%=i%>">[<%=i%>]</a>
		<%
			}
		}
		if (endPage < maxPage) {
		%>
			<a href="<%=path%>/guestbook/guestbook_list.jsp?page=<%=endPage+1%>">[다음]</a>
			<a href="<%=path%>/guestbook/guestbook_list.jsp?page=<%=maxPage%>">[끝]</a>
		<%
		}
		%>
		</div>
	</div>
</body>
</html>