<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="_inc_top.jsp" %>

<h2>제조사 등록</h2>

<form name="regiForm">
<table border="1" width="30%">
	<tr>
		<th>제조사명</th>
		<td style="padding: 10px;"><input type="text" name="vendorName" id="vendorName" value=""></td>
	</tr>
	<tr>
		<td colspan="2" align="center" style="padding: 10px;">
			<button type="button" onClick="save();">등록하기</button>
			<button type="button" onClick="location.href='main.jsp?menuGubun=shopVendor_list';">목록으로</button>
		</td>
	</tr>
</table>
</form>

<script>
function save() {
	if(confirm('등록하시겠습니까?')) {
		document.regiForm.action = "mainProc.jsp?menuGubun=shopVendor_regiProc";
		document.regiForm.method = "post";
		document.regiForm.submit();
	}
}
</script>
