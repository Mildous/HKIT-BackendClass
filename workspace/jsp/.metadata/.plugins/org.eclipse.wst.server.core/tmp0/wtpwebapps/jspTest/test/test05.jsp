<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String[] subject = new String[5];	//{"", "", "", "", ""}
	subject[0] = "국어";
	subject[1] = "영어";
	subject[2] = "수학";
	subject[3] = "과학";
	subject[4] = "역사";
	
	int[] score = new int[5];
	score[0] = 90;
	score[1] = 80;
	score[2] = 70;
	score[3] = 60;
	score[4] = 50;
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>test05.jsp</title>
</head>
<body>
	<h2>test05.jsp</h2>
	
	<table border="1">
		<tr>
			<td>과목</td>
			<td>점수</td>
		</tr>
		<%
		int j = 0;
		for(String i : subject) {
		%>
			<tr>
				<td><%= i %></td>
				<td><%= score[j] %></td>
			</tr>
		<%
			j++;
		}
		%>
	</table>
</body>
</html>