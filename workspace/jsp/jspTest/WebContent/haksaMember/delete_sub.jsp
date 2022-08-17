<%@page import="haksaMember.model.dao.HaksaMemberDAO"%>
<%@page import="haksaMember.model.dto.HaksaMemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String hakbun_ = request.getParameter("hakbun");
	int hakbun = Integer.parseInt(hakbun_);
	
	HaksaMemberDTO arguDto = new HaksaMemberDTO();
	arguDto.setHakbun(hakbun);
	
	HaksaMemberDAO dao = new HaksaMemberDAO();
	HaksaMemberDTO resultDto = dao.getSelectOne(arguDto);
%>

<h2>정보삭제</h2>

<form name="DirForm">
<input type="hidden" name="hakbun" id="hakbun" value="<%= resultDto.getHakbun() %>">
<table border="1" width="80%" align="center">
	<tr>
		<th>이름</th>
		<td><%= resultDto.getName() %></td>
	</tr>
	<tr>
		<th>전화번호</th>
		<td><%= resultDto.getPhone() %></td>
	</tr>
	<tr>
		<th>부모님연락처</th>
		<td><%= resultDto.getParentPhone() %></td>
	</tr>
	<tr>
		<th>주소</th>
		<td>(<%= resultDto.getAddr1() %>) <%= resultDto.getAddr2() %> <%= resultDto.getAddr3() %> <%= resultDto.getAddr4() %></td>
	</tr>
	<tr>
		<td colspan="2" align="center">
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