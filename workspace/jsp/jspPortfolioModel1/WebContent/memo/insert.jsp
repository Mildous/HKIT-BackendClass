<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<h2>메모작성</h2>
<form name="insertForm">
<table border="1" align="center" width="50%">
	<tr>
		<td>작성자</td>
		<td><input type="text" name="writer"></td>
	</tr>
	<tr>
		<td>내용</td>
		<td><textarea rows="10" cols="30" name="content"></textarea></td>
	</tr>
	<tr>
		<td colspan="2" align="center">
			<button type="button" onClick="save();">저장</button>
			<button type="button" onClick="location.href='main.jsp?menuGubun=memo_list';">목록으로</button>
		</td>
	</tr>
</table>
</form>

<script>
function save() {
	if(confirm('등록할까요?')) {
		document.insertForm.action = "mainProc.jsp?menuGubun=memo_insertProc";
		document.insertForm.method = "post";
		document.insertForm.submit();
	}
}
</script>