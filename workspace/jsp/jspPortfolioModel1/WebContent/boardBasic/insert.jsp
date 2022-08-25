<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="_inc_top.jsp" %>

<%	
	String no_ = request.getParameter("no");
	int no = 0;
	if(no_ == null || no_.equals("")) {
		no_ = "0";
%>
		<h2>게시글 등록</h2>
<%	} else if(no_ != null || !no_.equals("")) { 
		no = Integer.parseInt(no_);
%>
		<h2>답글 등록</h2>
<%	} %>

<form name="insertForm">
<input type="hidden" name="no" value="<%= no %>">
<table border="1" align="center">
	<tr>
		<td>작성자</td>
		<td><input type="text" name="writer" value="<%= sessionName %>"></td>
	</tr>
	<tr>
		<td>이메일</td>
		<td><input type="text" name="email" value="<%= sessionEmail %>"></td>
	</tr>
	<tr>
		<td>제목</td>
		<td><input type="text" name="subject"></td>
	</tr>
	<tr>
		<td>내용</td>
		<td>
			<textarea name="content" style="width: 300px; height: 200px;"></textarea>
		</td>
	</tr>
	<tr>
		<td>비밀번호</td>
		<td><input type="password" name="passwd"></td>
	</tr>
	<tr>
		<td colspan="2" align="center">
			<button type="button" onClick="save();">등록하기</button>
			<button type="button" onClick="location.href='main.jsp?menuGubun=boardBasic_list';">목록으로</button>
		</td>
	</tr>
</table>
</form>

<script>
function save() {
	if(confirm('등록할까요?')) {
		document.insertForm.action = "mainProc.jsp?menuGubun=boardBasic_insertProc";
		document.insertForm.method = "post";
		document.insertForm.submit();
	}
}
</script>