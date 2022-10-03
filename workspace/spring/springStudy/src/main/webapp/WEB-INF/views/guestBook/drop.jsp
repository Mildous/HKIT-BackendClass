<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../_include/inc_header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>guestBook</title>
</head>
<body>

<%@include file="../_include/inc_menu.jsp" %>
<h2>${title}</h2>

<form name="DirForm" method="post" action="${path}/guestBook/dropProc">
<input type="hidden" name="no" value="${ dto.no }">
<table border="1" width="60%">
	<tr>
		<td>이름</td>
		<td>${ dto.name }</td>
	</tr>
	<tr>
		<td>이메일</td>
		<td>${ dto.email }</td>
	</tr>
	<tr>
		<td>비밀번호</td>
		<td><input type="password" name="passwd"></td>
	</tr>
	<tr>
		<td>내용</td>
		<td>${ dto.content}</td>
	</tr>
	<tr>
		<td colspan="2" align="center">
			<button type="submit">삭제</button>
			<button type="button" onclick="history.back();">취소</button>
		</td>
	</tr>
</table>
</form>

</body>
</html>