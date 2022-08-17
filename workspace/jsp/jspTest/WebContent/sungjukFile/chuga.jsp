<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "_inc_fileInfo.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>성적관리</title>
</head>
<body>

<h2>성적관리(등록)</h2>

<form name="chugaForm">
<table border="1">
	<tr>
		<td>이름</td>
		<td><input type="text" name="name"></td>
	</tr>
		<tr>
		<td>국어</td>
		<td><input type="text" name="kor"></td>
	</tr>
	<tr>
		<td>영어</td>
		<td><input type="text" name="eng"></td>
	</tr>
	<tr>
		<td>수학</td>
		<td><input type="text" name="mat"></td>
	</tr>
	<tr>
		<td>과학</td>
		<td><input type="text" name="sci"></td>
	</tr>
	<tr>
		<td>역사</td>
		<td><input type="text" name="his"></td>
	</tr>
	<tr>
		<td colspan="2" align="center">
			<button type="button" onClick="chuga();">확인</button>
		</td>
	</tr>
	<tr>
		<td height="30px" colspan="2" align="right">
			|
			<a href="#" onClick="move('list', '');">목록</a>
			|
		</td>
	</tr>

</table>
</form>

<script>
function move(value1, value2) {
	location.href = value1 + '.jsp?name=' + value2;
}
function chuga() {
	if(confirm('저장하시겠습니까?')) {
		document.chugaForm.action = "chugaProc.jsp";
		document.chugaForm.method = "post";
		document.chugaForm.submit();
	}
}
</script>
</body>
</html>