<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*, util.*, java.util.*, vo.*"%>
<%
int currentPage = 1;
int perPageNum = 15;
int totalCount = 0;
String paramPage = request.getParameter("page");
if (paramPage != null) {
	currentPage = Integer.parseInt(paramPage);
}
Criteria cri = new Criteria(currentPage, perPageNum);
PageMaker pm = new PageMaker();
pm.setCri(cri);
Connection conn = DBCPUtil.getConnection();
PreparedStatement pstmt = null;
ResultSet rs = null;
ArrayList<BoardVO> list = new ArrayList<>();
String sql = "SELECT * FROM tblBoard ORDER BY boardNum DESC LIMIT ?, ?";
try {
	pstmt = conn.prepareStatement(sql);
	pstmt.setInt(1, cri.getStartRow());
	pstmt.setInt(2, cri.getPerPageNum());
	rs = pstmt.executeQuery();
	while (rs.next()) {
		list.add(new BoardVO(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getInt(5),
		rs.getTimestamp(6)));
	}
	DBCPUtil.close(rs, pstmt);
	sql = "SELECT count(boardNum) FROM tblBoard";
	pstmt = conn.prepareStatement(sql);
	rs = pstmt.executeQuery();
	if (rs.next()) {
		totalCount = rs.getInt(1);
	}
	pm.setTotalCount(totalCount);
} catch (Exception e) {
	e.printStackTrace();
} finally {
	DBCPUtil.close(rs, pstmt, conn);
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table border="1">
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>작성시간</th>
			<th>조회수</th>
			<th>기타</th>
		</tr>
		<%
		for (BoardVO b : list) {
		%>
		<tr>
			<td><%=b.getBoardNum()%></td>
			<td><%=b.getBoardTitle()%></td>
			<td><%=b.getBoardAuth()%></td>
			<td><%=b.getBoardDate()%></td>
			<td><%=b.getBoardReadCount()%></td>
			<td></td>
		</tr>
		<%
		}
		%>
	</table>
	<br />
	<footer>
	<%
	if (pm.isPrev()) {
	%>
		<a href="board_list_cri.jsp">처음</a>
		<a href="board_list_cri.jsp?page=<%=pm.getStartPage()-1%>">이전</a>
	<%
	}
	for (int i=pm.getStartPage(); i <= pm.getEndPage(); i++) {
	%>
		<a href="board_list_cri.jsp?page=<%=i%>"><%=i%></a>
	<%
	}
	if (pm.isNext()) {
	%>
		<a href="board_list_cri.jsp?page=<%=pm.getEndPage()+1%>">다음</a>
		<a href="board_list_cri.jsp?page=<%=pm.getMaxPage()%>">마지막</a>
	<%
	}
	%>
	</footer>
</body>
</html>