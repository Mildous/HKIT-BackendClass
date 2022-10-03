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

<h2>${ map.title }</h2>
<table border="1">
	<tr>
		<td colspan="2">이름 : </td>
		<td colspan="3">${ map.name }</td>
	</tr>
	<tr>
		<td>국어</td>
		<td>영어</td>
		<td>수학</td>
		<td>과학</td>
		<td>역사</td>
	</tr>
	<tr>
		<td>${ map.kor }</td>
		<td>${ map.eng }</td>
		<td>${ map.mat }</td>
		<td>${ map.sci }</td>
		<td>${ map.his }</td>
	</tr>
	<tr>
		<td colspan="2">총점</td>
		<td colspan="3">${ map.tot }</td>
	</tr>
	<tr>
		<td colspan="2">평균</td>
		<td colspan="3">${ map.avg }</td>
	</tr>
</table>

</body>
</html>