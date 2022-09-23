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
<h2>학사관리_학생정보</h2>

<table border="1" width="60%">
	<tr>
		<td align="center" width="150px">이름</td>
		<td>${ dto.name }</td>
	</tr>
	<tr>
		<td align="center">전화번호</td>
		<td>${ dto.phone }</td>
	</tr>
	<tr>
		<td align="center">부모전화번호</td>
		<td>${ dto.parentPhone }</td>
	</tr>
	<tr>
		<td align="center">주소</td>
		<td>(${ dto.addr1 }) ${ dto.addr2 } ${ dto.addr3 } ${ dto.addr4 }</td>
	</tr>
	<tr>
		<td colspan="2" align="center">
			<button type="button" onclick="move('edit.do', '${ dto.hakbun }');">수정</button>
			<button type="button" onclick="move('drop.do', '${ dto.hakbun }');">삭제</button>
		</td>
	</tr>
</table>

<div style="width: 60%; margin-top: 10px;" align="right">
	|
	<a href="#" onclick="move('list.do', '');">목록</a>
	|
	<a href="#" onclick="move('regi.do', '');">등록</a>
	|
</div>

<script>
function move(value1, value2) {
	location.href='${ path }/haksaStudent_servlet/' + value1 + "?hakbun=" + value2;
}
</script>
</body>
</html>