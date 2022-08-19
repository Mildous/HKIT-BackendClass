<%@page import="haksaSihum.model.dto.HaksaSihumDTO"%>
<%@page import="haksaSihum.model.dao.HaksaSihumDAO"%>
<%@page import="haksaMember.model.dto.HaksaMemberDTO"%>
<%@page import="haksaMember.model.dao.HaksaMemberDAO"%>
<%@page import="haksaSungjuk.model.dto.HaksaSungjukDTO"%>
<%@page import="haksaSungjuk.model.dao.HaksaSungjukDAO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<h2>성적등록</h2>

<form name="DirForm">
<table border="1" width="50%" align="center">
	<tr>		
		<th>이름</th>
		<td>
			<%
				HaksaMemberDAO memberDao = new HaksaMemberDAO();
				ArrayList<HaksaMemberDTO> mList = memberDao.getSelectAll();
			%>
			<select name="hakbun">
				<option value="" selected>-- 선택하세요 --</option>
				<%
					for(int i=0; i<mList.size(); i++) {
						HaksaMemberDTO dto = mList.get(i);
						
						String selectedValue = "";
						if(dto.getHakbun() == 0) {
							selectedValue = "selected";
						}
				%>
				<option value="<%= dto.getHakbun() %>"><%= dto.getName() %></option>
				<%
					}
				%>
			</select>
		</td>
	</tr>
	<tr>
		<th>시험명</th>
		<td>
			<%
				HaksaSihumDAO sihumDao = new HaksaSihumDAO();
				ArrayList<HaksaSihumDTO> sList = sihumDao.getSelectAll();
			%>
			<select name="sihumNo">
				<option value="" selected>-- 선택하세요 --</option>
				<%
					for(int i=0; i<sList.size(); i++) {
						HaksaSihumDTO dto = sList.get(i);
						
						String selectedValue = "";
						if(dto.getSihumNo() == 0) {
							selectedValue = "selected";
						}
				%>
				<option value="<%= dto.getSihumNo() %>"><%= dto.getSihumName() %></option>
				<%
					}
				%>
			</select>
		</td>
	</tr>
	<tr>
		<th>국어점수</th>
		<td><input type="text" name="kor" id="kor"></td>
	</tr>
	<tr>
		<th>영어점수</th>
		<td><input type="text" name="eng" id="eng"></td>
	</tr>
	<tr>
		<th>수학점수</th>
		<td><input type="text" name="mat" id="mat"></td>
	</tr>
	<tr>
		<th>과학점수</th>
		<td><input type="text" name="sci" id="sci"></td>
	</tr>
	<tr>
		<th>역사점수</th>
		<td><input type="text" name="his" id="his"></td>
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
	if(confirm('저장하시겠습니까?')) {
		document.DirForm.action = "insertProc.jsp";
		document.DirForm.method = "post";
		document.DirForm.submit();
	}
}
</script>
