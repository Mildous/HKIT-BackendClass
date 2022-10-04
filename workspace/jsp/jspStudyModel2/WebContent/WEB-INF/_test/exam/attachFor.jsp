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

<h2>attach1</h2>

<form name="DirForm">
<table border="1">
<tr>
	<td>첨부메모</td>
	<td><input type="text" name="memo"></td>
</tr>
<tr>
	<td>첨부파일</td>
	<td>
		<input type="file" name="0" class="fileUp"><br>
		<input type="file" name="1" class="fileUp"><br>
		<input type="file" name="2" class="fileUp"><br>
		<input type="file" name="3" class="fileUp"><br>
		<input type="file" name="4" class="fileUp"><br>
		<input type="text" name="attachCounter" class="fileUp">
	</td>
</tr>
<tr>
	<td colspan="2">
		<button type="button" onclick="save();">등록하기</button>
	</td>
</tr>
</table>
</form>

<script>
function save() {
	var f = document.DirForm;
	document.DirForm.attachCounter.value = document.getElementByClassName("fileUp").length;
	if(confirm('ok?')) {
		f.enctype = "multipart/form-data";
		f.action = "${ path }/exam_servlet/attachWhileProc.do";
		f.method = "post";
		f.submit();
	}
}
</script>
</body>
</html>