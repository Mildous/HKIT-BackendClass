<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../_include/inc_header.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%@ include file="../../_include/inc_menu.jsp" %>

<table border="1">
<tr>
	<td>이름</td>
	<td>${ name }</td>
</tr>
<tr>
	<td>국어</td>
	<td>${ kor }</td>
</tr>
<tr>
	<td>영어</td>
	<td>${ eng }</td>
</tr>
<tr>
	<td>수학</td>
	<td>${ math }</td>
</tr>
<tr>
	<td>총점</td>
	<td>${ kor + eng + math }</td>
</tr>
<tr>
	<td>평균</td>
	<td>${ (kor + eng + math) / 3 }</td>
</tr>
</table>

</body>
</html>