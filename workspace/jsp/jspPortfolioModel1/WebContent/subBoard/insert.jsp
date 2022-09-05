<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="_inc_top.jsp" %>

<h2>게시글 작성</h2>

<form name="DirForm">
<table border="1" width="50%">
	<tr>
		<th>작성자</th>
		<td><input type="text" name="writer"></td>
	</tr>
	<tr>
		<th>이메일</th>
		<td><input type="text" name="email"></td>
	</tr>
	<tr>
		<th>비밀번호</th>
		<td><input type="password" name="passwd"></td>
	</tr>
	<tr>
		<th>제목</th>
		<td><input type="text" name="subject"></td>
	</tr>
	<tr>
		<th>내용</th>
		<td>
			<textarea name="content" style="width: 300px; height: 100px;"></textarea>
		</td>
	</tr>
	<tr>
		<th>공지글</th>
		<td>
			<input type="radio" name="noticeGubun" value="T">공지글&nbsp;
			<input type="radio" name="noticeGubun" value="F" checked>공지글아님&nbsp;
		</td>
	</tr>
	<tr>
		<th>비밀글</th>
		<td>
			<input type="radio" name="secretGubun" value="T">비밀글&nbsp;
			<input type="radio" name="secretGubun" value="F" checked>비밀글아님&nbsp;
		</td>
	</tr>
	<tr>
		<td colspan="2" align="center">
			<button type="button" onclick="save();">등록하기</button>
			<button type="button" onclick="location.href='main.jsp?menuGubun=subBoard_list';">목록으로</button>
		</td>
	</tr>
</table>
</form>

<script>
function save() {
	if(confirm('등록하시겠습니까?')) {
		DirForm.action = "mainProc.jsp?menuGubun=subBoard_insertProc";
		DirForm.method = "post";
		DirForm.submit();
	}
}
</script>