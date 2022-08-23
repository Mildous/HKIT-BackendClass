<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<h2>로그인</h2>
<form name="loginForm">
<table border="1">
	<tr>
		<th>아이디</td>
		<td><input type="text" name="id"></td>
	</tr>
	<tr>
		<th>비밀번호</td>
		<td><input type="password" name="passwd"></td>
	</tr>
	<tr>
		<td colspan="2" align="center">
			<button type="button" onClick="login();">로그인</button>
		</td>
	</tr>
</table>
</form>

<script>
function login() {
	if(confirm('로그인 하시겠습니까?')) {
		document.loginForm.action = 'mainProc.jsp?menuGubun=noLogin_loginProc';
		document.loginForm.method = 'post';
		document.loginForm.submit();
	}
}
</script>