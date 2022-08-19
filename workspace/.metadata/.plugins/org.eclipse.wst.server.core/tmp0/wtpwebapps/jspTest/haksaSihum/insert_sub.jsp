<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<h2>시험등록</h2>

<form name="DirForm">
<table border="1" width="40%" align="center">
	<tr>
		<th>시험명</th>
		<td><input type="text" name="sihumName" id="sihumName"></td>
	</tr>
	<tr>
		<th>시험일자</th>
		<td><input type="date" name="sihumDate" id="sihumDate"></td>
	</tr>
	<tr>
		<td colspan="2" align="center">
			<button type="button" onClick="formSubmit();">저장하기</button>
			<button type="button" onClick="location.href='list.jsp';">목록으로</button>
		</td>
	</tr>
</table>
</form>

<script>
function formSubmit() {
	if(confirm('저장하시겠습니까?')) {
		document.DirForm.action = "insertProc.jsp";
		document.DirForm.method = "post";
		document.DirForm.submit();
	}
}
</script>
