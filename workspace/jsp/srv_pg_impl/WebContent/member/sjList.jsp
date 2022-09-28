<%@page import="member.SjDTO"%>
<%@page import="member.SjDAO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	SjDAO dao = new SjDAO();
	ArrayList<SjDTO> list = dao.getList();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>성적목록</title>
</head>
<body>
<h2>성적목록</h2>
<%
	String[] jungdab = {"1", "2", "3", "4", "3"};
	for(int i=0; i<jungdab.length; i++) {
		out.println("문제 " + (i+1) + "번 정답 : " + jungdab[i] + "<br>");
	}
%>
<br>
<table border="1" width="80%">
	<tr>
		<td>이름</td>
		<td>시험명</td>
		<td>문제1</td>
		<td>문제2</td>
		<td>문제3</td>
		<td>문제4</td>
		<td>문제5</td>
		<td>점수</td>
	</tr>
<%
	for(SjDTO dto : list) {
%>
	<tr>
		<td><%= dto.getName() %></td>
		<td><%= dto.getSname() %></td>
		<td><%= dto.getMun_1() %> (<%= dto.getMun_ox_1() %>)</td>
		<td><%= dto.getMun_2() %> (<%= dto.getMun_ox_2() %>)</td>
		<td><%= dto.getMun_3() %> (<%= dto.getMun_ox_3() %>)</td>
		<td><%= dto.getMun_4() %> (<%= dto.getMun_ox_4() %>)</td>
		<td><%= dto.getMun_5() %> (<%= dto.getMun_ox_5() %>)</td>
		<td><%= dto.getJumsu()%></td>
	</tr>
<%		
	}
%>
</table>
</body>
</html>