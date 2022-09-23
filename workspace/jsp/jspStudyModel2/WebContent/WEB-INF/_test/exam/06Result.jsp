<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../_include/inc_header.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="../../_include/inc_menu.jsp" %>

<h2>06Result</h2>

<table border="1">
	<tr>
		<td>${ ment }</td>
	</tr>
</table>

<br>

<form name="DirForm">
	<input type="text" name="ment" value="${ ment }" > 
</form>

<script>
function autoMove() {
	document.DirForm.action = "/jspStudyModel2/exam_servlet/06Result.do";
	document.DirForm.method = "post";
	document.DirForm.submit();
}
autoMove();
</script>

</body>
</html>