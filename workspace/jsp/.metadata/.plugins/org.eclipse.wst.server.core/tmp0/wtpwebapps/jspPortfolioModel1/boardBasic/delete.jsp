<%@page import="boardBasic.model.dao.BoardBasicDAO"%>
<%@page import="boardBasic.model.dto.BoardBasicDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="_inc_top.jsp" %>

<%
	String no_ = request.getParameter("no");
	int no = Integer.parseInt(no_);
	
	BoardBasicDTO arguDto = new BoardBasicDTO();
	arguDto.setNo(no);
	
	BoardBasicDAO dao = new BoardBasicDAO();
	BoardBasicDTO dto = dao.getSelectOne(arguDto);
	
	if(dto.getNo() <= 0) {
		out.println("<script>alert('존재하지 않는 게시글입니다.'); location.href='main.jsp?menuGubun=boardBasic_list';</script>");
		return;
	}
%>

<h2>게시글 삭제</h2>
<form name="deleteForm">
<input type="hidden" name="no" value="<%= dto.getNo() %>">
<table border="1" align="center">
	<tr>
		<td>제목</td>
		<td><%= dto.getSubject() %></td>
	</tr>
	<tr>
		<td>작성자</td>
		<td><%= dto.getWriter() %></td>
	</tr>
	<tr>
		<td>내용</td>
		<td><textarea name="content" style="width: 300px; height: 200px;" readonly><%= dto.getContent() %></textarea></td>
	</tr>
	<tr>
		<td>이메일</td>
		<td><%= dto.getEmail() %></td>
	</tr>
	<tr>
		<td>비밀번호</td>
		<td><input type="password" name="passwd"></td>
	</tr>
	<tr>
		<td colspan="2" align="center">
			<button type="button" onClick="drop();">삭제하기</button>
			<button type="button" onClick="location.href='main.jsp?menuGubun=boardBasic_list';">목록으로</button>
		</td>
	</tr>
</table>
</form>

<script>
function drop() {
	if(confirm('삭제할까요?')) {
		document.deleteForm.action = "mainProc.jsp?menuGubun=boardBasic_deleteProc";
		document.deleteForm.method = "post";
		document.deleteForm.submit();
	}
}
</script>