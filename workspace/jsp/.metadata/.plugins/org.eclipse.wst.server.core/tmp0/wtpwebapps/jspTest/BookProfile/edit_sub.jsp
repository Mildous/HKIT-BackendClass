<%@page import="bookProfile.model.dao.BookProfileDAO"%>
<%@page import="bookProfile.model.dto.BookProfileDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String profileNo_ = request.getParameter("profileNo");
	int profileNo = Integer.parseInt(profileNo_);
	
	BookProfileDTO arguDto = new BookProfileDTO();
	arguDto.setProfileNo(profileNo);
	
	BookProfileDAO dao = new BookProfileDAO();
	BookProfileDTO resultDto = dao.getSelectOne(arguDto);
%>
<h2>분류수정</h2>

<form name="DirForm">
<input type="hidden" name="profileNo" id="profileNo" value="<%= profileNo %>">
<table border="1" width="40%" align="center">
	<tr>
		<th>분류명</th>
		<td><input type="text" name="profile" id="profile" value="<%= resultDto.getProfile() %>"></td>
	</tr>
	<tr>
		<td colspan="2" align="center">
			<button type="button" onClick="formSubmit();">저장하기</button>
			<button type="button" onClick="location.href='list.jsp';">목록으로</button>
		</td>
	</tr>
</table>
</form>

<script>
function formSubmit() {
	if(confirm('저장할까요?')) {
		document.DirForm.action = "editProc.jsp";
		document.DirForm.method = "post";
		document.DirForm.submit();
	}
}
</script>