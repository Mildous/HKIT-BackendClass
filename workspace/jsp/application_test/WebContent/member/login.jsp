<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 페이지</title>
<script>
function validateForm(form) {
	if(form.id.value == "") {
		alert("아이디를 입력하세요..");
		form.id.focus();
		return false;
	}
	if(form.pass.value == "") {
		alert("비밀번호를 입력하세요..");
		form.pass.focus();
		return false;
	}
}
</script>

</head>
<body>
<c:choose>
<c:when test="${ sessionScope.id == null }">
<form name="loginForm" action="../member/login.do" method="post" onsubmit="return validateForm(this);">
<table border="1" width="400px">
	<tr>
		<td>아이디 :</td>
		<td><input type="text" name="id" id="id" /></td>
	</tr>
	<tr>
		<td>비밀번호 : </td>
		<td><input type="password" name="pass" id="pass" /></td>
	</tr>
	<tr>
		<td colspan="2" align="center">
			<button type="submit">로그인</button>
		</td>
	</tr>
</table>
</form>
</c:when>
<c:otherwise>
<script>
function move() {
	location.href="../member/main.jsp?id=" + ${ sessionScope.id };
}
move();
</script>
</c:otherwise>
</c:choose>

</body>
</html>