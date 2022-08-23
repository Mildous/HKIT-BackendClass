<%@page import="haksaSihum.model.dao.HaksaSihumDAO"%>
<%@page import="haksaSihum.model.dto.HaksaSihumDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String sihumNo_ = request.getParameter("sihumNo");
	int sihumNo = Integer.parseInt(sihumNo_);
	
	HaksaSihumDTO arguDto = new HaksaSihumDTO();
	arguDto.setSihumNo(sihumNo);
	
	HaksaSihumDAO dao = new HaksaSihumDAO();
	HaksaSihumDTO resultDto = dao.getSelectOne(arguDto);
%>

<h2>시험변경</h2>

<form name="DirForm">
<input type="hidden" name="sihumNo" id="sihumNo" value="<%= resultDto.getSihumNo() %>">
<table border="1" width="40%" align="center">
	<tr>
		<th>시험명</th>
		<td><%= resultDto.getSihumName() %></td>
	</tr>
	<tr>
		<th>시험일자</th>
		<td><input type="date" name="sihumDate" id="sihumDate" value="<%= resultDto.getSihumDate() %>"></td>
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
	if(confirm('수정하시겠습니까?')) {
		document.DirForm.action = "editProc.jsp";
		document.DirForm.method = "post";
		document.DirForm.submit();
	}
}
</script>