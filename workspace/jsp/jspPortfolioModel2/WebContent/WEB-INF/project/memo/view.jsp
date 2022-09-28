<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/inc_header.jsp" %>

<script>
function deleteMemo(form) {
	if(confirm('정말로 삭제하시겠습니까?')) {
		var form = document.DirForm;
		form.method = "post";
		form.action = "${ path }/memo_servlet/memo_dropProc.do";
		form.submit();
	}
}
</script>

<h2>메모내용</h2>

<form name="DirForm">
<input type="hidden" name="no" value="${ dto.no }">
<table border="1" align="center" width="60%">
	<tr>
		<td width="150px" align="center">작성자</td>
		<td>${ dto.writer }</td>
	</tr>
	<tr>
		<td align="center">내용</td>
		<td>${ content }</td>
	</tr>
	<tr>
		<td colspan="2" align="center" style="height: 50px;">
			<button type="button" onclick="move('memo_edit.do', '${ dto.no }');">수정</button>
			<button type="button" onclick="deleteMemo();">삭제</button>
		</td>
	</tr>
</table>
</form>

<div style="width: 60%; margin-top: 10px;" align="right">
|
<a href="#" onclick="move('memo_regi.do', '');">등록</a>
|
<a href="#" onclick="move('memo_list.do', '');">목록</a>
|
</div>

<table border="0" align="center" width="60%">
<tr>
	<td width="100px">이전메모</td>
	<c:choose>
		<c:when test="${ dto.preNo < 1 }">
			<td>이전 메모가 없습니다</td>
		</c:when>
		<c:otherwise>
			<td><a href="#" onclick="move('memo_view.do', '${ dto.preNo }')">${ dto.preName }</a></td>
		</c:otherwise>
	</c:choose>
</tr>
<tr>
	<td width="100px">이전메모</td>
	<c:choose>
		<c:when test="${ dto.nxtNo < 1 }">
			<td>다음 메모가 없습니다</td>
		</c:when>
		<c:otherwise>
			<td><a href="#" onclick="move('memo_view.do', '${ dto.nxtNo }')">${ dto.nxtName }</a></td>
		</c:otherwise>
	</c:choose>
</tr>
</table>

<script>
function move(value1, value2) {
	location.href='${ path }/memo_servlet/' + value1 + '?no=' + value2;
}
</script>