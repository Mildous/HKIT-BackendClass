<%@page import="guestbook.model.dto.GuestBookDTO"%>
<%@page import="guestbook.model.dao.GuestBookDAO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    GuestBookDAO dao = new GuestBookDAO();
	ArrayList<GuestBookDTO> list = dao.getSelectAll();
	int totalCount = list.size();
%>

<h2>방명록</h2>

<table border="1" width="80%">
	<tr>
		<th>순번</th>
		<th>내용</th>
		<th>이름</th>
		<th>이메일</th>
		<th>등록일</th>
	</tr>
	<%
		if(totalCount == 0) {
	%>
	<tr>
		<td colspan="5" height="200px" align="center">등록된 내용이 없습니다..</td>
	</tr>
	<%	} %>
	<%
		int num = totalCount;
		for(int i=0; i<list.size(); i++) {
			GuestBookDTO dto = list.get(i);
	%>
	<tr>
		<td><%= num %></td>
		<td><a href="#" onClick="move('guestBook_view', '<%= dto.getNo() %>');"><%= dto.getContent() %></a></td>
		<td><%= dto.getName() %></td>
		<td><%= dto.getEmail() %></td>
		<td><%= dto.getRegiDate() %></td>
	</tr>
	<%		
			num--;
		}
	%>
</table>

<div style="padding-top: 20px; width: 80%; " align="right">
	|
	<a href="#" onClick="move('guestBook_list', '');">목록</a>
	|
	<a href="#" onClick="move('guestBook_insert', '');">등록</a>
	|
</div>   

<script>
function move(value1, value2) {
	location.href='main.jsp?menuGubun=' + value1 + '&no=' + value2;
}
</script>