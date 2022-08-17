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

<h2>성적수정</h2>
<form name="DirForm">
<input type="hidden" name="sungjukNo" id="sungjukNo" value="<%= resultDto.getSungjukNo() %>">
<table border="1" width="50%" align="center">
	<tr>		
		<th>이름</th>
		<td><%= resultDto.getName() %></td>
	</tr>
	<tr>
		<th>시험명</th>
		<td><%= resultDto.getSihumName() %></td>
	</tr>
	<tr>
		<th>국어점수</th>
		<td><input type="text" name="kor" id="kor" value="<%= resultDto.getKor() %>"></td>
	</tr>
	<tr>
		<th>영어점수</th>
		<td><input type="text" name="eng" id="eng" value="<%= resultDto.getEng() %>"></td>
	</tr>
	<tr>
		<th>수학점수</th>
		<td><input type="text" name="mat" id="mat" value="<%= resultDto.getMat() %>"></td>
	</tr>
	<tr>
		<th>과학점수</th>
		<td><input type="text" name="sci" id="sci" value="<%= resultDto.getSci() %>"></td>
	</tr>
	<tr>
		<th>역사점수</th>
		<td><input type="text" name="his" id="his" value="<%= resultDto.getHis() %>"></td>
	</tr>
	<tr>
		<td colspan="2" align="center">
			<button type="button" onClick="formSubmit();">수정하기</button>
			<button type="button" onClick="location.href='list.jsp';">목록으로</button>
		</td>
	</tr>
</table>
</form>

<script>
function formSubmit() {
	if(confirm('수정하시겠습니까?')) {
		document.DirForm.action = "editProc.jsp";
		document.DirForm.method = "post";
		document.DirForm.submit();
	}
}
</script>
