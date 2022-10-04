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

<table border="1" width="60%">
	<tr>
		<th>순번</th>
		<th>이름</th>
		<th>내용</th>
		<th>작성일</th>
	</tr>
	<c:choose>
		<c:when test="${ empty guestBook }">
		<tr>
			<td colspan="4" height="100px" align="center">등록된 방명록이 없습니다..</td>
		</tr>
		</c:when>
		
		<c:otherwise>
			<c:forEach items="${ guestBook }" var="guestBook" varStatus="loop">
			<tr align="center">
				<td><a href="#" onclick="move('view', '${ guestBook.no }');">${ loop.index + 1 }</a></td>
				<td>${ guestBook.name }</td>
				<td>${ guestBook.content }</td>
				<td>${ guestBook.regiDate }</td>
			</tr>
			</c:forEach>
		</c:otherwise>
	</c:choose>
</table>

<div style="width: 60%; margin-top: 10px;" align="right">
|
<a href="#" onclick="move('regi', '');">등록</a>
|
<a href="#" onclick="move('list', '');">목록</a>
|
</div>

<script>
function move(value1, value2) {
	location.href="${path}/guestBook/" + value1 + "?no=" + value2;
}
</script>

</body>
</html>