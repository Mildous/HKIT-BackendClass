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


<form name="DirForm" method="post" action="${ path }/memo/editProc">
<input type="hidden" name="no" value="${ dto.no }">
<table border="1">
<tr>
	<td align="center">작성자</td>
	<td><input type="text" name="writer" value="${ dto.writer }"></td>
</tr>
<tr>
	<td align="center">내용</td>
	<td>
		<textarea style="width: 150px; height: 80px;" name="content">${ dto.content }</textarea>
	</td>
</tr>
<tr>
	<td colspan="2" align="center">
		<button type="submit">수정하기</button>
		<button type="button" onclick="history.back();">취소</button>
	</td>
</tr>
</table>
</form>

</body>
</html>