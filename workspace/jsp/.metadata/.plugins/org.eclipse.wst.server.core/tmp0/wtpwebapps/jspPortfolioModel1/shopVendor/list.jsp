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
	
	dao = new VendorDAO();
	
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
	
	ArrayList<VendorDTO> list = dao.getSelectAll(searchField, searchWord, startRecord, lastRecord);
	
%>

<h2>제조사 목록</h2>
<div style="padding: 0px 0px; width: 50%;" align="left">
<%	if(searchField.equals("") || searchWord.equals("")) { %>
	* 전체목록 (<%= totalRecord %>건)
<%	} else { %>
	* 검색어 "<%= searchWord %>"으/로 검색된 목록 (<%= totalRecord %>건)
<%	} %>
</div>
<table border="1" width="50%">
	<tr>
		<th>순번</th>
		<th>제조사명</th>
		<th>등록일</th>
		<th>비고</th>
	</tr>
<% if(totalRecord == 0) { %>
	<tr>
		<td colspan="8" height="150px" align="center">등록된 제조사가 없습니다..</td>
	</tr>
<% } %>
<%
	for(int i=0; i<list.size(); i++) {
		VendorDTO indexDto = list.get(i);
%>
	<tr>
		<td align="center"><%= totalRecord %></td>
		<td><%= indexDto.getVendorName() %></td>
		<td align="center"><%= indexDto.getRegiDate() %></td>
		<td align="center">
			<a href="#" onClick="move('shopVendor_edit', '<%= indexDto.getVendorCode() %>', '', '');">[수정]</a>
			&nbsp;
			<a href="#" onClick="move('shopVendor_drop', '<%= indexDto.getVendorCode() %>', '', '');">[삭제]</a>
		</td>
	</tr>
<%
		totalRecord--;
	}
%>
	<tr>
		<td colspan="8" align="center" style="padding: 20px 0px;">
		<form name="searchForm" method="post" action="main.jsp?menuGubun=shopVendor_list">
			<select name="searchField">
				<option value="">-- 선택 --</option>
				<option value="vendorName" <% if(searchField.equals("vendorName")) { out.println("selected"); } %>>제조사명</option>
			</select>
			<input type="text" name="searchWord" value="<%= searchWord %>">
			<button type="button" onClick="submit()">검색</button>
		</form> 
		</td>
	</tr>
</table>

<div style="padding-top: 20px; width: 50%;" align="center">
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

<div style="padding-top: 20px; width: 50%;" align="right">
	|
	<a href="#" onClick="move('shopVendor_list', '', '', '');">목록</a>
	|
	<a href="#" onClick="move('shopVendor_regi', '', '', '');">등록</a>
	|
</div>

<script>
function move(value1, value2, searchField, searchWord) {
	var linkAddr = 'main.jsp?menuGubun=' + value1 + '&vendorCode=' + value2 + '&searchField=' + searchField + '&searchWord=' + searchWord;
	location.href = linkAddr;
}
function goPage(value1, value2, value3, value4) {
	location.href='main.jsp?menuGubun=' + value1 + '&pageNumber=' + value2 + '&searchField=' + value3 + '&searchWord=' + value4 ;
}
</script>