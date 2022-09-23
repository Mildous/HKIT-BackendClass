<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/inc_header.jsp" %>

<style>
@import url('https://fonts.googleapis.com/css2?family=Alumni+Sans+Pinstripe&family=Boogaloo&display=swap');
#login_table {
	border: none;
	width: 300px;
	padding: 0px 20px 20px 0px;
}
#login_img {
	width: 20px;
	height: 20px;
}
#login_input {
	text-align: left;
	width: 200px;
	height: 20px;
	border: none;
	border-bottom: solid 2px black;
	padding: 10px;
}
#login_btn {
	width: 100px;
	height: 30px;
	font-weight: bold;
	border-radius: 20px;
	background: white;
	margin-top: 20px;
}

#login_title	{
	font-size: 2em;
	font-family: 'Boogaloo', cursive;
	width: 20%;
}

#main_title	{
	font-size: 2em;
	font-family: 'Boogaloo', cursive;
	width: 20%;
}
#main_img {
	width: 400px;
	display: flex;
	justify-content: center;
	align-items: center;
}
</style>

<script>
function validateForm(form) {
	if(form.user_id.value == null || form.user_id.value == "") {
		alert("아이디를 입력하세요");
		return false;
	}
	if(!form.user_pw.value) {
		alert("비밀번호를 입력하세요");
		return false;
	}
}
</script>
<c:choose>
<c:when test="${ sessionNo == 0 }">
<br><br>
<h2 id="login_title">Login</h2>
<form name="loginForm" method="post" action="mainProc.jsp?menuGubun=noLogin_loginProc" onsubmit="return validateForm(this);">
<table id="login_table">
	<tr>
		<td align="center">
			<img src="../img/user.png" id="login_img">&nbsp;
			<input type="text" id="login_input" name="user_id" placeholder="enter your ID..">
		</td>
	</tr>
	<tr>
		<td align="center">
			<img src="../img/lock.png" id="login_img">&nbsp;
			<input type="password" id="login_input" name="user_pw" placeholder="enter your Password..">
		</td>
	</tr>
	<tr height="50px">
		<td align="center">
			<button type="submit" id="login_btn">Login</button>
		</td>
	</tr>
</table>
</form>
<br><br>
		
<script>
function login() {
	if(confirm('로그인 하시겠습니까?')) {
		document.loginForm.action = 'mainProc.jsp?menuGubun=noLogin_loginProc';
		document.loginForm.method = 'post';
		document.loginForm.submit();
	}
}
</script>
</c:when>

<c:otherwise>
<div >
	<h2 id="main_title">Hello world!</h2>
</div>
</c:otherwise>
</c:choose>