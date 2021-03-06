<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String name = "홍길동";
	int kor = 100;
	int eng = 80;
	int mat = 70;
	
	int tot = kor + eng + mat;
	double avg = tot/3;
	
	String grade = "E";
	if(avg >= 90) {
		grade = "A";
	} else if(avg >= 80) {
		grade = "B";
	} else if(avg >= 70) {
		grade = "C";
	} else if(avg >= 60) {
		grade = "D";
	}
	
	String gradeDisplayText01 = "<font style='color: red; font-weight: bold;'>";
	String gradeDisplayText02 = "</font>";
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>test03.jsp</title>
</head>
<body>

<h2>test03.jsp</h2>

<table border="1" align="left">
	<tr>
		<td width="50px">이름</td>
		<td width="120px"><font style="color: blue; font-weight: bold"><%= name %></font></td>
	</tr>
	<% if(kor >= 60) { %>
	<tr>
		<td>국어</td>
		<td><%= kor %></td>
	</tr>
	<% }%>
	<tr>
		<td>영어</td>
		<td><%= eng %></td>
	</tr>
	<tr>
		<td>수학</td>
		<td><%= mat %></td>
	</tr>
	<tr>
		<td>총점</td>
		<td><%= tot %></td>
	</tr>
	<tr>
		<td>평균</td>
		<td><%= avg %>
		</td>
	</tr>
	<tr>
		<td>등급</td>
		<td>
			<% if (avg >= 80) {%>
				<%= gradeDisplayText01 + "(" + grade + ")" + gradeDisplayText02 %>
			<% } else { %>
			<%= grade %>
			<% } %>
		</td>
	</tr>
</table>

</body>
</html>