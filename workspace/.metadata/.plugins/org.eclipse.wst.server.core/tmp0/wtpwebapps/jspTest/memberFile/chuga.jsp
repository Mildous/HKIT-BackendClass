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

</table>

<script>
function move(value1) {
	location.href=value1;
}
function join() {
	document.chugaForm.action="chugaProc.jsp";
	document.chugaForm.method="post";
	document.chugaForm.submit();
}
</script>
</body>
</html>