<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.*, java.util.*, vo.BoardVO, util.DBCPUtil"%>
<%
int currentPage = 1; // 현재 페이지
int displayRow = 15; // 보여줄 게시물 수
int startRow = 0; // 검색 시작 인덱스
int totalRow = 0; //전체 게시물 수
int startPage = 0; // 페이지블럭의 시작 페이지
int endPage = 0; // 페이지블럭의 끝 페이지
int maxPage = 0; // 최대 페이지
int displayPage = 5; // 보여줄 페이지 수
String paramPage = request.getParameter("page");
if (paramPage != null) {
	currentPage = Integer.parseInt(paramPage);
}
Connection conn = DBCPUtil.getConnection();
PreparedStatement pstmt = null;
ResultSet rs = null;
ArrayList<BoardVO> bl = new ArrayList<>();
String sql = "SELECT * FROM tblBoard ORDER BY boardNum DESC LIMIT ?, ?";
startRow = (currentPage -1) * displayRow;
try {
	pstmt = conn.prepareStatement(sql);
	pstmt.setInt(1, startRow);
	pstmt.setInt(2, displayRow);
	rs = pstmt.executeQuery();
	while (rs.next()) {
		BoardVO vo = new BoardVO(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getInt(5), rs.getTimestamp(6));
		bl.add(vo);
	}
	DBCPUtil.close(rs, pstmt);
	sql = "SELECT count(boardNum) FROM tblBoard";
	pstmt = conn.prepareStatement(sql);
	rs = pstmt.executeQuery();
	if (rs.next()) {
		totalRow = rs.getInt(1);
	}
} catch (Exception e) {
	e.printStackTrace();
} finally {
	DBCPUtil.close(rs, pstmt, conn);
}
maxPage = (totalRow - 1) / displayRow + 1;
startPage = (currentPage -1) / displayPage * displayPage + 1;
endPage = startPage + displayPage -1;
if (endPage > maxPage) endPage = maxPage;
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<style>
		section{
			text-align:center;
		}
		table {
			border-collapse: collapse;
			border: 1px solid black;
			margin: 50px auto;
		}
		
		table th, table td {
			border: 1px solid #ccc;
			padding: 10px;
		}
	</style>
</head>
<body>
	<section>
		<a href="board_write.jsp">글작성</a>
		<a href="board_list_cri.jsp">Criteria Board</a>
		<table border="1">
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성시간</th>
				<th>조회수</th>
				<th>비고</th>
			</tr>
			<%
			if (bl.isEmpty()) {
			%>
			<tr>
				<td colspan="6">등록된 게시물이 없습니다.</td>
			</tr>
			<%	
			} else {
				for (BoardVO b: bl) {
			%>
			<tr>
				<td><%=b.getBoardNum()%></td>
				<td><a href="board_read.jsp?boardNum=<%=b.getBoardNum()%>"><%=b.getBoardTitle()%></a></td>
				<td><%=b.getBoardAuth()%></td>
				<td><%=b.getBoardDate()%></td>
				<td><%=b.getBoardReadCount()%></td>
				<td></td>
			</tr>
			<%			
				}
			}
			 %>
		</table>
		<div>
		<%
		for (int i = startPage; i <= endPage; i++) {
		%>
			<a href="<%=request.getContextPath()%>/board/board_list_page.jsp?page=<%=i%>"><%=i%></a>
		<%	
		}
		%>
		</div>
	</section>
</body>
</html>