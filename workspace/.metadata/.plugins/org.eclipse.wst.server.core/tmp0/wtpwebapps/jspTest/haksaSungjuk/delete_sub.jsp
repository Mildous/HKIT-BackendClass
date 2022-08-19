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

<h2>성적삭제</h2>
<form name="DirForm">
<input type="hidden" name="sungjukNo" id="sungjukNo" value="<%= resultDto.getSungjukNo() %>">
<table border="1" width="50%" align="center">
	<tr>		
		<th colspan="2">이름</th>
		<td colspan="3" align="center"><%= resultDto.getName() %></td>
	</tr>
	<tr>
		<th colspan="2">시험명</th>
		<td colspan="3" align="center"><%= resultDto.getSihumName() %></td>
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
	<tr>
		<td colspan="5" align="center">
			<button type="button" onClick="formSubmit();">삭제하기</button>
			<button type="button" onClick="location.href='list.jsp';">목록으로</button>
		</td>
	</tr>
</table>
</form>

<script>
function formSubmit() {
	if(confirm('정말 삭제하시겠습니까?')) {
		document.DirForm.action = "deleteProc.jsp";
		document.DirForm.method = "post";
		document.DirForm.submit();
	}
}
</script>
