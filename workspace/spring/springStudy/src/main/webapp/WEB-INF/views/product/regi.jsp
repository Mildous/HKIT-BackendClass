<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../_include/inc_header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${title}</title>
</head>
<body>

<%@include file="../_include/inc_menu.jsp" %>
<h2>${title}</h2>

<form name="DirForm" method="post" action="${path}/product/regiProc">
<table border="1" width="60%">
	<tr>
		<td>상품이름</td>
		<td><input type="text" name="productName"></td>
	</tr>
	<tr>
		<td>상품가격</td>
		<td><input type="text" name="productPrice"></td>
	</tr>
	<tr>
		<td>제조사</td>
		<td>
			vendorNo : <input type="text" name="vendorNo"><br>
			vendorName : <input type="text" name="vendorName">
		</td>
	</tr>
	<tr>
		<td>상품설명</td>
		<td><textarea name="productDescription" style="width:300px; height:100px;"></textarea></td>
	</tr>
	<tr>
		<td>첨부파일</td>
		<td><input type="text" name="attachInfo" value="-" readonly></td>
	</tr>
	<tr>
		<td colspan="2" align="center">
			<button type="submit">확인</button>
			<button type="button" onclick="history.back();">뒤로</button>
		</td>
	</tr>
</table>
</form>

</body>
</html>