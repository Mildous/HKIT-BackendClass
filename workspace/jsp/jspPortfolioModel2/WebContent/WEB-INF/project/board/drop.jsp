<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/inc_header.jsp" %>

<h2>게시글 삭제</h2>

<form name="DirForm" method="post" action="${ path }/board_servlet/board_dropProc.do" >
<input type="hidden" name="no" value="${ dto.getNo() }">
<table border="1" align="center" width="80%">
	<tr>
		<th>번호</th>
		<td>${ dto.getNum() }</td>
		<th>조회수</th>
		<td>${ dto.getHit() }</td>
	</tr>
	<tr>
		<th>작성자</th>
		<td>${ dto.getWriter() }</td>
		<th>이메일</th>
		<td>${ dto.getEmail() }</td>
	</tr>
	<tr>
		<th>제목</th>
		<td>${ dto.getSubject() }</td>
		<th>작성일</th>
		<td>${ dto.getRegiDate() }</td>
	</tr>
	<tr>
		<th>ip</th>
		<td colspan="3">${ dto.getIp() }</td>	
	</tr>
	<tr>
		<th>공지글</th>
		<td>${ dto.getNoticeNo() }</td>
		<th>비밀글</th>
		<td>${ dto.getSecretGubun() }</td>
	</tr>
	<tr>
		<th>첨부</th>
		<td colspan="3">${ dto.getAttachInfo() }</td>
	</tr>
	<tr>
		<th>내용</th>
		<td colspan="3" height="100">${ content }</td>
	</tr>
	<tr>
		<td align="center">비밀번호</td>
		<td colspan="3">
			<input type="password" name="passwd" id="passwd" value="">
		</td>
	</tr>
	<tr>
		<td colspan="4" align="center" style="height: 50px;">
			<button type="submit">삭제하기</button>
			<button type="button" onclick="move('board_view.do', '${ dto.no }');">목록으로</button>
		</td>
	</tr>
</table>
</form>

<script>
function move(value1, value2) {
	location.href='${ path }/board_servlet/' + value1 + '?no=' + value2;
}
</script>