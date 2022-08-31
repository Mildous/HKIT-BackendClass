<%@page import="vendor.model.dto.VendorDTO"%>
<%@page import="vendor.model.dao.VendorDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="_inc_top.jsp" %>

<%
	String searchField = request.getParameter("searchField");
	String searchWord = request.getParameter("searchWord");
%>

<h2>상품정보</h2>
<form name="regiForm">
<input type="hidden" name="productCode" value="<%= dto.getProductCode() %>">
<table border="1" width="50%">
	<tr>
		<th>상품명</th>
		<td><%= dto.getProductName() %></td>
	</tr>
	<tr>
		<th>상품가격</th>
		<td><input type="text" name="productPrice" value="<%= dto.getProductPrice() %>"></td>
	</tr>
	<tr>
		<th>제조사</th>
		<td><%= dto.getVendorName() %></td>
	</tr>
	<tr>
		<th>첨부</th>
		<td>
		<%
			if(dto.getAttachInfo() == null || dto.getAttachInfo().equals("-")) {
				out.println("&nbsp;");
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
					
					out.println("<img src='" + imsiImgPath + "' width='200px'><br>" + imsiArray2[0] + " (" + imsiArray2[3] + ")<br>");
				}
			}
		%>
		</td>
	</tr>
	<tr>
		<td colspan="2" align="center">
			<button type="button" onClick="save();">수정하기</button>
			<button type="button" onClick="location.href='main.jsp?menuGubun=shopProduct_list';">목록으로</button>
		</td>
	</tr>
</table>
</form>

<script>
function save() {
	if(confirm('수정하시겠습니까?')) {
		document.regiForm.action = "mainProc.jsp?menuGubun=shopProduct_editProc";
		document.regiForm.method = "post";
		document.regiForm.submit();
	}
}
</script>
