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
		<td>이름 : </td>
		<td>${ map.name }</td>
	</tr>
	<tr>
		<td>성별 : </td>
		<td>${ map.gender }</td>
	</tr>
	<tr>
		<td>주민번호 : </td>
		<td>${ map.jumin }</td>
	</tr>
	<tr>
		<td>나이 : </td>
		<td>${ map.age }</td>
	</tr>
</table>

</body>
</html>