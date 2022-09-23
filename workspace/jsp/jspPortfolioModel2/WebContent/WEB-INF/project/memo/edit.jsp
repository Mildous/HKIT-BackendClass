<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/inc_header.jsp" %>

<h2>메모수정</h2>

<form name="DirForm" method="post" action="${ path }/memo_servlet/memo_editProc.do">
<input type="hidden" name="no" value="${ dto.no }">
<table border="1" align="center" width="60%">
	<tr>
		<td width="150px">작성자</td>
		<td>${ dto.writer }</td>
	</tr>
	<tr>
		<td>내용</td>
		<td><textarea style="width: 300px; height: 140px;" name="content">${ dto.content }</textarea></td>
	</tr>
	<tr>
		<td colspan="2" align="center" style="height: 50px;">
			<button type="submit">수정</button>
			<button type="button" onclick="move('memo_view.do', '${ dto.no }');">취소</button>
		</td>
	</tr>
</table>
</form>

<script>
function move(value1, value2) {
	location.href='${ path }/memo_servlet/' + value1 + '?no=' + value2;
}
</script>
