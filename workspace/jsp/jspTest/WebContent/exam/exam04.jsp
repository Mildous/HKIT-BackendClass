<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>exam04.jsp</title>
</head>
<body>
	<h2>회원가입</h2>
	<form name="testForm" method="get" action="./exam04Proc.jsp">
	<table>
		<tr>
			<td>아이디</td>
			<td>: <input type="text" name="id"></td>
		</tr>
		<tr>
			<td>비밀번호</td>
			<td>: <input type="password" name="pw"></td>
		</tr>
		<tr>
			<td>이름</td>
			<td>: <input type="text" name="name"></td>
		</tr>
		<tr>
			<td>닉네임</td>
			<td>: <input type="text" name="nick"></td>
		</tr>
		<tr>
			<td>주민번호</td>
			<td>: <input type="text" name="num1" size="10"> - <input type="text" name="num2" size="10"></td>
		</tr>
		<tr>
			<td>연락처</td>
			<td>: <input type="text" name="tel1" size="5"> - <input type="text" name="tel2" size="5"> - <input type="text" name="tel3" size="5"></td>
		</tr>
		<tr>
			<td>주소</td>
			<td>: <input type="text" name="addr"></td>
		</tr>
		<tr>
			<td>이메일</td>
			<td>: <input type="text" name="email" size="10"> @ <input type="text" name="email2" size="10"></td>
		</tr>
		<tr>
			<td colspan="2"><button type="submit">확인</button></td>
		</tr>
	</table>
</body>
</html>