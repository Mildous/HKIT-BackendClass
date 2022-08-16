<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품등록</title>
</head>
<body>
<table border="1" width="80%" align="center">
<tr>
	<td height="100px;" align="center">
<!-- 상단 메뉴 시작 -->
<%@ include file = "../include/inc_menu.jsp" %>
	</td>
</tr>
<tr>
	<td height="300px;" align="center">
	<h2>상품등록</h2>
	<form name="insertForm">
		<table border="1">
			<tr>
				<td>상품명</td>
				<td><input type="text" name="pName"></td>
			</tr>
			<tr>
				<td>상품가격</td>
				<td><input type="number" name="pPrice"></td>
			</tr>
			<tr>
				<td>상품설명</td>
				<td><input type="text" name="pContent"></td>
			</tr>
			<tr>
				<td>카테고리</td>
				<td><input type="text" name="pCategory"></td>
			</tr>
			<tr>
				<td>제조사</td>
				<td><input type="text" name="pVendor"></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
				<button type="button" onClick="pInput();">등록하기</button>
				</td>
			</tr>
		</table>
		<div style="border: 0px solid blue; width: 50%; margin-top: 10px;" align="right">
		|
		<a href="#" onClick="move('list.jsp');">목록</a>
		|
		</div>
	</form>
	</td>
</tr>
<tr>
	<td height="100px;" align="center">
		<%@ include file = "../include/inc_bottom.jsp" %>
	</td>
</tr>
</table>

<%@ include file = "../include/inc_script.jsp" %>
<script>
function pInput() {
	document.insertForm.action="insertProc.jsp";
	document.insertForm.method="post";
	document.insertForm.submit();
}
</script>


</body>
</html>