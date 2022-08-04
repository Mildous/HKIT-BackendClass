<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원등록</title>
</head>
<body>

<table border="1" width="80%" align="center">
<tr>
	<td height="100px;" align="center">
<!-- 상단 메뉴 시작 -->
<%@ include file = "../include/inc_menu.jsp" %>
	</td>
</tr>
<tr>
	<td height="300px;" align="center">
	<h2>회원등록</h2>
	<form name="chugaForm">
		<table border="1">
			<tr>
				<td>아이디</td>
				<td><input type="text" name="id"></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="pw"></td>
			</tr>
			<tr>
				<td>비밀번호 확인</td>
				<td><input type="password" name="pwCheck"></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" name="name"></td>
			</tr>
			<tr>
				<td>연락처</td>
				<td><input type="text" name="tel"></td>
			</tr>
			<tr>
				<td>주소</td>
				<td><input type="text" name="addr"></td>
			</tr>
			<tr>
				<td>이메일</td>
				<td><input type="text" name="email"></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
				<button type="button" onClick="join();">가입하기</button>
				</td>
			</tr>
		</table>
		<div style="border: 0px solid blue; width: 50%; margin-top: 10px;" align="right">
		|
		<a href="#" onClick="move('list.jsp');">목록</a>
		|
		</div>
	</form>
	</td>
</tr>
<tr>
	<td height="100px;" align="center">
		<%@ include file = "../include/inc_bottom.jsp" %>
	</td>
</tr>
</table>

<%@ include file = "../include/inc_script.jsp" %>
<script>
function join() {
	/*
	if(document.chugaForm.id.value == '') {
		alert('아이디를 입력하세요');
		document.chugaForm.id.focus();
		return;
	}
	if(document.chugaForm.pw.value == '') {
		alert('비밀번호를 입력하세요');
		document.chugaForm.pw.focus();
		return;
	}
	if(document.chugaForm.pwCheck.value == '') {
		alert('비밀번호 확인란을 입력하세요');
		document.chugaForm.pwCheck.focus();
		return;
	}
	if(document.chugaForm.pw.value != document.chugaForm.pwCheck.value) {
		alert('비밀번호가 다릅니다.');
		document.chugaForm.pwCheck.focus();
		return;
	}
	*/
	
	document.chugaForm.action="chugaProc.jsp";
	document.chugaForm.method="post";
	document.chugaForm.submit();
}
</script>
</body>
</html>