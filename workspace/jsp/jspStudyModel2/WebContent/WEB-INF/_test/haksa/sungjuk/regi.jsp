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

<h2>학사관리_성적등록</h2>

<form name="DirForm" action="/jspStudyModel2/haksaSungjuk_servlet/regiProc.do"
								method="post" onsubmit="return validateForm(this);">
<table border="1">
	<tr>
		<td>학생이름</td>
		<td>
			<select name="hakbun">
				<option value="">-- 선택 --</option>
				<c:forEach items="${ list }" var="row" varStatus="loop">
				<option value="${ row.hakbun }">[${ row.hakbun }] ${ row.studentName }</option>
				</c:forEach>
			</select>
		</td>
	</tr>
	<tr>
		<td>시험명</td>
		<td>
			<select name="sihumNo">
				<option value="">-- 선택 --</option>
				<c:forEach items="${ list }" var="row" varStatus="loop">
				<option value="${ row.sihumNo }">${ row.sihumName }</option>
				</c:forEach>
			</select>
		</td>
	</tr>
	<tr>
		<td>국어점수</td>
		<td><input type="text" name="kor" id="kor"></td>
	</tr>
	<tr>
		<td>영어점수</td>
		<td><input type="text" name="eng" id="eng"></td>
	</tr>
	<tr>
		<td>수학점수</td>
		<td><input type="text" name="mat" id="mat"></td>
	</tr>
	<tr>
		<td>과학점수</td>
		<td><input type="text" name="sci" id="sci"></td>
	</tr>
	<tr>
		<td>역사점수</td>
		<td><input type="text" name="his" id="his"></td>
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