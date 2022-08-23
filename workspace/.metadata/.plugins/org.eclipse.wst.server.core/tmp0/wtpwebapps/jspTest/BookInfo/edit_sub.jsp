<%@page import="bookProfile.model.dto.BookProfileDTO"%>
<%@page import="bookProfile.model.dao.BookProfileDAO"%>
<%@page import="bookAuthor.model.dto.BookAuthorDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="bookAuthor.model.dao.BookAuthorDAO"%>
<%@page import="bookInfo.model.dao.BookInfoDAO"%>
<%@page import="bookInfo.model.dto.BookInfoDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String infoNo_ = request.getParameter("infoNo");
	int infoNo = Integer.parseInt(infoNo_);
	
	BookInfoDTO arguDto = new BookInfoDTO();
	arguDto.setInfoNo(infoNo);
	
	BookInfoDAO dao = new BookInfoDAO();
	BookInfoDTO resultDto = dao.getSelectOne(arguDto);
%>
<h2>도서수정</h2>

<form name="DirForm">
<input type="hidden" name="infoNo" id="infoNo" value="<%= resultDto.getInfoNo() %>">
<table border="1" width="40%" align="center">
	<tr>
		<th>도서명</th>
		<td><input type="text" name="subject" id="subject" value="<%= resultDto.getSubject() %>"></td>
	</tr>
	<tr>
		<th>저자</th>
		<td>
		<%
				BookAuthorDAO authorDao = new BookAuthorDAO();
				ArrayList<BookAuthorDTO> aList = authorDao.getSelectAll();
		%>
		<select name="authorNo">
			<option value="<%= resultDto.getAuthorNo() %>" selected><%= resultDto.getAuthor() %></option>
			<%
					for(int i=0; i<aList.size(); i++) {
						BookAuthorDTO dto = aList.get(i);
						
						String selectedValue = "";
						if(dto.getAuthorNo() == 0) {
							selectedValue = "selected";
						}
			%>
			<option value="<%= dto.getAuthorNo() %>"><%= dto.getAuthor() %></option>
			<%
				}
			%>
		</select>
		</td>
	</tr>
	<tr>
		<th>출판일</th>
		<td><input type="date" name="created" id="created" value="<%= resultDto.getCreated() %>"></td>
	</tr>
	<tr>
		<th>분류</th>
		<td>
		<%
			BookProfileDAO profileDao = new BookProfileDAO();
			ArrayList<BookProfileDTO> pList = profileDao.getSelectAll();
		%>
		<select name="profileNo">
			<option value="<%= resultDto.getProfileNo() %>" selected><%= resultDto.getProfile() %></option>
			<%
				for(int i=0; i<pList.size(); i++) {
					BookProfileDTO dto = pList.get(i);
			%>
			<option value="<%= dto.getProfileNo() %>"><%= dto.getProfile() %></option>
			<%
				}
			%>
		</select>
		</td>
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