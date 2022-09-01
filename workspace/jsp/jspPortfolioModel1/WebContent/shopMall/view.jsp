<%@page import="product.model.dto.ProductDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="_inc_top.jsp" %>


<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />

<h2>상품정보</h2>
<table border="1" width="50%">
	<tr>
		<td colspan="3" align="center">
			<%
				if(dto.getAttachInfo() == null || dto.getAttachInfo().equals("-")) {
					out.println("<img src='../img/image_not_supported.png'>");
				} else {
					String[] imsiArray = dto.getAttachInfo().split(",");
					for(int j=0; j<imsiArray.length; j++) {
						String[] imsiArray2 = imsiArray[j].split("[|]");
							
						String imsiImgPath = "";
						imsiImgPath += request.getContextPath();
						imsiImgPath += "/attach";
						imsiImgPath += request.getContextPath();
						imsiImgPath += "/product/";
						
						
						out.println("<img src='" + imsiImgPath + "' width='200px'>");
					}
				}
			%>
		</td>
	</tr>
	<tr>
		<th>제조사</th>
		<th>상품명</th>
		<th>상품가격</th>
	</tr>
	<tr>
		<td align="center"><%= dto.getVendorName() %></td>
		<td align="center"><%= dto.getProductName() %></td>
		<td align="center"><%= dto.getProductPrice() %>만원</td>
	</tr>
	<tr>
		<td colspan="4" style="padding: 20px;">
			<select name="jubunSu">
				<option value="0">-- 선택 --</option>
			<%	for(int i=1; i<=20; i++) { %>
				<option value="<%= i %>"><%= i %></option>
			<%	} %>
			</select>
			&nbsp;
			<button type="button">장바구니담기</button>
			<button type="button">바로구매</button>
			<button type="button">계속쇼핑</button>
			<button type="button">장바구니보기</button>
		</td>
	</tr>

</table>

<script>
function move(value1, value2) {
	location.href='main.jsp?menuGubun=' + value1 + '&productCode=' + value2;
}
</script>
