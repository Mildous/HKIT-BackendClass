<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/inc_header.jsp" %>

<h2>게시글 상세보기</h2>

<form name="DirForm">
<input type="hidden" name="no" value="${ dto.no }">
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
		<td colspan="4" align="center" style="height: 50px;">
			<button type="button" onclick="move('board_regi.do', '${ dto.getNo() }');">답글달기</button>&nbsp;
			<button type="button" onclick="move('board_edit.do', '${ dto.getNo() }');">수정하기</button>&nbsp;
			<button type="button" onclick="move('board_drop.do', '${ dto.getNo() }');">삭제하기</button>&nbsp;
		</td>
	</tr>
</table>
</form>

<div style="width: 80%; margin-top: 10px;" align="right">
|
<a href="#" onclick="move('board_regi.do', '');">등록</a>
|
<a href="#" onclick="move('board_list.do', '');">목록</a>
|
</div>

<script>
function move(value1, value2) {
	location.href='${ path }/board_servlet/' + value1 + '?no=' + value2;
}
</script>