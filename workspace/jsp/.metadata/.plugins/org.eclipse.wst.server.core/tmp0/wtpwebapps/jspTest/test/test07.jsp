<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String imsiInfo01 = "홍길동/90/80/70";
	String imsiInfo02 = "이성순/99/88/77";
	String imsiInfo03 = "장천용/100/100/100";
	
	String[] array = new String[3];
	array[0] = imsiInfo01;
	array[1] = imsiInfo02;
	array[2] = imsiInfo03;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>test07.jsp</title>
</head>
<body>
	<h2>test07.jsp</h2>
	<table border="1">
		<tr>
			<td>이름</td>
			<td>국어</td>
			<td>영어</td>
			<td>수학</td>
		</tr>
		<%
		int korTot = 0;
		int engTot = 0;
		int matTot = 0;
		for(int i=0; i<array.length; i++) {
			String[] array2 = array[i].split("/");
			String name = array2[0];
			String kor = array2[1];
			String eng = array2[2];
			String mat = array2[3];
		%>
		<tr>
			<td><%= name %></td>
			<td><%= kor %></td>
			<% korTot += Integer.parseInt(kor); %>
			<td><%= eng %></td>
			<% engTot += Integer.parseInt(eng); %>
			<td><%= mat %></td>
			<% matTot += Integer.parseInt(mat); %>
			
		</tr>
		<%
		}
		%>
		<tr>
			<td>총점</td>
			<td><%= korTot %></td>
			<td><%= engTot %></td>
			<td><%= matTot %></td>
		</tr>
		<tr>		
			<td>평균</td>
			<td><%= korTot/3 %></td>
			<td><%= engTot/3 %></td>
			<td><%= matTot/3 %></td>
		</tr>
	</table>
</body>
</html>