<%@page import="boardBasic.model.dao.BoardBasicDAO"%>
<%@page import="boardBasic.model.dto.BoardBasicDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="_inc_top.jsp" %>
    
<%
	String no_ = request.getParameter("no");
	int no = Integer.parseInt(no_);
	
	BoardBasicDTO arguDto = new BoardBasicDTO();
	BoardBasicDAO dao = new BoardBasicDAO();
	arguDto.setNo(no);
	
	BoardBasicDTO dto = dao.getSelectOne(arguDto);
	

	if(dto.getNo() <= 0) {
		out.println("<script>alert('존재하지 않는 회원입니다.'); location.href='main.jsp?menuGubun=boardBasic_list';</script>");
		return;
	}
%>

<style>
td {
	padding-left: 5px;
}
</style>
<h2>상세보기</h2>
<table border="1" align="center" width="80%">
	<tr>
		<th>번호</th>
		<td><%= dto.getNum() %></td>
		<th>조회수</th>
		<td><%= dto.getHit() %></td>
	</tr>
	<tr>
		<th>작성자</th>
		<td><%= dto.getWriter() %></td>
		<th>이메일</th>
		<td><%= dto.getEmail() %></td>
	</tr>
	<tr>
		<th>제목</th>
		<td><%= dto.getSubject() %></td>	
		<th>작성일</th>
		<td><%= dto.getRegiDate() %></td>
	</tr>	
	<tr>
		<th>내용</th>
		<td colspan="3" height="100">
			<%= dto.getContent().replace("\n", "<br>") %>
		</td>
	</tr>
	<tr>
		<td colspan="4" align="center">
			<button type="button" onClick="move('boardBasic_insert', '<%= no %>');">답글달기</button>
		</td>
	</tr>
</table>

<div style="padding-top: 20px; width: 80%; " align="right">
	|
	<a href="#" onClick="move('boardBasic_list', '');">목록</a>
	|
	<a href="#" onClick="move('boardBasic_insert', '');">등록</a>
	|
	<a href="#" onClick="move('boardBasic_edit', '<%= no %>');">수정</a>
	|
	<a href="#" onClick="move('boardBasic_delete', '<%= no %>');">삭제</a>
	|
</div>

<script>
function move(value1, value2) {
	location.href='main.jsp?menuGubun=' + value1 + '&no=' + value2;
}
</script>