<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/inc_header.jsp" %>

<h2>방명록관리</h2>

<div style="width: 60%; padding-bottom: 10px;" align="left">
<c:choose>
	<c:when test="${ searchField == '' }">
	* 전체목록 : ${ map.totalRecord }건
	</c:when>
	<c:otherwise>
	* 검색어 "<b>${ searchWord }</b>"으/로 검색된 목록 : ${ map.totalRecord }건
	</c:otherwise>
</c:choose>
</div>

<table border="1" width="60%">
<tr>
	<td colspan="4" align="center" height="50px" style="padding-top: 10px;">
	<form name="searchForm">
         <select name="searchField" id="searchField">
         <c:choose>
            <c:when test="${ searchField == 'name' }">
	            <option value="" >-선택-</option>
	            <option value="name" selected >이름</option>
	            <option value="content"  >내용</option>
	            <option value="name_content"  >이름+내용</option>
            </c:when>
            <c:when test="${ searchField == 'content' }">
	        	<option value="" >-선택-</option>
	            <option value="name" >이름</option>
	            <option value="content" selected >내용</option>
	             <option value="name_content"  >이름+내용</option>
            </c:when>
            <c:when test="${ searchField == 'name_content' }">
	        	<option value="" >-선택-</option>
	            <option value="name" >이름</option>
	            <option value="content" >내용</option>
	             <option value="name_content" selected>이름+내용</option>
            </c:when>
            <c:otherwise>
          		<option value="" selected >-선택-</option>
	            <option value="name" >이름</option>
	            <option value="content" >내용</option>
	             <option value="name_content"  >이름+내용</option>
            </c:otherwise>
         </c:choose>
         </select>
         <input type="text"  name="searchWord"  id="searchWord" value="${ searchWord }">
         <button type="button" onClick="search();">검색</button>
    </form>
	</td>
</tr>
<tr>
	<th>순번</th>
	<th>이름</th>
	<th>내용</th>
	<th>작성일</th>
</tr>

<c:choose>
	<c:when test="${ empty guestBook }">
	<tr>
		<td colspan="4" height="100px" align="center">등록된 방명록이 없습니다..</td> 
	</tr>
	</c:when>
	
	<c:otherwise>
		<c:forEach items="${ guestBook }" var="guestBook" varStatus="loop">
		<tr align="center">
			<td>${ map.totalRecord - (((map.pageNum - 1) * map.pageSize) + loop.index) }</td>
			<td>${ guestBook.name }</td>
			<td align="center">
				<a href="#" onclick="move('guestBook_view.do', '${ guestBook.no }');">${ guestBook.content }</a>
			</td>
			<td>${ guestBook.regiDate }</td>
		</tr>
		</c:forEach>
	</c:otherwise>
</c:choose>

<tr>
	<td colspan="4" align="center" height="50px">
	${ map.pagingImg }
	</td>
</tr>

</table>

<div style="width: 60%; margin-top: 10px;" align="right">
|
<a href="${ path }/guestBook_servlet/guestBook_list.do">전체목록</a>
|
<a href="#" onclick="move('guestBook_regi.do', '');">등록</a>
|
<a href="#" onclick="move('guestBook_list.do', '');">목록</a>
|
</div>

<script>
function move(value1, value2) {
	location.href='${ path }/guestBook_servlet/' + value1 + '?pageNum=${ map.pageNum }&no=' + value2 + '&${ searchQuery }';
}

function search() {
    searchForm.action="${path}/guestBook_servlet/guestBook_search.do";
    searchForm.method="post";
    searchForm.submit();
 }
</script>