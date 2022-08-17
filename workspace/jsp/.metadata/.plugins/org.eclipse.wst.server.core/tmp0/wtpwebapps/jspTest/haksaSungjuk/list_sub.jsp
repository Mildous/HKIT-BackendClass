<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="haksaSungjuk.model.dto.HaksaSungjukDTO"%>
<%@page import="haksaSungjuk.model.dao.HaksaSungjukDAO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Map<String, Object> param = new HashMap<String, Object>();
	
	String searchField = request.getParameter("searchField");
	String searchWord = request.getParameter("searchWord");
	if(searchWord != null) {
		param.put("searchField", searchField);
		param.put("searchWord", searchWord);
	}
	HaksaSungjukDAO dao = new HaksaSungjukDAO();
	ArrayList<HaksaSungjukDTO> list = dao.getSelectAll(param);
	
	int totalRecord = list.size();
%>

<h2>성적목록</h2>
<!-- 검색 폼 -->
<form method="get">
<table border="1" width="80%">
	<tr>
		<td align="center">
			<select name="searchField">
				<option value="name">이름</option>
				<option value="sihumName">시험명</option>
			</select>
			<input type="text" name="searchWord" />
			<input type="submit" value="검색하기" />
		</td>
	</tr>
</table>
</form>

<table border="1" width="80%" align="center">
	<tr>
		<th>순번</th>
		<th>이름</th>
		<th>시험명</th>
		<th>총점</th>
		<th>평균</th>
		<th>등급</th>
		<th>등록일</th>
	</tr>
	<% if(totalRecord == 0) { %>
	<tr>
		<td colspan="7" height="200px" align="center">등록된 내용이 없습니다..</td>
	</tr>
	<% } %>
	<% 
	int num = totalRecord;
	for(int i=0; i<list.size(); i++) { 
		HaksaSungjukDTO dto = list.get(i);
	%>
	<tr>
		<td><%= num %></td>
		<td><a href="#" onClick="move('view.jsp', '<%= dto.getSungjukNo() %>');"><%= dto.getName() %></a></td>
		<td><%= dto.getSihumName() %></td>
		<td><%= dto.getTot() %></td>
		<td><%= dto.getAvg() %></td>
		<td><%= dto.getGrade() %></td>
		<td><%= dto.getRegiDate() %></td>
	</tr>
	<%
			num--;
		}
	%>
</table>
<div style="width: 80%; margin: 10px, 0;" align="right">
	|
	<a href="#" onClick="location.href='list.jsp';">목록</a>
	|
	<a href="#" onClick="location.href='insert.jsp';">등록</a>
	|
</div>

<script>
function move(value1, value2) {
	location.href = value1 + '?sungjukNo=' + value2;
}
</script>
