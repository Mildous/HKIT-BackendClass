<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학사관리(Sungjuk)</title>
</head>
<body>

<table border="1" width="80%" align="center">
	<tr>
		<td height="100px;" align="center">
			<jsp:include page="../include/inc_menu.jsp" flush="true" />
		</td> 
	</tr>
	<tr>
		<td height="300px;" align="center">
			<jsp:include page="list_sub.jsp" flush="true" />
		</td>
	</tr>
	<tr>
		<td height="100px;" align="center">
			<jsp:include page="../include/inc_bottom.jsp" flush="true" />
		</td>
	</tr>
</table>

</body>
</html>