<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../_include/inc_header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>memo</title>
</head>
<body>

<h2>${ title }</h2>
<form name="DirForm">
<table border="1">
	<tr>
		<td>아이디</td>
		<td><input type="text" name="writer">
	</tr>
	<tr>
		<td>비밀번호</td>
		<td><input type="password" name="passwd">
	</tr>
	<tr>
		<td colspan="2" align="center">
			<button type="button" onclick="save();">확인</button>
		</td>
	</tr>
</table>
</form>

<script>
function save() {
	if(confirm('로그인할까요?')) {
		document.DirForm.action = "${path}/member/loginProc";
		document.DirForm.method = "post";
		document.DirForm.submit();
	}
}

</script>
</body>
</html>