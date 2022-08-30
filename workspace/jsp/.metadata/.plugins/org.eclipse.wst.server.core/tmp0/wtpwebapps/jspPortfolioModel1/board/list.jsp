<%@page import="config.BoardPage"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="_inc_top.jsp" %>

<%
	// 검색
	String searchField = request.getParameter("searchField");
	String searchWord = request.getParameter("searchWord");
	
	Util util = new Util();
	searchField = util.getNullBlankCheck(searchField, "");
	searchWord = util.getNullBlankCheck(searchWord, "");
	
	if(searchField == null || searchField.trim().equals("")) {
		searchField = "";
	}
	
	if(searchWord == null || searchWord.trim().equals("")) {
		searchWord = "";
	}
	
	dao = new BoardDAO();
	
	// ---------------- 페이징 처리 ----------------
	String pageNumber_ = request.getParameter("pageNumber");
	if(pageNumber_ == null || pageNumber_.trim().equals("")) {
		pageNumber_ = "1";
	}
	int pageNumber = Integer.parseInt(pageNumber_);
	
	int totalRecord = dao.getTotalRecord(searchField, searchWord);
	int pageSize = 10;	// 한 페이지에 나타낼 레코드 개수
	int blockSize = 5;	// 출력할 블럭의 개수
	
	int block = (pageNumber - 1) / pageSize;
	int jj = totalRecord - pageSize * (pageNumber - 1);	//단지 화면에 보여질 일련번호..
	
	double totalPageDou = Math.ceil(totalRecord / (double)pageSize);
	int totalPage = (int)totalPageDou;
	
	int startRecord = pageSize * (pageNumber - 1) + 1;
	int lastRecord = pageSize * pageNumber;
	
	ArrayList<BoardDTO> list = dao.getSelectAll(searchField, searchWord, startRecord, lastRecord);
	
%>

<h2>게시글 목록</h2>
<div style="padding: 0px 0px; width: 80%;" align="left">
<%	if(searchField.equals("") || searchWord.equals("")) { %>
	* 전체목록 (<%= totalRecord %>건)
<%	} else { %>
	* 검색어 "<%= searchWord %>"으/로 검색된 목록 (<%= totalRecord %>건)
<%	} %>
</div>
<table border="1" width="80%">
	<tr>
		<th>순번</th>
		<th>제목</th>
		<th>작성자</th>
		<th>작성일</th>
		<th>조회수</th>
		<th>ip</th>
		<th>공지글</th>
		<th>비밀글</th>
	</tr>
<% if(totalRecord == 0) { %>
	<tr>
		<td colspan="8" height="200px" align="center">등록된 게시글이 없습니다..</td>
	</tr>
<% } %>
<%
	for(int i=0; i<list.size(); i++) {
		BoardDTO indexDto = list.get(i);
%>
	<tr>
		<td>
		<%
			if(indexDto.getNoticeNo() >= 1) {
				out.println("공지");
			} else {
			 	out.println(indexDto.getNo());
			}
		%>
		</td>
		<td>
		<%	
			String blankValue = "";
			for(int j=2; j<=indexDto.getStepNo(); j++) {
				blankValue += "&nbsp;&nbsp;";
			}
			
			String imsiSubject = "";
			if(indexDto.getStepNo() >= 2) {
				blankValue += "[Re]";
			}
			imsiSubject += indexDto.getSubject();
			if(imsiSubject.length() > 10) {
				imsiSubject = imsiSubject.substring(0, 10) + "..";
			}
		%>
			<%= blankValue %><a href="#" onClick="move('board_view', '<%= indexDto.getNo() %>', '<%= searchField %>', '<%= searchWord %>');" style="padding-left: 5px;"><%= imsiSubject %></a>
		</td>
		<td><%= indexDto.getWriter() %></td>
		<td><%= indexDto.getRegiDate() %></td>
		<td><%= indexDto.getHit() %></td>

		<td><%= indexDto.getIp().substring(0, 7) %></td>
		<td><%= indexDto.getNoticeNo() %></td>
		<td><%= indexDto.getSecretGubun() %></td>
	</tr>
<%
	}
%>
	<tr>
		<td colspan="8" align="center" style="padding: 20px 0px;">
		<form name="searchForm" method="post" action="main.jsp?menuGubun=board_list">
			<select name="searchField">
				<option value="">-- 선택 --</option>
				<option value="subject" <% if(searchField.equals("subject")) { out.println("selected"); } %>>제목</option>
				<option value="writer" <% if(searchField.equals("writer")) { out.println("selected"); } %>>작성자</option>
				<option value="content" <% if(searchField.equals("content")) { out.println("selected"); } %>>내용</option>
				<option value="all" <% if(searchField.equals("all")) { out.println("selected"); } %>>전체</option>
			</select>
			<input type="text" name="searchWord" value="<%= searchWord %>">
			<button type="button" onClick="submit()">검색</button>
		</form> 
		</td>
	</tr>
</table>

<div style="padding-top: 20px; width: 80%;" align="center">

</div>

<div style="padding-top: 20px; width: 80%;" align="right">
	|
	<a href="#" onClick="move('board_list', '', '', '');">목록</a>
	|
	<a href="#" onClick="move('board_write', '', '', '');">등록</a>
	|
</div>

<script>
function move(value1, value2, searchField, searchWord) {
	var linkAddr = 'main.jsp?menuGubun=' + value1 + '&no=' + value2 + '&searchField=' + searchField + '&searchWord=' + searchWord;
	location.href = linkAddr;
}
</script>