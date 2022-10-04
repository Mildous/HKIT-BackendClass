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

<form name="CartForm">
<table border="1" width="80%">
	<tr>
		<th>순번</th>
		<th>상품이름</th>
		<th>상품단가</th>
		<th>수량</th>
		<th>금액</th>
		<th>등록일</th>
		<th>비고</th>
	</tr>
	
	<c:choose>
		<c:when test="${ empty cart }">
		<tr>
			<td colspan="7" height="100px" align="center">장바구니가 비었습니다..</td>
		</tr>
		</c:when>
		
		<c:otherwise>
			<c:set var="totalPay" value="0" />
			<c:set var="k" value="0" />
			<c:forEach items="${ cart }" var="cart" varStatus="loop">
			<tr align="center">
				<td>${ cart.cartNo }</td>
				<td>${ cart.productName } (${ cart.productNo })</td>
				<td>${ cart.productPrice }</td>
				<td>
					<input type="hidden" name="cartNo_${ k }" value="${ cart.cartNo }">
					<input type="text" name="amount_${ k }" value="${ cart.amount }">
				</td>
				<td>${ cart.pay }</td>
				<td>${ cart.regiDate }</td>
				<td>
					<a href="#" onclick="drop('${cart.cartNo}');">[삭제]</a>
				</td>
			</tr>
				<c:set var="k" value="${ k = k + 1 }" />
				<c:set var="totalPay" value="${ totalPay = totalPay + cart.pay }" />
			</c:forEach>
			<tr>
				<td align="right" colspan="8">
					<c:set var="delivery" value="5000"/>
					장바구니 급액 합계 : <fmt:formatNumber value="${ totalPay }" pattern="#,###,###,###" />원<br>
					배송료 : <fmt:formatNumber value="${ delivery }" pattern="###,###" />원<br>
					총합계 : <fmt:formatNumber value="${ totalPay + delivery }" pattern="#,###,###,###" />원<br>
				</td>
			</tr>
		</c:otherwise>
	</c:choose>
	
</table>
<input type="hidden" name="totalCounter" value="${ k }">
</form>

<form name="dropForm">
	<input type="hidden" name="cartNo">
</form>

<div style="width: 80%; margin-top: 10px;" align="right">
	<button type="button" onclick="update();">수정</button>&nbsp;
	<button type="button" onclick="allClear();">장바구니 비우기</button>
</div>

<script>
function update() {
	if(confirm('수정할까욥')) {
		document.CartForm.action = "${ path }/cart/editProc";
		document.CartForm.method = "post";
		document.CartForm.submit();
	}
}

function drop(value1) {
	if(confirm('삭제할까욥')) {
		document.dropForm.cartNo.value = value1;
		document.dropForm.action = "${ path }/cart/dropProc";
		document.dropForm.method = "post";
		document.dropForm.submit();
	}
}

function allClear() {
	if(confirm('정말 비울까요?')) {
		location.href="${ path }/cart/clearProc";
	}
}
</script>
</body>
</html>