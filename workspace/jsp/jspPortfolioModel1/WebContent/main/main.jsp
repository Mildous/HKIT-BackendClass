<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../_include/inc_header.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>main</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>

	table {
		border-collapse: collapse;
	}
</style>
</head>
<body>

<table border="1" width="80%" align="center">
	<tr>
		<td height="100px;" align="center" style="background-color: #90AACB;">
			<jsp:include page="../_include/inc_menu.jsp" flush="true" />
		</td>
	</tr>
	<tr>
		<td height="300px;" align="center" style="padding: 30px 0px 30px 0px; background-color: #FFF;">
			<jsp:include page="<%= includePage %>" flush="true" />
		</td>
	</tr>
	<tr>
		<td height="100px;" align="center" style="background-color: #4B6587;">
			<jsp:include page="../_include/inc_copyright.jsp" flush="true" />
		</td>
	</tr>
</table>
</body>
</html>