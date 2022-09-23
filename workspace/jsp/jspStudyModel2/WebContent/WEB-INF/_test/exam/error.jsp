<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h2>error.jsp</h2>

에러코드 : ${ errorCode }
<br>
에러메세지 : ${ errorMsg }
<br>
<button type="button" onclick="move();">홈으로</button>

<script type="text/javascript">
function move() {
	location.href='${ path }';
}
</script>
</body>
</html>