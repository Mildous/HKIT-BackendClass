<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/inc_header.jsp" %>

<h2>메모관리</h2>

<table border="1" width="60%">
<tr>
	<th>순번</th>
	<th>작성자</th>
	<th>내용</th>
	<th>작성일</th>
</tr>

<c:choose>
	<c:when test="${ empty memo }">
	<tr>
		<td colspan="4" height="200px" align="center">등록된 메모가 없습니다..</td> 
	</tr>
	</c:when>
	
	<c:otherwise>
		<c:forEach items="${ memo }" var="memo" varStatus="loop">
		<tr align="center">
			<td>${ loop.index + 1 }</td>
			<td>${ memo.writer }</td>
			<td align="center">
				<a href="#" onclick="move('memo_view.do', '${ memo.no }');">${ memo.content }</a>
			</td>
			<td>${ memo.regiDate }</td>
		</tr>
		</c:forEach>
	</c:otherwise>
</c:choose>
</table>

<div style="width: 60%; margin-top: 10px;" align="right">
|
<a href="#" onclick="move('memo_regi.do', '');">등록</a>
|
<a href="#" onclick="move('memo_list.do', '');">목록</a>
|
</div>

<script>
function move(value1, value2) {
	location.href='${ path }/memo_servlet/' + value1 + '?no=' + value2;
}
</script>