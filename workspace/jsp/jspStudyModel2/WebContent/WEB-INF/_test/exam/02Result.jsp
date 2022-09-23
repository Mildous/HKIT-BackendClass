<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="../../_include/inc_menu.jsp" %>
<h2>02Result</h2>

<form name="DirForm">
<table border="1">
	<tr>
		<td>이름</td>
		<td>${ name }</td>
	</tr>
	<tr>
		<td>출생년도</td>
		<td>${ bornYear }년</td>
	</tr>
	<tr>
		<td>나이</td>
		<td>${ 2022 - bornYear + 1 }세</td>
	</tr>
</table>
</form>

<script>
function save() {
	if(confirm('실행하시겠습니까?')) {
		document.DirForm.action = "/jspStudyModel2/exam_servlet/01Proc.do";
		document.DirForm.method = "post";
		document.DirForm.submit();
	}
}
</script>
</body>
</html>