<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 수정 페이지</title>
<script>
function validateForm(form) {
	if(form.pass.value == "") {
		alert("비밀번호를 입력하세요..");
		form.pass.focus();
		return false;
	}
	if(form.passChk.value == "") {
		alert("비밀번호 확인을 입력하세요..");
		form.passChk.focus();
		return false;
	}
	if(form.passChk.value != form.pass.value) {
		alert("비밀번호와 비밀번호 확인이 다릅니다!");
		form.pass.focus();
		return false;
	}
}
</script>
</head>
<body>

<c:choose>
<c:when test="${ sessionScope.id != null }">
<h2>${ id }님 환영합니다. <a href="../member/logout.do">[로그아웃]</a></h2>
<h2>비밀번호 수정 페이지입니다.</h2>

<form name="updateForm" action="../member/updatePass.do" method="post" onsubmit="return validateForm(this);">
<input type="hidden" name="id" value="${ sessionScope.id }"/>
<table border="1" width="400px">
	<tr>
		<td>비밀번호 :</td>
		<td><input type="password" name="pass" id="pass" /></td>
	</tr>
	<tr>
		<td>비밀번호 확인 : </td>
		<td><input type="password" name="passChk" id="passChk" /></td>
	</tr>
	<tr>
		<td colspan="2" align="center">
			<button type="submit">비밀번호변경하기</button>
		</td>
	</tr>
</table>
</form>
</c:when>
<c:otherwise>
<script>
function move() {
	alert("로그인 후 이용바랍니다.");
	location.href="../member/login.jsp";
}
move();
</script>
</c:otherwise>
</c:choose>
</body>
</html>