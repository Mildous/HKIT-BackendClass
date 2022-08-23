<%@page import="memo.model.dao.MemoDAO"%>
<%@page import="memo.model.dto.MemoDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String no_ = request.getParameter("no");
	int no = Integer.parseInt(no_);
	
	MemoDTO arguDto = new MemoDTO();
	MemoDAO dao = new MemoDAO();
	
	arguDto.setNo(no);
	MemoDTO dto = dao.getSelectOne(arguDto);
	
	if(dto.getNo() <= 0) {
		out.println("<script>alert('존재하지 않는 메모입니다.'); location.href='main.jsp?menuGubun=memo_list';</script>");
		return;
	}
%>

<h2>메모삭제</h2>
<form name="deleteForm">
<input type="hidden" name="no" value="<%= dto.getNo() %>">
<table border="1" align="center" width="50%">
	<tr>
		<th>작성자</th>
		<td><%= dto.getWriter() %></td>
	</tr>
	<tr>
		<th>내용</th>
		<td><%= dto.getContent() %></td>
	</tr>
	<tr>
		<td colspan="2" align="center">
			<button type="button" onClick="drop();">삭제하기</button>
			<button type="button" onClick="location.href='main.jsp?menuGubun=memo_list';">목록으로</button>
		</td>
	</tr>
</table>
</form>

<script>
function drop() {
	if(confirm('삭제할까요?')) {
		document.deleteForm.action = "mainProc.jsp?menuGubun=memo_deleteProc";
		document.deleteForm.method = "post";
		document.deleteForm.submit();
	}
}
</script>