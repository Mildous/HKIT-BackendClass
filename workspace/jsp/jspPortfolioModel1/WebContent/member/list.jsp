<%@page import="config.Pagenation"%>
<%@page import="config.Util"%>
<%@page import="member.model.dto.MemberDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="member.model.dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="_inc_top.jsp" %>
<%
	String searchField = request.getParameter("searchField");
	String searchWord = request.getParameter("searchWord");
	
	Util util = new Util();
	
	searchField = util.getNullBlankCheck(searchField, "");
	searchWord = util.getNullBlankCheck(searchWord, "");
	
	if(searchField.equals("") || searchWord.equals("")) {
		searchField = "";
		searchWord = "";
	}

	MemberDAO dao = new MemberDAO();
	MemberDTO arguDto = new MemberDTO();
	
	// ---------------- 페이징 처리 ---------------- 
	
	int totalRecord = dao.getTotalRecord(searchField, searchWord);
	int pageSize = 10;	// 한 페이지에 나타낼 레코드 개수
	int blockSize = 5;	// 출력할 블럭의 개수
			
	int block = (pageNum - 1) / pageSize;
	int jj = totalRecord - pageSize * (pageNum - 1);	//단지 화면에 보여질 일련번호..
			
	double totalPageDou = Math.ceil(totalRecord / (double)pageSize);
	int totalPage = (int)totalPageDou;
			
	int startRecord = pageSize * (pageNum - 1) + 1;
	int lastRecord = pageSize * pageNum;
	String urlStr = "main.jsp?menuGubun=member_list";
		
		
	ArrayList<MemberDTO> list = dao.getSelectAll(searchField, searchWord, startRecord, lastRecord);

%>

<h2>회원목록</h2>
<div style="border: 0px solid red; padding: 0px 0px; width: 80%;" align="left">
<%	if(searchField.equals("") || searchWord.equals("")) { %>
		*전체목록 (<%= list.size() %>건)
<%	} else { %>
		*검색어 "<%= searchWord %>"으/로 검색된 목록 (<%= list.size() %>건)
<%	} %>
</div>
<table border="1" width="80%">
	<tr>
		<th>순번</th>
		<th>아이디</th>
		<th>이름</th>
		<th>연락처</th>
		<th>주민번호</th>
		<th>등급</th>
		<th>등록일</th>
		<th>첨부사진</th>
	</tr>
	<% if(totalRecord == 0) { %>
	<tr>
		<td colspan="8" height="200px" align="center">등록된 내용이 없습니다..</td>
	</tr>
	<% } %>
	<%
		int num = totalRecord;
		for(int i=0; i<list.size(); i++) {
			MemberDTO dto = list.get(i);
	%>
		<tr>
			<td><%= num %></td>
			<td><a href="#" onClick="move('member_view', '<%= dto.getNo() %>');"><%= dto.getId() %></a></td>
			<td><%= dto.getName() %></td>
			<td><%= dto.getPhone() %></td>
			<td><%= dto.getJumin().substring(0, 8) %>******</td>
			<td><%= dto.getGrade() %></td>
			<td><%= dto.getRegiDate() %></td>
			<td>
				<%
					if(dto.getAttachInfo() == null || dto.getAttachInfo().equals("-")) {
						out.println("&nbsp;");
					} else {
						String[] imsiArray = dto.getAttachInfo().split(",");
						for(int j=0; j<imsiArray.length; j++) {
							String[] imsiArray2 = imsiArray[j].split("[|]");
							
							String imsiImgPath = "";
							imsiImgPath += request.getContextPath();
							imsiImgPath += "/attach";
							imsiImgPath += request.getContextPath();
							imsiImgPath += "/member/";
							imsiImgPath += imsiArray2[1];
							
							out.println("<img src='" + imsiImgPath + "' width='50' height='50'>");
						}
					}
				num--;
				%>
			</td>
		</tr>
	<%
		
	}
	%>
	
	<tr>
		<td colspan="8" align="center" style="padding: 20px 0px;">
			<form name="searchForm">
			<select name="searchField">
				<option value="" <% if(searchField.equals("")) { out.println("selected"); } %>>-- 선택 --</option>
				<option value="id" <% if(searchField.equals("id")) { out.println("selected"); } %>>아이디</option>
				<option value="name" <% if(searchField.equals("name")) { out.println("selected"); } %>>이름</option>
				<option value="phone" <% if(searchField.equals("phone")) { out.println("selected"); } %>>연락처</option>
				<option value="jumin" <% if(searchField.equals("jumin")) { out.println("selected"); } %>>주민번호</option>
				<option value="all" <% if(searchField.equals("all")) { out.println("selected"); } %>>ALL</option>
			</select>
			&nbsp;
			<input type="text" name="searchWord" value="<%= searchWord %>">
			&nbsp;
			<button type="button" onClick="search();">검색하기</button>
			</form>
		</td>
	</tr>
</table>

<div style="padding-top: 20px; width: 60%;" align="center">
	<%= Pagenation.pagingStr(totalRecord, pageSize, blockSize, pageNum, urlStr, searchField, searchWord) %>
</div>

<div style="padding-top: 20px; width: 80%; " align="right">
	|
	<a href="#" onClick="move('member_list', '');">목록</a>
	|
	<a href="#" onClick="move('member_insert', '');">등록</a>
	|
	<a href="#" onClick="move('member_attachInsert', '');">등록(attach)</a>
	|
</div>

<script>
function move(value1, value2) {
	location.href='main.jsp?menuGubun=' + value1 + '&no=' + value2;
}

function search() {
	document.searchForm.action = "mainProc.jsp?menuGubun=member_listSearch";
	document.searchForm.method = "post";
	document.searchForm.submit();
}
</script>