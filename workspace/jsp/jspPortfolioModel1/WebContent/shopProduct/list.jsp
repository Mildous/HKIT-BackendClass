<%@page import="config.Pagenation"%>
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
	
	dao = new ProductDAO();
	
	// ---------------- 페이징 처리 ----------------
	String pageNum_ = request.getParameter("pageNum");
	if(pageNum_ == null || pageNum_.trim().equals("")) {
		pageNum_ = "1";
	}
	int pageNum = Integer.parseInt(pageNum_);
	
	int totalRecord = dao.getTotalRecord(searchField, searchWord);
	int pageSize = 10;	// 한 페이지에 나타낼 레코드 개수
	int blockSize = 5;	// 출력할 블럭의 개수
	
	int block = (pageNum - 1) / pageSize;
	int jj = totalRecord - pageSize * (pageNum - 1);	//단지 화면에 보여질 일련번호..
	
	double totalPageDou = Math.ceil(totalRecord / (double)pageSize);
	int totalPage = (int)totalPageDou;
	
	int startRecord = pageSize * (pageNum - 1) + 1;
	int lastRecord = pageSize * pageNum;
	
	ArrayList<ProductDTO> list = dao.getSelectAll(searchField, searchWord, startRecord, lastRecord);
	String urlStr = "main.jsp?menuGubun=shopProduct_list";
%>

<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20,400,0,-25" />

<h2>상품목록</h2>
<div style="padding: 5px 0px; width: 60%;" align="left">
<%	if(searchField.equals("") || searchWord.equals("")) { %>
	* 전체목록 (<%= totalRecord %>건)
<%	} else { %>
	* 검색어 "<%= searchWord %>"으/로 검색된 목록 (<%= totalRecord %>건)
<%	} %>
</div>
<table border="1" width="60%">
	<tr height="30px">
		<th width="50px">순번</th>
		<th width="50px">제조사</th>
		<th>상품명</th>
		<th width="100px">가격</th>
		<th width="120px">등록일</th>
	</tr>
<% if(totalRecord == 0) { %>
	<tr>
		<td colspan="8" height="150px" align="center">등록된 상품이 없습니다..</td>
	</tr>
<% } %>
<%
	for(int i=0; i<list.size(); i++) {
		ProductDTO indexDto = list.get(i);
%>
	<tr>
		<td align="center"><%= jj %></td>
		<td align="center"><%= indexDto.getVendorName() %></td>
		<td>
			<a href="#" onClick="move('shopProduct_view', '<%= indexDto.getProductCode() %>', '<%= searchField %>', '<%= searchWord %>');" style="padding-left: 5px;">
			<%= indexDto.getProductName() %></a>
			<%	if(indexDto.getAttachInfo() == null || indexDto.getAttachInfo().equals("-")) { %>
			<%	} else { %>
				<span class="material-symbols-outlined">photo</span>
			<%	} %>
		</td>
		<td align="center"><%= indexDto.getProductPrice() %>만원</td>
		<td align="center"><%= indexDto.getRegiDate() %></td>
	</tr>
<%
	jj--;
	}
%>
	<tr>
		<td colspan="5" align="center" style="padding: 20px 0px;">
		<form name="searchForm" method="post" action="main.jsp?menuGubun=shopProduct_list">
			<select name="searchField">
				<option value="">-- 선택 --</option>
				<option value="productName" <% if(searchField.equals("productName")) { out.println("selected"); } %>>상품명</option>
				<option value="vendorName" <% if(searchField.equals("vendorName")) { out.println("selected"); } %>>제조사</option>
			</select>
			<input type="text" name="searchWord" value="<%= searchWord %>">
			<button type="button" onClick="submit()">검색</button>
		</form> 
		</td>
	</tr>
</table>

<div style="padding-top: 20px; width: 60%;" align="center">
	<%= Pagenation.pagingStr(totalRecord, pageSize, blockSize, pageNum, urlStr, searchField, searchWord) %>
</div>

<div style="padding-top: 10px; width: 60%;" align="right">
   |
   <a href="#" onClick="move('shopProduct_list', '', '', '');">목록</a>
   |
   <a href="#" onClick="move('shopProduct_regi', '', '', '');">등록</a>
   |
</div>

<script>
function move(value1, value2, searchField, searchWord) {
	var linkAddr = 'main.jsp?menuGubun=' + value1 + '&productCode=' + value2 + '&searchField=' + searchField + '&searchWord=' + searchWord;
	location.href = linkAddr;
}
</script>