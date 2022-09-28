<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/inc_header.jsp" %>

<h2>게시글 목록</h2>

<div style="width: 80%; padding-bottom: 10px;" align="left">
<c:choose>
	<c:when test="${ searchField == '' }">
	* 전체목록 : ${ map.totalRecord }건
	</c:when>
	<c:otherwise>
	* 검색어 "<b>${ searchWord }</b>"으/로 검색된 목록 : ${ map.totalRecord }건
	</c:otherwise>
</c:choose>
</div>

<table border="1" width="80%">
<tr>
	<td colspan="8" align="center" height="50px" style="padding-top: 10px;">
	<form name="searchForm">
         <select name="searchField" id="searchField">
         <c:choose>
            <c:when test="${ searchField == 'writer' }">
	            <option value="" >-선택-</option>
	            <option value="writer" selected >작성자</option>
	            <option value="content"  >내용</option>
	            <option value="all"  >작성자+내용</option>
            </c:when>
            <c:when test="${ searchField == 'content' }">
	        	<option value="" >-선택-</option>
	            <option value="writer" >작성자</option>
	            <option value="content" selected >내용</option>
	             <option value="all"  >작성자+내용</option>
            </c:when>
            <c:when test="${ searchField == 'all' }">
	        	<option value="" >-선택-</option>
	            <option value="writer" >작성자</option>
	            <option value="content" >내용</option>
	             <option value="all" selected>작성자+내용</option>
            </c:when>
            <c:otherwise>
          		<option value="" selected >-선택-</option>
	            <option value="writer" >작성자</option>
	            <option value="content" >내용</option>
	             <option value="all"  >작성자+내용</option>
            </c:otherwise>
         </c:choose>
         </select>
         <input type="text"  name="searchWord"  id="searchWord" value="${ searchWord }">
         <button type="button" onClick="search()">검색</button>
    </form>
	</td>
</tr>
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

<c:choose>
	<c:when test="${ empty board }">
	<tr>
		<td colspan="8" height="100px" align="center">등록된 게시글이 없습니다..</td> 
	</tr>
	</c:when>
	
	<c:otherwise>
		<c:forEach items="${ board }" var="board" varStatus="loop">
		<tr align="center">
			<td>${ map.totalRecord - (((map.pageNum - 1) * map.pageSize) + loop.index) }</td>
			<td align="center">
				<a href="#" onclick="move('board_view.do', '${ board.no }');">${ board.subject }</a>
			</td>
			<td>${ board.writer }</td>
			<td>${ board.regiDate }</td>
			<td>${ board.hit }</td>
			<td>${ board.ip }</td>
			<td>${ board.noticeNo }</td>
			<td>${ board.secretGubun }</td>
		</tr>
		</c:forEach>
	</c:otherwise>
</c:choose>

<tr>
	<td colspan="8" align="center" height="50px">
	${ map.pagingImg }
	</td>
</tr>

</table>

<div style="width: 80%; margin-top: 10px;" align="right">
|
<a href="${ path }/board_servlet/board_list.do">전체목록</a>
|
<a href="#" onclick="move('board_regi.do', '');">등록</a>
|
<a href="#" onclick="move('board_list.do', '');">목록</a>
|
</div>

<script>
function move(value1, value2) {
	location.href='${ path }/board_servlet/' + value1 + '?pageNum=${ map.pageNum }&no=' + value2 + '&${ searchQuery }';
}

function search() {
    searchForm.action="${path}/board_servlet/board_search.do";
    searchForm.method="post";
    searchForm.submit();
 }
</script>