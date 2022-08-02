<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>test04.jsp</title>
</head>
<body>
	<h2>test04.jsp</h2>
	<table border="1" width="200px">
	<tr>
	<%
	int sum = 0;
	for(int i=1; i<10; i++) {
		sum = sum+i;
		out.print("<tr>");
		out.print("<td align='center'>" + i + "</td>");
		out.print("<td align='center'>" + sum + "</td>");
		out.print("</tr>");
	 }
	%>
	</table>
	
	<hr>
	
	<table border="1">
		<tr bgcolor="#FFF333">
			<th>순번</th>
			<th>제목</th>
			<th>작성자</th>
			<th>작성일</th>
			<th>조회수</th>
		</tr>
		<%
		for(int i=1; i<=10; i++) {
			
			if(i % 2 == 1) {
				out.print("<tr bgcolor='lightgray'>");
			}
			else {
				out.print("<tr>");
			}
			out.print("<td>" + i + "</td>");
			out.print("<td>연습입니다..</td>");
			out.print("<td>홍길동</td>");
			out.print("<td>2022-08-02</td>");
			out.print("<td>21</td>");
			out.print("</tr>");
		}
		%>
	</table>
	
	<hr>
	
	
	<table border="1">
		<tr bgcolor="#FFF333">
			<th>순번</th>
			<th>제목</th>
			<th>작성자</th>
			<th>작성일</th>
			<th>조회수</th>
		</tr>
		<%
		int k=0;
		while(k<5) {
		%>
		<tr>
		<td><%= k+1 %></td>
		<td>연습입니다..</td>
		<td>홍길동</td>
		<td>2022-08-02</td>
		<td>21</td>
		</tr>
		<%
			k++;
		}
		%>
	</table>
	
</body>
</html>