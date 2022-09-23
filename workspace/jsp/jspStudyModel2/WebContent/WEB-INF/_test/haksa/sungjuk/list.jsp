<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../../_include/inc_header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학사관리</title>
</head>
<body>

<%@ include file="../../../_include/inc_menu.jsp" %>
<h2>학사관리_성적목록</h2>

<table border="1" width="80%">
	<tr>
		<th>순번</th>
		<th>시험명</th>
		<th>이름</th>
		<th>총점</th>
		<th>평균</th>
		<th>등급</th>
		<th>등록일</th>
	</tr>
<c:choose>
	<c:when test="${ empty list }">
	<tr>
		<td colspan="7" style="height: 200px;" align="center">
			등록된 성적이 없습니다..
		</td>
	</tr>
	</c:when>
	
	<c:otherwise>
		<c:forEach items="${ list }" var="row" varStatus="loop">
		<tr align="center">
			<td>
				${ (loop.index + 1) }
			</td>
			<td>${ row.sihumName }</td>
			<td><a href="#" onclick="move('view.do', '${ row.sungjukNo }');">${ row.studentName }</a></td>
			<td>${ row.tot }</td>
			<td>${ row.avg }</td>
			<td>${ row.grade }</td>
			<td>${ row.regiDate }</td>
		</tr>
		</c:forEach>
	</c:otherwise>
</c:choose>
</table>

<div style="width: 80%; margin-top: 10px;" align="right">
	|
	<a href="#" onclick="move('list.do', '');">목록</a>
	|
	<a href="#" onclick="move('regi.do', '');">등록</a>
	|
</div>

<script>
function move(value1, value2) {
	location.href='${ path }/haksaSungjuk_servlet/' + value1 + "?sungjukNo=" + value2;
}
</script>
</body>
</html>