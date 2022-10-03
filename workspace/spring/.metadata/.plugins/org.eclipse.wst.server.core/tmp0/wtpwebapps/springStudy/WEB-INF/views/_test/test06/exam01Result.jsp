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
<table border="1">
	<tr>
		<td>상품분류</td>
		<td>${ dto.productCate }</td>
	</tr>
	<tr>
		<td>상품이름</td>
		<td>${ dto.productName }</td>
	</tr>
	<tr>
		<td>상품가격</td>
		<td>${ dto.productPrice }</td>
	</tr>
	<tr>
		<td>할인된가격</td>
		<td>${ dto.salesPrice }</td>
	</tr>
	<tr>
		<td>제조사</td>
		<td>${ dto.vendor }</td>
	</tr>
</table>

</body>
</html>