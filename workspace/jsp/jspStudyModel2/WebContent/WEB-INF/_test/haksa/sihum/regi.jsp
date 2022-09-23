<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../../_include/inc_header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학사관리</title>
</head>
<body>
<script>
function validateForm() {
	confirm('등록하시겠습니까?');
}
</script>
<%@ include file="../../../_include/inc_menu.jsp" %>

<h2>학사관리_시험등록</h2>

<form name="DirForm" action="/jspStudyModel2/haksaSihum_servlet/regiProc.do"
								method="post" onsubmit="return validateForm(this);">
<table border="1">
	<tr>
		<td>시험명</td>
		<td><input type="text" name="sihumName" id="sihumName"></td>
		
	</tr>
	<tr>
		<td>시험일자</td>
		<td><input type="date" name="sihumDate" id="sihumDate"></td>
	</tr>
	<tr>
		<td colspan="2" align="center">
			<button type="submit">등록하기</button>
		</td>
	</tr>
</table>
</form>
</body>
</html>