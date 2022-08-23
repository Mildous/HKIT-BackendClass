<%@page import="config.Util"%>
<%@page import="guestbook.model.dto.GuestBookDTO"%>
<%@page import="guestbook.model.dao.GuestBookDAO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String searchGubun = request.getParameter("searchGubun");
	String searchData = request.getParameter("searchData");
	
	Util util = new Util();
	
	searchGubun = util.getNullBlankCheck(searchGubun, "");
	searchData = util.getNullBlankCheck(searchData, "");
	
	if(searchGubun.equals("") || searchData.equals("")) {
		searchGubun = "";
		searchData = "";
	}
	
    GuestBookDAO dao = new GuestBookDAO();
	ArrayList<GuestBookDTO> list = dao.getSelectAll(searchGubun, searchData);
	int totalCount = list.size();
%>

<h2>방명록</h2>
<div style="border: 0px solid red; padding: 0px 0px; width: 80%;" align="left">
<%	if(searchGubun.equals("") || searchData.equals("")) { %>
		*전체목록 (<%= list.size() %>건)
<%	} else { %>
		*검색어 "<%= searchData %>"으/로 검색된 목록 (<%= list.size() %>건)
<%	} %>
</div>
<table border="1" width="80%">
	
	<tr>
		<th>순번</th>
		<th>내용</th>
		<th>이름</th>
		<th>이메일</th>
		<th>등록일</th>
		<th>실작성자</th>
	</tr>
	<%
		if(totalCount == 0) {
	%>
	<tr>
		<td colspan="5" height="200px" align="center">등록된 내용이 없습니다..</td>
	</tr>
	<%	} %>
	<%
		int num = totalCount;
		for(int i=0; i<list.size(); i++) {
			//GuestBookDTO dto = list.get(i);
	%>
	<tr>
		<td><%= num %></td>
		<td><a href="#" onClick="move('guestBook_view', '<%= list.get(i).getNo() %>');"><%= list.get(i).getContent() %></a></td>
		<td><%= list.get(i).getName() %></td>
		<td><%= list.get(i).getEmail() %></td>
		<td><%= list.get(i).getRegiDate() %></td>
		<td><%= list.get(i).getMemberNo() %></td>
	</tr>
	<%		
			num--;
		}
	%>
	
	<tr>
		<td colspan="6" align="center" style="padding: 20px 0px;">
			<form name="searchForm">
			<select name="searchGubun">
				<option value="" <% if(searchGubun.equals("")) { out.println("selected"); } %>>-- 선택 --</option>
				<option value="name" <% if(searchGubun.equals("name")) { out.println("selected"); } %>>이름</option>
				<option value="content" <% if(searchGubun.equals("content")) { out.println("selected"); } %>>내용</option>
				<option value="name_content" <% if(searchGubun.equals("name_content")) { out.println("selected"); } %>>이름+내용</option>
			</select>
			&nbsp;
			<input type="text" name="searchData" value="<%= searchData %>">
			&nbsp;
			<button type="button" onClick="search();">검색하기</button>
			</form>
		</td>
	</tr>
</table>

<div style="padding-top: 20px; width: 80%; " align="right">
	|
	<a href="#" onClick="move('guestBook_list', '');">목록</a>
	|
	<a href="#" onClick="move('guestBook_insert', '');">등록</a>
	|
</div>   

<script>
function move(value1, value2) {
	location.href='main.jsp?menuGubun=' + value1 + '&no=' + value2;
}

function search() {
	document.searchForm.action = "mainProc.jsp?menuGubun=guestBook_listSearch";
	document.searchForm.method = "post";
	document.searchForm.submit();
}
</script>