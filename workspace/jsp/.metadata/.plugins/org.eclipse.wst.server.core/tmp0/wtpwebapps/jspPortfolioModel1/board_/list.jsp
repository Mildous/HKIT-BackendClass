<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="_inc_top.jsp" %>

<%
//검색
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
	int blockSize = 10;	// 출력할 블럭의 개수
	
	int block = (pageNumber - 1) / pageSize;
	int jj = totalRecord - pageSize * (pageNumber - 1);	//단지 화면에 보여질 일련번호..
	
	double totalPageDou = Math.ceil(totalRecord / (double)pageSize);
	int totalPage = (int)totalPageDou;
	
	int startRecord = pageSize * (pageNumber - 1) + 1;
	int lastRecord = pageSize * pageNumber;
	
	ArrayList<BoardDTO> list = dao.getSelectAll(searchField, searchWord, startRecord, lastRecord);
%>

<style>
@import url("https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0");
</style>

<h2>게시글 목록</h2>

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
<% if(totalRecord == 0) { %>
	<tr>
		<td colspan="13" height="200px" align="center">등록된 게시글이 없습니다..</td>
	</tr>
<% } %>
<%
	for(int i=0; i<list.size(); i++) {
		BoardDTO listDto = list.get(i);
%>
	<tr>
		<td><%= listDto.getNo() %></td>
		<td>
		<%	
			String blankValue = "";
			for(int j=2; j<=listDto.getStepNo(); j++) {
				blankValue += "&nbsp;&nbsp;";
			}
			
			String imsiSubject = "";
			if(listDto.getStepNo() >= 2) {
				blankValue += "<span class='material-symbols-outlined'>subdirectory_arrow_right</span>";
			}
			imsiSubject += listDto.getSubject();
			if(imsiSubject.length() > 20) {
				imsiSubject = imsiSubject.substring(0, 15) + "..";
			}
		%>
			<%= blankValue %><a href="#" onClick="move('board_view', '<%= listDto.getNo() %>');" style="padding-left: 5px;"><%= imsiSubject %></a>
		</td>
		<td><%= listDto.getWriter() %></td>
		<td><%= listDto.getRegiDate() %></td>
		<td><%= listDto.getHit() %></td>
		
		<td><%= listDto.getRefNo() %></td>
		<td><%= listDto.getStepNo() %></td>
		<td><%= listDto.getLevelNo() %></td>
		<td><%= listDto.getParentNo() %></td>
		
		<td><%= listDto.getMemberNo() %></td>
		<td><%= listDto.getIp() %></td>
		<td><%= listDto.getNoticeNo() %></td>
		<td><%= listDto.getSecretGubun() %></td>
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
<%
	int totalBlock = totalPage / blockSize;
	double value1 = (double)totalBlock;
	double value2 = totalPage / blockSize;
	if(value1 - value2 == 0) {
		totalBlock = totalBlock - 1;
	}
%>
<a href="#" onClick="goPage('<%= menuGubun %>', '1', '<%= searchField %>', '<%= searchWord %>');">[첫페이지]</a>
&nbsp;&nbsp;
<%	if(block > 0) { 
		int imsiPage = (block-1) * blockSize + 10;
%>
	<a href="#" onClick="goPage('<%= menuGubun %>', '<%= imsiPage %>', '<%= searchField %>', '<%= searchWord %>');">[이전10개]</a>
<%	} else { %>
	[이전10개]
<%	} %>
&nbsp;&nbsp;
<%
	for(int goPage=1; goPage<=blockSize; goPage++) {
		int imsiValue = block * blockSize + goPage;
		if(totalPage - imsiValue >= 0) {
			if(imsiValue == pageNumber) {
%>
				<%= imsiValue %>
<%			} else { %>
				<a href="#" onClick="goPage('<%= menuGubun %>', '<%= imsiValue %>', '<%= searchField %>', '<%= searchWord %>');"><%= imsiValue %></a>
<%
			}
			out.println("&nbsp;");
		}
	}
	if(block-totalBlock <= 0) {
		int yyy = (block + 1) * blockSize + 1;
		//int zzz = block + 1;
%>
		<a href="#" onClick="goPage('<%= menuGubun %>', '<%= yyy %>', '<%= searchField %>', '<%= searchWord %>');">[다음10개]</a>
<%	} else { %>
		[다음10개]
<%	} %>
&nbsp;
<a href="#" onClick="goPage('<%= menuGubun %>', '<%= totalPage %>', '<%= searchField %>', '<%= searchWord %>');">[끝페이지]</a>

</div>

<div style="padding-top: 20px; width: 80%;" align="right">
	|
	<a href="#" onClick="move('board__list', '', '', '');">목록</a>
	|
	<a href="#" onClick="move('board__write', '', '', '');">등록</a>
	|
</div>

<script>
function move(value1, value2, searchField, searchWord) {
	var linkAddr = 'main.jsp?menuGubun=' + value1 + '&no=' + value2 + '&searchField=' + searchField + '&searchWord=' + searchWord;
	location.href = linkAddr;
}
function goPage(value1, value2, value3, value4) {
	location.href='main.jsp?menuGubun=' + value1 + '&pageNumber=' + value2 + '&searchField=' + value3 + '&searchWord=' + value4 ;
}
</script>