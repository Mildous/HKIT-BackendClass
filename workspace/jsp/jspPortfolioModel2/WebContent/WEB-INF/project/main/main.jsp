<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/inc_header.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jspPortfolioModel2</title>
</head>
<body>

<table border="1" align="center" width="80%">
	<tr>
		<td align="center" style="padding: 20px 20px;">
			<jsp:include page="../include/inc_menu.jsp" />
		</td>
	</tr>
	<tr>
		<td align="center" style="padding: 20px 20px 50px 20px;">
			<jsp:include page="../${ folderName }/${ fileName }.jsp" />
		</td>
	</tr>
	<tr>
		<td align="center" style="padding: 20px 20px;">
			<jsp:include page="../include/inc_bottom.jsp" />
		</td>
	</tr>
</table>
</body>
</html>