<%@page import="bookInfo.model.dao.BookInfoDAO"%>
<%@page import="bookInfo.model.dto.BookInfoDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String infoNo_ = request.getParameter("infoNo");
	int infoNo = Integer.parseInt(infoNo_);
	
	BookInfoDTO arguDto = new BookInfoDTO();
	arguDto.setInfoNo(infoNo);
	
	BookInfoDAO dao = new BookInfoDAO();
	BookInfoDTO resultDto = dao.getSelectOne(arguDto);
%>

<h2>도서삭제</h2>

<form name="DirForm">
<input type="hidden" name="infoNo" id="infoNo" value="<%= resultDto.getInfoNo() %>">
<table border="1" width="40%" align="center">
	<tr>
		<th>도서명</th>
		<td><%= resultDto.getSubject() %></td>
	</tr>
	<tr>
		<th>저자</th>
		<td><%= resultDto.getAuthor() %></td>
	</tr>
	<tr>
		<th>발행일</th>
		<td><%= resultDto.getCreated() %></td>
	</tr>
	<tr>
		<th>분류</th>
		<td><%= resultDto.getProfile() %></td>
	</tr>
	
	<tr>
		<td colspan="2" align="center">
			<button type="button" onClick="formSubmit();">삭제하기</button>
			<button type="button" onClick="location.href='list.jsp';">목록으로</button>
		</td>
	</tr>
</table>
</form>

<script>
function formSubmit() {
	if(confirm('삭제할까요?')) {
		document.DirForm.action = "deleteProc.jsp";
		document.DirForm.method = "post";
		document.DirForm.submit();
	}
}
</script>