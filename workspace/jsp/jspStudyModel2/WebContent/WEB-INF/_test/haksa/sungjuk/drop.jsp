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
	confirm('삭제하시겠습니까?');
}
</script>

<%@ include file="../../../_include/inc_menu.jsp" %>
<h2>학사관리_시험정보삭제</h2>

<form name="DirForm" action="/jspStudyModel2/haksaSihum_servlet/dropProc.do" method="post" onsubmit="validateForm(this);">
<input type="hidden" name="sihumNo" value="${ dto.sihumNo }">
<table border="1" width="50%">
	<tr>
		<td align="center" width="150px">시험명</td>
		<td>${ dto.sihumName }</td>
	</tr>
	<tr>
		<td align="center">시험일자</td>
		<td>${ dto.sihumDate }</td>
	</tr>
	<tr>
		<td colspan="2" align="center">
			<button type="submit">삭제</button>
			<button type="button" onclick="move('view.do', '${ dto.sihumNo }');">취소</button>
		</td>
	</tr>
</table>
</form>

<script>

function move(value1, value2) {
	location.href='${ path }/haksaSihum_servlet/' + value1 + "?sihumNo=" + value2;
}
</script>

</body>
</html>