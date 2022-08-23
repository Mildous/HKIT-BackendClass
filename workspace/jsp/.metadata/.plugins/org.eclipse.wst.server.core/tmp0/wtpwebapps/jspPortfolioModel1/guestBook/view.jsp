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
		out.println("<script>alert('존재하지 않는 방명록입니다.'); location.href='main.jsp?menuGubun=memo_list';</script>");
		return;
	}
%>

<h2>방명록 조회</h2>
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
		<th>내용</th>
		<td><%= dto.getContent() %></td>
	</tr>
</table>

<div style="padding-top: 20px; width: 50%; " align="right">
	|
	<a href="#" onClick="move('guestBook_list', '');">목록</a>
	|
	<a href="#" onClick="move('guestBook_insert', '');">등록</a>
	|
	<a href="#" onClick="move('guestBook_edit', '<%= no %>');">수정</a>
	|
	<a href="#" onClick="move('guestBook_delete', '<%= no %>');">삭제</a>
	|
</div>

<script>
function move(value1, value2) {
	location.href='main.jsp?menuGubun=' + value1 + '&no=' + value2;
}
</script>