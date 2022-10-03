<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../_include/inc_header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>memo</title>
</head>
<body>
<%@include file="../_include/inc_menu.jsp" %>

<h2>${ title }</h2>
<table border="1">
<tr>
	<th>작성자</th>
	<td>${ dto.writer }</td>
</tr>
<tr>
	<th>내용</th>
	<td>${ dto.content }</td>
</tr>
<tr>
	<th>등록일</th>
	<td>${ dto.regiDate }</td>
</tr>
<tr>
	<td colspan="2" align="center">
		<button type="button" onclick="location.href='${path}/memo/edit?no=${ dto.no }';">수정</button>
		<button type="button" onclick="location.href='${path}/memo/drop?no=${ dto.no }';">삭제</button>
	</td>
</tr>
</table>

</body>
</html>