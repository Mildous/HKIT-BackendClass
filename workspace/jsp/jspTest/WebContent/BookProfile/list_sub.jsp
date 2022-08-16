<%@page import="bookProfile.model.dto.BookProfileDTO"%>
<%@page import="bookProfile.model.dao.BookProfileDAO"%>
<%@page import="java.util.ArrayList"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	BookProfileDAO dao = new BookProfileDAO();
	ArrayList<BookProfileDTO> list = dao.getSelectAll();
	
	int totalRecord = list.size();
%>

<h2>분류목록</h2>

<table border="1" width="80%" align="center">
	<tr>
		<th>순번</th>
		<th>분류</th>
		<th>등록일</th>
		<th>비고</th>
	</tr>
	<% if(totalRecord == 0) { %>
	<tr>
		<td colspan="3" height="200px" align="center">등록된 내용이 없습니다..</td>
	</tr>
	<% } %>
	<% 
	int num = totalRecord;
	for(int i=0; i<list.size(); i++) { 
		BookProfileDTO dto = list.get(i);
	%>
	<tr>
		<td><%= num %></td>
		<td><%= dto.getProfile() %></td>
		<td><%= dto.getRegiDate() %></td>
		<td align="center">
			<a href="#" onClick="move('edit.jsp', '<%= dto.getProfileNo() %>');">[수정]</a>
			&nbsp;
			<a href="#" onClick="move('delete.jsp', '<%= dto.getProfileNo() %>');">[삭제]</a>
		</td>
	</tr>
	<%
			num--;
		}
	%>
</table>
<div style="width: 80%; margin: 10px, 0;" align="right">
	|
	<a href="#" onClick="move('list.jsp', '');">목록</a>
	|
	<a href="#" onClick="move('insert.jsp', '');">등록</a>
	|
</div>

<script>
function move(value1, value2) {
	location.href = value1 + '?profileNo=' + value2;
}
</script>
