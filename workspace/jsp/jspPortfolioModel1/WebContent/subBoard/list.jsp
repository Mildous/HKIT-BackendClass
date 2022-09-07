<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="_inc_top.jsp" %>

<%
	SubBoardDTO arguDto = new SubBoardDTO();
	arguDto.setField(field);
	arguDto.setWord(word);
	
	SubBoardDAO subBoardDao = new SubBoardDAO();
	ArrayList<SubBoardDTO> list = subBoardDao.getSelectAll(arguDto);
%>

<h2>게시글 목록</h2>

<div style="padding: 10px 0px 10px 0px; width: 80%" align="left">
	<form name="searchForm">
		<select name="field">
			<option value="">-- 선택 --</option>
			<option value="writer" <% if(field.equals("writer")) { out.println("selected"); } %>>작성자</option>
			<option value="subject" <% if(field.equals("subject")) { out.println("selected"); } %>>제목</option>
			<option value="content" <% if(field.equals("content")) { out.println("selected"); } %>>내용</option>
			<option value="writer_subject_content" <% if(field.equals("writer_subject_content")) { out.println("selected"); } %>>작성자+제목+내용</option>
		</select>&nbsp;
		<input type="text" name="word" value="<%= word %>">&nbsp;
		<button type="button" onclick="search();">검색</button>
	</form>
	<script>
		function search() {
			searchForm.action = "mainProc.jsp?menuGubun=subBoard_listSearch";
			searchForm.method = "post";
			searchForm.submit();
		}
	</script>
</div>


<table border="1" width="80%">
	<tr>
		<th>순번</th>
		<th>제목</th>
		<th>작성자</th>
		<th>작성일</th>
		<th>조회수</th>
		
		<th>refNo</th>
		<th>stepNo</th>
		<th>levelNo</th>
		<th>parentNo</th>
		
		<th>memberNo</th>
		<th>ip</th>
		<th>공지글</th>
		<th>비밀글</th>
	</tr>
<%
	if(list.isEmpty()) {
%>
	<tr>
		<td colspan="13" height="200px" align="center">
			등록된 게시물이 없습니다..
		</td>
	</tr>
<%
	}

	for(SubBoardDTO dto : list) {
%>
	<tr>
		<td><%= dto.getNum() %></td>
	<%
		String blankValue = "";
		for(int k=2; k<=dto.getStepNo(); k++) {
			blankValue += "&nbsp;&nbsp;&nbsp;&nbsp;[Re] ";
		}
		String imsiSubject = dto.getSubject();
		if(imsiSubject.length() > 10) {
			imsiSubject = imsiSubject.substring(0, 10) + "...";
		}
	%>
		<td><%= blankValue %><a href="#" onclick="move('subBoard_view', '<%= dto.getNo() %>');" ><%= imsiSubject %></a></td>
		<td><%= dto.getWriter() %></td>
		<td><%= dto.getRegiDate() %></td>
		<td><%= dto.getHit() %></td>
		
		<td><%= dto.getRefNo() %></td>
		<td><%= dto.getStepNo() %></td>
		<td><%= dto.getLevelNo() %></td>
		<td><%= dto.getParentNo() %></td>
		
		<td><%= dto.getMemberNo() %></td>
		<td><%= dto.getIp() %></td>
		<td><%= dto.getNoticeNo() %></td>
		<td><%= dto.getSecretGubun() %></td>
	</tr>	
<%
	}
%>
</table>

<div style="padding-top: 20px; width: 80%;" align="right">
	|
	<a href="#" onclick="move('subBoard_list', '');">목록</a>
	|
	<a href="#" onclick="move('subBoard_insert', '');">등록</a>
</div>

<script>
function move(value1, value2) {
	location.href='main.jsp?menuGubun=' + value1 + '&no=' + value2 + '&field=<%= field %>&word=<%= word %>';
}
</script>