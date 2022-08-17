<%@page import="haksaMember.model.dao.HaksaMemberDAO"%>
<%@page import="haksaMember.model.dto.HaksaMemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String hakbun_ = request.getParameter("hakbun");
	int hakbun = Integer.parseInt(hakbun_);
	
	HaksaMemberDTO arguDto = new HaksaMemberDTO();
	arguDto.setHakbun(hakbun);
	
	HaksaMemberDAO dao = new HaksaMemberDAO();
	HaksaMemberDTO resultDto = dao.getSelectOne(arguDto);
%>

<h2>학사정보</h2>
<table border="1" width="80%">
	<tr>
		<th>학번</th>
		<td><%= resultDto.getHakbun() %></td>
	</tr>
	<tr>
		<th>이름</th>
		<td><%= resultDto.getName() %></td>
	</tr>
	<tr>
		<th>전화번호</th>
		<td><%= resultDto.getPhone() %></td>
	</tr>
	<tr>
		<th>부모님연락처</th>
		<td><%= resultDto.getParentPhone() %></td>
	</tr>
	<tr>
		<th>주소</th>
		<td>(<%= resultDto.getAddr1() %>) <%= resultDto.getAddr2() %> <%= resultDto.getAddr3() %> <%= resultDto.getAddr4() %></td>
	</tr>
</table>

<div style="border: 0px solid blue; width: 80%; margin: 10px, 0px;" align="right">
|
<a href="#" onClick="move('list.jsp', '');">목록</a>
|
<a href="#" onClick="move('insert.jsp', '');">등록</a>
|
<a href="#" onClick="move('edit.jsp', '<%= hakbun %>');">수정</a>
|
<a href="#" onClick="move('delete.jsp', '<%= hakbun %>');">삭제</a>
|
</div>

<script>
function move(value1, value2) {
	location.href = value1 + '?hakbun=' + value2;
}

</script>