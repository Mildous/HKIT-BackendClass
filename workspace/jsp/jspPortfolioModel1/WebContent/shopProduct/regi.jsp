<%@page import="vendor.model.dto.VendorDTO"%>
<%@page import="vendor.model.dao.VendorDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="_inc_top.jsp" %>

<h2>상품등록</h2>

<form name="regiForm">
<table border="1" width="50%">
	<tr>
		<th>상품명</th>
		<td><input type="text" name="productName" id="productName" value=""></td>
	</tr>
	<tr>
		<th>상품가격</th>
		<td><input type="text" name="productPrice" id="productPrice" value="" placeholder="ex) 3,000만원 -> 3000"></td>
	</tr>
	<tr>
		<th>제조사</th>
		<td>
			<%
				VendorDAO vendorDao = new VendorDAO();
				ArrayList<VendorDTO> vList = vendorDao.getSelectAll("", "", 1, 100);
			%>
			<select name="vendorCode">
				<option value="" selected>-- 선택하세요 --</option>
				<%
					for(int i=0; i<vList.size(); i++) {
						VendorDTO vendorDto = vList.get(i);
						
						String selectedValue = "";
						if(vendorDto.getVendorCode() == 0) {
							selectedValue = "selected";
						}
				%>
				<option value="<%= vendorDto.getVendorCode() %>"><%= vendorDto.getVendorName() %></option>
				<%
					}
				%>
			</select>
		</td>
	</tr>
	<tr>
		<th>첨부</th>
		<td><input type="file" name="file1"><br>
			<input type="file" name="file2"><br>
			<input type="file" name="file3"><br>
		</td>
	</tr>
	<tr>
		<td colspan="2" align="center">
			<button type="button" onClick="save();">등록하기</button>
			<button type="button" onClick="location.href='main.jsp?menuGubun=shopProduct_list';">목록으로</button>
		</td>
	</tr>
</table>
</form>

<script>
function save() {
	if(confirm('등록하시겠습니까?')) {
		document.regiForm.enctype = "multipart/form-data";
		document.regiForm.action = "mainProc.jsp?menuGubun=shopProduct_regiProc";
		document.regiForm.method = "post";
		document.regiForm.submit();
	}
}
</script>
