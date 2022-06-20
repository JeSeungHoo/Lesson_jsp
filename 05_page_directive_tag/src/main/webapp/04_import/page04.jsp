<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@ page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>import</title>
</head>
<body>
	<%
		Calendar cal = Calendar.getInstance();
		int hour = cal.get(Calendar.HOUR_OF_DAY);
		int minute = cal.get(Calendar.MINUTE);
		int second = cal.get(Calendar.SECOND);
	%>
	현재시간(Calendar) = <%=hour%>시 <%=minute%>분 <%=second%>초
	<%
		SimpleDateFormat sdf = new SimpleDateFormat("HH시 mm분 ss초");
		String date = sdf.format(new Date());
	%>
	<br />
	현재시간(Formatter) = <%=date%>
</body>
</html>