<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="_inc_top.jsp" %>

<%
	SubBoardChkDAO dao = new SubBoardChkDAO();
	ArrayList<SubBoardChkDTO> list = dao.getSelectAll();
%>

<h2>게시판관리 목록</h2>
<fieldset style="border: 0px solid blue; margin: 10px 0px 20px 0px; width: 80%;">
	<form name="insertForm">
	<table border="0" align="left">
		<tr>
			<td>
				<input type="hidden" name="procGubun" id="procGubun" value="insertProc">
				<input type="hidden" name="boardChkNo" id="boardChkNo" ><br>
				
				tbl : <input type="text" name="tbl" id="tbl"> &nbsp;
				tblName : <input type="text" name="tblName" id="tblName"> &nbsp;
				<button type="button" onclick="save();" id="btnSave">등록하기</button>&nbsp;
				<button type="button" onclick="reset();" id="btnReset">초기화</button>
			</td>
		</tr>
	</table>
	</form>
	
	<script>
	function save() {
		if(confirm('처리할까요?')) {
			document.insertForm.action = "mainProc.jsp?menuGubun=subBoardChk_listProc";
			document.insertForm.method = "post";
			document.insertForm.submit();
		}
	}
	
	function reset() {
		document.insertForm.procGubun.value = 'insertProc';
		document.insertForm.boardChkNo.value = '';
		document.insertForm.tbl.value = '';
		document.insertForm.tblName.value = '';
		document.getElementById('btnSave').innerText = "등록하기";
	}
	</script>
</fieldset>

<table border="1" width="80%">
	<tr>
		<th>No</th>
		<th>tbl</th>
		<th>tblName</th>
		<th>regiDate</th>
		<th>&nbsp;</th>
	</tr>
<%
	for(SubBoardChkDTO dto : list) {
%>
	<tr>
		<td><%= dto.getBoardChkNo() %></td>
		<td><%= dto.getTbl() %></td>
		<td><%= dto.getTblName() %> <input type="hidden" value="<%= dto.getTblName() %>"></td>
		<td><%= dto.getRegiDate() %></td>
		<td align="center">
			<a href="#" onclick="suntaek('updateProc', '<%= dto.getBoardChkNo() %>', '<%= dto.getTbl() %>', '<%= dto.getTblName() %>');">수정</a>
			/
			<a href="#" onclick="suntaek('deleteProc', '<%= dto.getBoardChkNo() %>', '<%= dto.getTbl() %>', '<%= dto.getTblName() %>');">삭제</a>
		</td>
	</tr>
<%
	}
%>

</table>

<script>
function suntaek(value1, value2, value3, value4) {
	document.insertForm.procGubun.value = value1;
	document.insertForm.boardChkNo.value = value2;
	document.insertForm.tbl.value = value3;
	document.insertForm.tblName.value = value4;
	
	if(value1 == 'updateProc') {
		var imsiValue = "수정하기";
	} else if(value1 == 'deleteProc') {
		var imsiValue = "삭제하기";
	} else {
		var imsiValue = "등록하기";
	}
	document.getElementById('btnSave').innerText = imsiValue;
}

</script>