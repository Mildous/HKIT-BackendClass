<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인 페이지</title>
</head>
<body>
<c:choose>
<c:when test="${ sessionScope.id != null }">
<h2>${ sessionScope.id }님 환영합니다. <a href="../member/logout.do">[로그아웃]</a></h2>
<h2>메인페이지입니다.</h2>
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