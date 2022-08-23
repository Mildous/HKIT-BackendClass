<%@page import="guestbook.model.dao.GuestBookDAO"%>
<%@page import="guestbook.model.dto.GuestBookDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String no_ = request.getParameter("no");
	int no = Integer.parseInt(no_);
	
	GuestBookDTO arguDto = new GuestBookDTO();
	GuestBookDAO dao = new GuestBookDAO();
	
	arguDto.setNo(no);
	GuestBookDTO dto = dao.getSelectOne(arguDto);
	
	if(dto.getNo() <= 0) {
		out.println("<script>alert('존재하지 않는 방명록입니다.'); location.href='main.jsp?menuGubun=guestBook_list';</script>");
		return;
	}
%>

<h2>방명록 수정</h2>
<form name="editForm">
<input type="hidden" name="no" value="<%= dto.getNo() %>">
<table border="1" align="center" width="50%">
	<tr>
		<th>이름</th>
		<td><%= dto.getName() %></td>
	</tr>
	<tr>
		<th>이메일</th>
		<td><%= dto.getEmail() %></td>
	</tr>
	<tr>
		<th>비밀번호</th>
		<td><input type="password" name="passwd"></td>
	</tr>
	<tr>
		<th>내용</th>
		<td>
			<textarea rows="10" cols="30" name="content"><%= dto.getContent() %></textarea>
			</td>
	</tr>
	<tr>
		<td colspan="2" align="center">
			<button type="button" onClick="edit();">수정하기</button>
			<button type="button" onClick="location.href='main.jsp?menuGubun=guestBook_list';">목록으로</button>
		</td>
	</tr>
</table>
</form>

<script>
function edit() {
	if(confirm('수정할까요?')) {
		document.editForm.action = "mainProc.jsp?menuGubun=guestBook_editProc";
		document.editForm.method = "post";
		document.editForm.submit();
	}
}
</script>