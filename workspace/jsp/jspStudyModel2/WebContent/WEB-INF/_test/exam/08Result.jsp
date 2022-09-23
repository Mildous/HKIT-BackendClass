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
	<td>${ map.name }</td>
</tr>
<tr>
	<td>주소</td>
	<td>${ map.addr }</td>
</tr>
<tr>
	<td>나이</td>
	<td>${ map.age }</td>
</tr>
<tr>
	<td>${ map.num1 } ${ map.test } ${ map.num2 }</td>
	<td>${ map.result }</td>
</tr>

</table>


</body>
</html>