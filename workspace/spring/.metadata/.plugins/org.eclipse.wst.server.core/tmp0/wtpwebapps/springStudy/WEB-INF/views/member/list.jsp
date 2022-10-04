<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../_include/inc_header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member</title>
</head>
<body>

<%@include file="../_include/inc_menu.jsp" %>
<h2>${title}</h2>

<table border="1" width="80%">

<tr>
	<th>순번</th>
	<th>아이디</th>
	<th>비밀번호</th>
	<th>이름</th>
	<th>생년월일</th>
	<th>전화번호</th>
	<th>가입일</th>
</tr>

<c:choose>
	<c:when test="${ empty member }">
	<tr>
		<td colspan="7" height="200px" align="center">등록된 회원이 없습니다..</td> 
	</tr>
	</c:when>
	
	<c:otherwise>
		<c:forEach items="${ member }" var="dto" varStatus="loop">
		<tr align="center">
			<td>${ loop.index + 1 }</td>
			<td align="center">
				<a href="#" onclick="move('view', '${ dto.no }');">${ dto.id }</a>
			</td>
			<td>${ dto.passwd }</td>
			<td>${ dto.name }</td>
			<td>${ dto.jumin }</td>
			<td>${ dto.phone }</td>
			<td>${ dto.regiDate }</td>
		</tr>
		</c:forEach>
	</c:otherwise>
</c:choose>


</table>

<div style="width: 80%; padding-top: 10px;" align="right">
|
<a href="#" onclick="move('regiAttach', '');">등록(Attach)</a>
|
<a href="#" onclick="move('list', '');">목록</a>
|
<a href="#" onclick="move('regi', '');">등록</a>
|
</div>

<script>
function move(value1, value2) {
	location.href='${ path }/member/' + value1 + '?no=' + value2;
}

</script>

</body>
</html>