<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/inc_header.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디찾기</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>

<form name="DirForm">
<table border="1" align="center" width="80%">
	<tr>
		<td colspan="2"><h2>아이디 찾기</h2></td>
	</tr>
	<tr>
		<td>아이디</td>
		<td>
			<input type="text" name="id" id="id" value="${ id }" style="width: 100px">
			<span id="spanMsg">${ msg }</span>
			<br>
			<input type="text" name="result" id="result" value="${ imsiId }" style="width: 100px">
		</td>
	</tr>
	<tr>
		<td colspan="2" align="center" style="height: 50px;">
			<button type="button" onclick="search();">검색</button>
			<span id="spanView" style="display: none;">
				<button type="button" onclick="save();">적용</button>
			</span>
		</td>
	</tr>
</table>
</form>

<script>
function search() {
	if(confirm('OK?')) {
		document.DirForm.action = "${ path }/member_servlet/member_idCheckWinProc.do";
		document.DirForm.method = "post";
		document.DirForm.submit();
		
	}
}

</script>
</body>
</html>