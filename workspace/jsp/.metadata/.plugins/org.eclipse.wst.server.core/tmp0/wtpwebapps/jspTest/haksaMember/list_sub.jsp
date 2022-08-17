<%@page import="haksaMember.model.dto.HaksaMemberDTO"%>
<%@page import="haksaMember.model.dao.HaksaMemberDAO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	HaksaMemberDAO dao = new HaksaMemberDAO();
	ArrayList<HaksaMemberDTO> list = dao.getSelectAll();
	
	int totalRecord = list.size();
%>

<h2>학사목록</h2>

<table border="1" width="80%" align="center">
	<tr>
		<th>순번</th>
		<th>이름</th>
		<th>전화번호</th>
		<th>주소</th>
		<th>등록일</th>
	</tr>
	<% if(totalRecord == 0) { %>
	<tr>
		<td colspan="5" height="200px" align="center">등록된 내용이 없습니다..</td>
	</tr>
	<% } %>
	<% 
	int num = totalRecord;
	for(int i=0; i<list.size(); i++) { 
		HaksaMemberDTO dto = list.get(i);
	%>
	<tr>
		<td><%= num %></td>
		<td><a href="#" onClick="move('view.jsp', '<%= dto.getHakbun() %>');"><%= dto.getName() %></a></td>
		<td><%= dto.getPhone() %></td>
		<td><%= dto.getAddr2() %></td>
		<td><%= dto.getRegiDate() %></td>
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
	location.href = value1 + '?hakbun=' + value2;
}
</script>
