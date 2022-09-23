<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="../../_include/inc_menu.jsp" %>
<h2>03Result</h2>

<table border="1">
	<tr>
		<td>이름</td>
		<td>${ name }</td>
	</tr>
	<tr>
		<td>주민등록번호</td>
		<td>${ regiNum }</td>
	</tr>
	<tr>
		<td>나이</td>
		<td>${ age }세</td>
	</tr>
	<tr>
		<td>성별</td>
		<td>${ gender }</td>
	</tr>
</table>

</body>
</html>