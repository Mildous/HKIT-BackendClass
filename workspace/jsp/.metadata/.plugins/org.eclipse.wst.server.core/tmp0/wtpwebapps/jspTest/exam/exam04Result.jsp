<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("id");
	String name = request.getParameter("pw");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 완료</title>
</head>
<body>
	<h2>회원가입 완료</h2>
	<%= name %>(<%= id %>)님 회원가입을 환영합니다.
	<br>
	즐거운 하루 되세요..
</body>
</html>