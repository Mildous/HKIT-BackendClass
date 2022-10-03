<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../_include/inc_header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%@ include file="../../_include/inc_menu.jsp" %>
<h2>${ title }</h2>
<form name="DirForm">
<table border="1">
	<tr>
		<td>상품분류 : </td>
		<td><input type="text" name="productCate"></td>
	</tr>
	<tr>
		<td>상품이름 : </td>
		<td><input type="text" name="productName"></td>
	</tr>
	<tr>
		<td>상품가격 : </td>
		<td><input type="text" name="productPrice"></td>
	</tr>
	<tr>
		<td>할인률 : </td>
		<td><input type="text" name="salesPercent"></td>
	</tr>
	<tr>
		<td>제조사 : </td>
		<td><input type="text" name="vendor"></td>
	</tr>
	<tr>
		<td colspan="2">
			<button type="button" onclick="proc();">확인</button>
		</td>
	</tr>
</table>
</form>

<script>
function proc() {
	if(confirm('ok?')) {
		document.DirForm.action = "${ path }/test07Proc";
		document.DirForm.method = "post";
		document.DirForm.submit();
	}
}
</script>
</body>
</html>