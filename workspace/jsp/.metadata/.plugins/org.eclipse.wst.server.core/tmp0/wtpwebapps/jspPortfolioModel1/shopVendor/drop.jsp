<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="_inc_top.jsp" %>

<%
	if(dto.getVendorCode() <= 0) {
		out.println("<script>alert('존재하지 않는 제조사입니다.'); location.href='main.jsp?menuGubun=shopVendor_list';</script>");
		return;
	}
%>

<h2>정보삭제</h2>

<form name="regiForm">
<input type="hidden" name="vendorCode" id="vendorCode" value="<%= dto.getVendorCode() %>">
<table border="1" width="30%">
	<tr>
		<th style="padding: 10px; width: 100px;">제조사명</th>
		<td align="center"><%= dto.getVendorName() %></td>
	</tr>
	<tr>
		<td colspan="2" align="center" style="padding: 10px;">
			<button type="button" onClick="drop();">삭제하기</button>
			<button type="button" onClick="location.href='main.jsp?menuGubun=shopVendor_list';">목록으로</button>
		</td>
	</tr>
</table>
</form>

<script>
function drop() {
	if(confirm('삭제하시겠습니까?')) {
		document.regiForm.action = "mainProc.jsp?menuGubun=shopVendor_dropProc";
		document.regiForm.method = "post";
		document.regiForm.submit();
	}
}
</script>
