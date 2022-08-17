<%@page import="haksaSungjuk.model.dto.HaksaSungjukDTO"%>
<%@page import="haksaSungjuk.model.dao.HaksaSungjukDAO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String sungjukNo_ = request.getParameter("sungjukNo");
	int sungjukNo = Integer.parseInt(sungjukNo_);
	
	HaksaSungjukDTO arguDto = new HaksaSungjukDTO();
	arguDto.setSungjukNo(sungjukNo);
	
	HaksaSungjukDAO dao = new HaksaSungjukDAO();
	HaksaSungjukDTO resultDto = dao.getSelectOne(arguDto);
%>

<h2>성적정보</h2>

<form name="DirForm">
<table border="1" width="50%" align="center">
	<tr style="background: lightgray;">
		<th colspan="5" align="center"><%= resultDto.getSihumName() %></td>
	</tr>
	<tr>		
		<th colspan="5" align="center"><%= resultDto.getName() %></td>
	</tr>
	<tr style="background: lightgray;">
		<th>국어</th>
		<th>영어</th>
		<th>수학</th>
		<th>과학</th>
		<th>역사</th>
	</tr>
	<tr>
		<td align="center"><%= resultDto.getKor() %></td>
		<td align="center"><%= resultDto.getEng() %></td>
		<td align="center"><%= resultDto.getMat() %></td>
		<td align="center"><%= resultDto.getSci() %></td>
		<td align="center"><%= resultDto.getHis() %></td>
	</tr>
	<tr style="background: lightgray;">
		<th>총점</th>
		<th>평균</th>
		<th colspan="3">등급</th>
	</tr>
	<tr>
		<td align="center"><%= resultDto.getTot() %></td>
		<td align="center"><%= resultDto.getAvg() %></td>
		<% if(resultDto.getAvg() >= 80) { %>
		<td colspan="3" align="center" style="background: lightblue; font-weight: bold; color: blue;"><%= resultDto.getGrade() %></td>
		<% } else { %>
		<td colspan="3" align="center" style="background: yellow; font-weight: bold; color: red;"><%= resultDto.getGrade() %></td>
		<% } %>
	</tr>

</table>

<div style="border: 0px solid blue; width: 50%; margin: 10px, 0px;" align="right">
|
<a href="#" onClick="move('list.jsp', '');">목록</a>
|
<a href="#" onClick="move('insert.jsp', '');">등록</a>
|
<a href="#" onClick="move('edit.jsp', '<%= sungjukNo %>');">수정</a>
|
<a href="#" onClick="move('delete.jsp', '<%= sungjukNo %>');">삭제</a>
|
</div>

</form>

<script>
function move(value1, value2) {
	location.href = value1 + '?sungjukNo=' + value2;
}
</script>
