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
		<td>이름</td>
		<td>${ dto.name }</td>
	</tr>
	<tr>
		<td>이메일</td>
		<td>${ dto.email }></td>
	</tr>
	<tr>
		<td>등록일</td>
		<td>${ dto.regiDate }</td>
	</tr>
	<tr>
		<td>내용</td>
		<td>${ dto.content }</td>
	</tr>
	<tr>
		<td colspan="2" align="center">
			<button type="button" onclick="location.href='${path}/guestBook/edit?no=${ dto.no }';">수정</button>
			<button type="button" onclick="location.href='${path}/guestBook/drop?no=${ dto.no }';">삭제</button>
			<button type="button" onclick="location.href='${path}/guestBook/list';">목록</button>
		</td>
	</tr>
</table>
</form>

<script>
function save() {
	if(confirm('저장할까요?')) {
		document.DirForm.action = "${path}/guestBook/regiProc";
		document.DirForm.method = "post";
		document.DirForm.submit();
	}
}

</script>
</body>
</html>