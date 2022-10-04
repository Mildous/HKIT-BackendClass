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

<table border="1" width="80%">
	<tr>
		<th>순번</th>
		<th>상품이미지</th>
		<th>이름</th>
		<th>가격</th>
		<th>제조사</th>
		<th>첨부파일</th>
		<th>등록일</th>
	</tr>
	<c:choose>
		<c:when test="${ empty product }">
		<tr>
			<td colspan="7" height="100px" align="center">등록된 상품이 없습니다..</td>
		</tr>
		</c:when>
		
		<c:otherwise>
			<c:forEach items="${ product }" var="product" varStatus="loop">
			<tr align="center">
				<td>${ loop.index + 1 }</td>
				<td>
					<c:choose>
						<c:when test="${ product.attachInfo != '-' }">
							<c:set var="tempArray1" value="${ fn:split(product.attachInfo, ',') }" />
							<c:set var="temp1" value="${ tempArray1[0] }" />
							<c:set var="temp2" value="${ tempArray1[1] }" />
							<img src="${ path }/attach${path}/product/${ tempArray1[1] }" alt="${ tempArray1[0] }" title="${ product.productName }" style="width: 50px; height: 50px;" />
						</c:when>
						<c:otherwise>&nbsp;</c:otherwise>
					</c:choose>
				</td>
				<td><a href="#" onclick="move('view', '${ product.productNo }');">${ product.productName }</a></td>
				<td>${ product.productPrice }</td>
				<td>${ product.vendorName }</td>
				<td>
					<c:if test="${ product.attachInfo == '-' }">
						X
					</c:if>
					<c:if test="${ product.attachInfo != '-' }">
						O
					</c:if>
				</td>
				<td>${ product.regiDate }</td>
			</tr>
			</c:forEach>
		</c:otherwise>
	</c:choose>
</table>

<div style="width: 80%; margin-top: 10px;" align="right">
|
<a href="#" onclick="move('regi', '');">등록</a>
|
<a href="#" onclick="move('regiAttach', '');">등록(Attach)</a>
|
<a href="#" onclick="move('list', '');">목록</a>
|
</div>

<script>
function move(value1, value2) {
	location.href="${path}/product/" + value1 + "?productNo=" + value2;
}
</script>

</body>
</html>