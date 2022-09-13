<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="_inc_top.jsp" %>

<%
	SubBoardDTO arguDto = new SubBoardDTO();
	arguDto.setNo(no);
	arguDto.setTbl(tbl);
	
	SubBoardDAO dao = new SubBoardDAO();
	SubBoardDTO dto = dao.getSelectOne(arguDto);
	
	if(dto.getNo() <= 0) {
		return;
	}

%>

<h2><%= imsiBoardTitle %> 게시글 수정</h2>

<form name="DirForm">
<input type="hidden" name="no" value="<%= no %>">
<input type="hidden" name="tbl" value="<%= dto.getTbl() %>">
<input type="hidden" name="dbNoticeNo" value="<%= dto.getNoticeNo() %>">
<table border="1" width="50%">
	<tr>
		<th>작성자</th>
		<td><%= dto.getWriter() %></td>
	</tr>
	<tr>
		<th>이메일</th>
		<td><input type="text" name="email" value="<%= dto.getEmail() %>"></td>
	</tr>
	<tr>
		<th>비밀번호</th>
		<td><input type="password" name="passwd"></td>
	</tr>
	<tr>
		<th>제목</th>
		<td><input type="text" name="subject" value="<%= dto.getSubject() %>"></td>
	</tr>
	<tr>
		<th>내용</th>
		<td>
			<textarea name="content" style="width: 300px; height: 100px;"><%= dto.getContent() %></textarea>
		</td>
	</tr>
	<tr>
		<th>공지글</th>
		<td>
			<input type="radio" name="noticeGubun" value="T" <% if(dto.getNoticeNo() > 0) out.println("checked"); %>>공지글&nbsp;
			<input type="radio" name="noticeGubun" value="F" <% if(dto.getNoticeNo() <= 0) out.println("checked"); %>>공지글아님&nbsp;
		</td>
	</tr>
	<tr>
		<th>비밀글</th>
		<td>
			<input type="radio" name="secretGubun" value="T" <% if(dto.getSecretGubun().equals("T")) out.println("checked"); %>>비밀글&nbsp;
			<input type="radio" name="secretGubun" value="F" <% if(dto.getSecretGubun().equals("F")) out.println("checked"); %>>비밀글아님&nbsp;
		</td>
	</tr>
	<tr>
		<td colspan="2" align="center">
			<button type="button" onclick="edit();">등록하기</button>
			<button type="button" onclick="location.href='main.jsp?menuGubun=subBoard_list&tbl=<%= tbl %>';">목록으로</button>
		</td>
	</tr>
</table>
</form>

<script>
function edit() {
	if(confirm('수정하시겠습니까?')) {
		DirForm.action = "mainProc.jsp?menuGubun=subBoard_updateProc";
		DirForm.method = "post";
		DirForm.submit();
	}
}
</script>