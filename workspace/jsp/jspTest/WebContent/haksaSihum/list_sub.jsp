<%@page import="haksaSihum.model.dto.HaksaSihumDTO"%>
<%@page import="haksaSihum.model.dao.HaksaSihumDAO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	HaksaSihumDAO dao = new HaksaSihumDAO();
	ArrayList<HaksaSihumDTO> list = dao.getSelectAll();
	
	int totalRecord = list.size();
%>

<h2>시험목록</h2>

<table border="1" width="80%" align="center">
	<tr>
		<th>순번</th>
		<th>시험명</th>
		<th>시험일자</th>
		<th>등록일</th>
		<th>비고</th>
	</tr>
	<% if(totalRecord == 0) { %>
	<tr>
		<td colspan="5" height="200px" align="center">등록된 내용이 없습니다..</td>
	</tr>
	<% } %>
	<% 
	int num = totalRecord;
	for(int i=0; i<list.size(); i++) { 
		HaksaSihumDTO dto = list.get(i);
	%>
	<tr>
		<td><%= num %></td>
		<td><%= dto.getSihumName() %></td>
		<td><%= dto.getSihumDate() %></td>
		<td><%= dto.getRegiDate() %></td>
		<td align="center">
			<a href="#" onClick="move('edit.jsp', '<%= dto.getSihumNo() %>');">[수정]</a>
			&nbsp;
			<a href="#" onClick="move('delete.jsp', '<%= dto.getSihumNo() %>');">[삭제]</a>
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
	location.href = value1 + '?sihumNo=' + value2;
}
</script>