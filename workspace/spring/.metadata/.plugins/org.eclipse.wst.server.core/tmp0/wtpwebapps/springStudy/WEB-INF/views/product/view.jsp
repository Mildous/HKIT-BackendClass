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
		<td id="content">${ dto.productDescription }</td>
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
		<td colspan="2" align="right">
			<form name="cartForm">
			<input type="text" name="memberNo" value="${ imsiMemberNo }">
			<input type="text" name="productNo" value="${ dto.productNo }">
			<select name="amount">
			<c:forEach begin="1" end="10" var="i">
				<option value="${ i }">${ i }</option>
			</c:forEach>
			</select>개&nbsp;
			<button type="button" onclick="cartAdd();">장바구니 담기</button>
			</form>
		</td>
	</tr>

</table>

<div style="width: 60%; padding-top: 10px;" align="right">
	|
	<a href="#" onclick="location.href='${path}/product/list';">목록</a>
	|
	<a href="#" onclick="location.href='${path}/product/edit?productNo=${ dto.productNo }';">수정</a>
	|
	<a href="#" onclick="location.href='${path}/product/drop?productNo=${ dto.productNo }';">삭제</a>
	|
</div>

<script>
$(document).ready(function() {
	var content = $("#content").text().replace(/(?:\r\n|\r|\n)/g,'<br/>');
	$("#content").html(content);
});

function cartAdd() {
	if(confirm('장바구니에 담으시겠습니까?')) {
		document.cartForm.action = "${ path }/cart/regiProc";
		document.cartForm.method = "post";
		document.cartForm.submit();
	}
}
</script>
</body>
</html>