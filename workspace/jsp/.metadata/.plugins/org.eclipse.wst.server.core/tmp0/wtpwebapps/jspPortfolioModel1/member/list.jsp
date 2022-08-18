<%@page import="member.model.dto.MemberDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="member.model.dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	MemberDAO dao = new MemberDAO();
	ArrayList<MemberDTO> list = dao.getSelectAll();
%>

<h2>회원목록</h2>

<table border="1" width="80%">
	<tr>
		<th>순번</th>
		<th>아이디</th>
		<th>이름</th>
		<th>연락처</th>
		<th>주민번호</th>
		<th>등급</th>
		<th>등록일</th>
	</tr>
	<%
		for(int i=0; i<list.size(); i++) {
			MemberDTO dto = list.get(i);		
	%>
		<tr>
			<td><%= dto.getNo() %></td>
			<td><a href="#" onClick="move('member_view', '<%= dto.getNo() %>');"><%= dto.getId() %></a></td>
			<td><%= dto.getName() %></td>
			<td><%= dto.getPhone() %></td>
			<td><%= dto.getJumin().substring(0, 8) %>******</td>
			<td><%= dto.getGrade() %></td>
			<td><%= dto.getRegiDate() %></td>
		</tr>
	<%		
		}
	%>

</table>

<div style="padding-top: 20px; width: 80%; " align="right">
	|
	<a href="#" onClick="move('member_list', '');">목록</a>
	|
	<a href="#" onClick="move('member_insert', '');">등록</a>
	|
	<a href="#" onClick="move('member_attachInsert', '');">등록(attach)</a>
	|
</div>

<script>
function move(value1, value2) {
	location.href='main.jsp?menuGubun=' + value1 + '&no=' + value2;
}
</script>