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

<%@ include file="../../../_include/inc_menu.jsp" %>
<h2>학사관리_시험정보</h2>

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
			<button type="button" onclick="move('edit.do', '${ dto.sihumNo }');">수정</button>
			<button type="button" onclick="move('drop.do', '${ dto.sihumNo }');">삭제</button>
		</td>
	</tr>
</table>

<div style="width: 50%; margin-top: 10px;" align="right">
	|
	<a href="#" onclick="move('list.do', '');">목록</a>
	|
	<a href="#" onclick="move('regi.do', '');">등록</a>
	|
</div>

<script>
function move(value1, value2) {
	location.href='${ path }/haksaSihum_servlet/' + value1 + "?sihumNo=" + value2;
}
</script>
</body>
</html>