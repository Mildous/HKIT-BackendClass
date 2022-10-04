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

<form name="DirForm" method="post" action="${path}/product/dropProc">
<input type="hidden" name="productNo" value="${ dto.productNo }">
<table border="1" width="60%">
	<tr>
		<td>상품번호</td>
		<td>${ dto.productNo }</td>
	</tr>
	<tr>
		<td>상품이름</td>
		<td>${ dto.productName }</td>
	</tr>
	<tr>
		<td>상품가격</td>
		<td>${ dto.productPrice }원</td>
	</tr>
	<tr>
		<td>제조사</td>
		<td>${ dto.vendorName } (${ dto.vendorNo })</td>
	</tr>
	<tr>
		<td>상품설명</td>
		<td>${ dto.productDescription }</td>
	</tr>
	<tr>
		<td>첨부파일</td>
		<td>
		<c:choose>
			<c:when test="${ dto.attachInfo != '-' }">
				<c:set var="tempArray1" value="${ fn:split(dto.attachInfo, ',') }" />
				<c:set var="temp1" value="${ tempArray1[0] }" />
				<c:set var="temp2" value="${ tempArray1[1] }" />
				<img src="${ path }/attach${path}/product/${ tempArray1[1] }" alt="${ tempArray1[0] }" title="${ dto.productName }" style="width: 50px; height: 50px;" />
			</c:when>
			<c:otherwise>&nbsp;</c:otherwise>
		</c:choose>
		</td>
	</tr>
	<tr>
		<td colspan="2" align="center">
			<button type="submit">삭제</button>
			<button type="button" onclick="history.back();">취소</button>
		</td>
	</tr>
</table>
</form>

</body>
</html>