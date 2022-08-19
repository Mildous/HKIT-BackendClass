<%@page import="bookInfo.model.dao.BookInfoDAO"%>
<%@page import="bookInfo.model.dto.BookInfoDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String infoNo_ = request.getParameter("infoNo");
	int infoNo = Integer.parseInt(infoNo_);
	
	BookInfoDTO arguDto = new BookInfoDTO();
	arguDto.setInfoNo(infoNo);
	
	BookInfoDAO dao = new BookInfoDAO();
	BookInfoDTO resultDto = dao.getSelectOne(arguDto);

%>

<h2>상세보기</h2>


<table border="1" width="80%">
	<tr>
		<td>도서명</td>
		<td><%= resultDto.getSubject() %></td>
	</tr>
	<tr>
		<td>저자</td>
		<td><%= resultDto.getAuthor() %></td>
	</tr>
	<tr>
		<td>발행일</td>
		<td><%= resultDto.getCreated() %></td>
	</tr>
	<tr>
		<td>분류</td>
		<td><%= resultDto.getProfile() %></td>
	</tr>
</table>

<div style="border: 0px solid blue; width: 80%; margin: 10px, 0px;" align="right">
|
<a href="#" onClick="move('list.jsp', '');">목록</a>
|
<a href="#" onClick="move('insert.jsp', '');">등록</a>
|
<a href="#" onClick="move('edit.jsp', '<%= infoNo %>');">수정</a>
|
<a href="#" onClick="move('delete.jsp', '<%= infoNo %>');">삭제</a>
|
</div>

<script>
function move(value1, value2) {
	location.href = value1 + '?infoNo=' + value2;
}

</script>
