<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="_inc_top.jsp" %>

<%
	String searchField = request.getParameter("searchField");
	String searchWord = request.getParameter("searchWord");
%>

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
						imsiImgPath += imsiArray2[1];
						
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

</table>

<div style="padding-top: 20px; width: 50%; " align="right">
	|
	<a href="#" onClick="move('shopProduct_list', '', '<%= searchField %>', '<%= searchWord %>');">목록</a>
	|
	<a href="#" onClick="move('shopProduct_regi', '', '<%= searchField %>', '<%= searchWord %>');">등록</a>
	|
	<a href="#" onClick="move('shopProduct_edit', '<%= dto.getProductCode() %>', '<%= searchField %>', '<%= searchWord %>');">수정</a>
	|
	<a href="#" onClick="move('shopProduct_drop', '<%= dto.getProductCode() %>', '<%= searchField %>', '<%= searchWord %>');">삭제</a>
	|
</div>
<script>
function move(value1, value2, searchField, searchWord) {
	location.href='main.jsp?menuGubun=' + value1 + '&productCode=' + value2 + '&searchField=' + searchField + '&searchWord=' + searchWord;
}
</script>
