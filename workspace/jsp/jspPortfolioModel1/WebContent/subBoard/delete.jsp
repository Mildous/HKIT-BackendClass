<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="_inc_top.jsp" %>

<%
	SubBoardDTO arguDto = new SubBoardDTO();
	arguDto.setNo(no);
	
	SubBoardDAO dao = new SubBoardDAO();
	SubBoardDTO dto = dao.getSelectOne(arguDto);
	
	if(dto.getNo() <= 0) {
		return;
	}
%>

<h2>게시글 삭제</h2>

<form name="DirForm">
<input type="hidden" name="no" value="<%= no %>">
<table border="1" width="50%">
	<tr>
		<th>작성자</th>
		<td><%= dto.getWriter() %></td>
	</tr>
	<tr>
		<th>이메일</th>
		<td><%= dto.getEmail() %></td>
	</tr>
	<tr>
		<th>비밀번호</th>
		<td><input type="password" name="passwd"></td>
	</tr>
	<tr>
		<th>제목</th>
		<td><%= dto.getSubject() %></td>
	</tr>
	<tr>
		<th>내용</th>
		<td>
			<%= dto.getContent().replace("\r\n", "<br>") %>
		</td>
	</tr>
	<tr>
		<th>공지글</th>
		<td>
			<input type="radio" name="noticeGubun" value="T" <% if(dto.getNoticeNo() > 0) out.println("checked"); %> readonly>공지글&nbsp;
			<input type="radio" name="noticeGubun" value="F" <% if(dto.getNoticeNo() <= 0) out.println("checked"); %> readonly>공지글아님&nbsp;
		</td>
	</tr>
	<tr>
		<th>비밀글</th>
		<td>
			<input type="radio" name="secretGubun" value="T" <% if(dto.getSecretGubun().equals("T")) out.println("checked"); %> readonly>비밀글&nbsp;
			<input type="radio" name="secretGubun" value="F" <% if(dto.getSecretGubun().equals("F")) out.println("checked"); %> readonly>비밀글아님&nbsp;
		</td>
	</tr>
	<tr>
		<td colspan="2" align="center">
			<button type="button" onclick="drop();">삭제하기</button>
			<button type="button" onclick="location.href='main.jsp?menuGubun=subBoard_list';">목록으로</button>
		</td>
	</tr>
</table>
</form>

<script>
function drop() {
	if(confirm('삭제하시겠습니까?')) {
		DirForm.action = "mainProc.jsp?menuGubun=subBoard_deleteProc";
		DirForm.method = "post";
		DirForm.submit();
	}
}
</script>