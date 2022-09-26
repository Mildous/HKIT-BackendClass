<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/inc_header.jsp" %>

<h2>게시글 삭제</h2>

<form name="DirForm" method="post" action="${ path }/guestBook_servlet/guestBook_dropProc.do">
<input type="hidden" name="no" value="${ dto.no }">
<table border="1" align="center" width="60%">
	<tr>
		<td width="150px" align="center">이름</td>
		<td>${ dto.name }</td>
	</tr>
	<tr>
		<td align="center">이메일</td>
		<td>${ dto.email }</td>
	</tr>
	<tr>
		<td align="center">비밀번호</td>
		<td><input type="password" name="passwd"></td>
	</tr>
	<tr>
		<td>내용</td>
		<td>${ content }</td>
	</tr>
	<tr>
		<td colspan="2" align="center" style="height: 50px;">
			<button type="submit">삭제</button>
			<button type="button" onclick="move('guestBook_view.do', '${ dto.no }');">취소</button>
		</td>
	</tr>
</table>
</form>

<div style="width: 60%; margin-top: 10px;" align="right">
|
<a href="#" onclick="move('guestBook_regi.do', '');">등록</a>
|
<a href="#" onclick="move('guestBook_list.do', '');">목록</a>
|
</div>

<script>
function move(value1, value2) {
	location.href='${ path }/guestBook_servlet/' + value1 + '?no=' + value2;
}
</script>