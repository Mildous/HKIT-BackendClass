<%@page import="java.util.ArrayList"%>
<%@page import="memo.model.dto.MemoDTO"%>
<%@page import="memo.model.dao.MemoDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
<%
    MemoDAO dao = new MemoDAO();
	ArrayList<MemoDTO> list = dao.getSelectAll();
	int totalCount = list.size();
%>

<h2>메모장</h2>

<table border="1" width="80%">
	<tr>
		<th>순번</th>
		<th>내용</th>
		<th>작성자</th>
		<th>등록일</th>
	</tr>
	<%
		if(totalCount == 0) {
	%>
	<tr>
		<td colspan="4" height="200px" align="center">등록된 내용이 없습니다..</td>
	</tr>
	<%	} %>
	<%
		int num = totalCount;
		for(int i=0; i<list.size(); i++) {
			MemoDTO dto = list.get(i);
	%>
	<tr>
		<td><%= num %></td>
		<td><a href="#" onClick="move('memo_view', '<%= dto.getNo() %>');"><%= dto.getContent() %></a></td>
		<td><%= dto.getWriter() %></td>
		<td><%= dto.getRegiDate() %></td>
	</tr>
	<%		
			num--;
		}
	%>
</table>

<div style="padding-top: 20px; width: 80%; " align="right">
	|
	<a href="#" onClick="move('memo_list', '');">목록</a>
	|
	<a href="#" onClick="move('memo_insert', '');">등록</a>
	|
</div>   

<script>
function move(value1, value2) {
	location.href='main.jsp?menuGubun=' + value1 + '&no=' + value2;
}
</script>