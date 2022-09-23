<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/inc_header.jsp" %>

<h2>회원관리</h2>

<div style="width: 80%; padding-bottom: 10px;" align="left">
<c:choose>
	<c:when test="${ searchGubun == '' }">
	* 전체목록 : ${ map.totalRecord }건<br>
	</c:when>
	<c:otherwise>
	* 검색어 "<b>${ searchData }</b>"으/로 검색된 목록 : ${ map.totalRecord }건
	</c:otherwise>
</c:choose>
</div>
<table border="1" width="80%">

<tr>
	<td colspan="7" align="center" height="50px">
	<form name="searchForm">
         <select name="searchField" id="searchField">
         <c:choose>
            <c:when test="${ searchGubun == 'id' }">
            <option value="" >-선택-</option>
            <option value="id" selected >아이디</option>
            <option value="name"  >이름</option>
            <option value="id_name"  >아이디+이름</option>
            </c:when>
            <c:when test="${ searchGubun == 'name' }">
            <option value="" >-선택-</option>
            <option value="id"  >아이디</option>
            <option value="name" selected >이름</option>
            <option value="id_name"  >아이디+이름</option>
            </c:when>
            <c:when test="${ searchGubun == 'id_name' }">
            <option value="" >-선택-</option>
            <option value="id"  >아이디</option>
            <option value="name"  >이름</option>
            <option value="id_name" selected >아이디+이름</option>
            </c:when>
            <c:otherwise>
            <option value="" selected >-선택-</option>
            <option value="id"  >아이디</option>
            <option value="name"  >이름</option>
            <option value="id_name" selected >아이디+이름</option>
            </c:otherwise>
         </c:choose>
         </select>
         <input type="text"  name="searchWord"  id="searchWord" value="${ searchData }">
         <button type="button" onClick="search()">검색</button>
    </form>
	</td>
</tr>
<tr>
	<th>순번</th>
	<th>아이디</th>
	<th>비밀번호</th>
	<th>이름</th>
	<th>생년월일</th>
	<th>전화번호</th>
	<th>가입일</th>
</tr>

<c:choose>
	<c:when test="${ empty list }">
	<tr>
		<td colspan="7" height="200px" align="center">등록된 회원이 없습니다..</td> 
	</tr>
	</c:when>
	
	<c:otherwise>
		<c:forEach items="${ list }" var="dto" varStatus="loop">
		<tr align="center">
			<td>${ map.totalRecord - (((map.pageNum - 1) * map.pageSize) + loop.index) }</td>
			<td align="center">
				<a href="#" onclick="move('member_view.do', '${ dto.no }');">${ dto.id }</a>
			</td>
			<td>${ dto.passwd }</td>
			<td>${ dto.name }</td>
			<td>${ dto.jumin1 }-${ dto.jumin2 }******</td>
			<td>${ dto.phone1 }-${ dto.phone2 }-${ dto.phone3 }</td>
			<td>${ dto.regiDate }</td>
		</tr>
		</c:forEach>
	</c:otherwise>
</c:choose>

<tr>
	<td colspan="7" align="center" height="50px">
	${ map.pagingImg }
	</td>
</tr>
</table>

<div style="width: 80%; padding-top: 10px;" align="right">
|
<a href="${ path }/member_servlet/member_list.do">전체목록</a>
|
<a href="#" onclick="move('member_list.do', '');">목록</a>
|
<a href="#" onclick="move('member_regi.do', '');">등록</a>
|
</div>

<script>
function move(value1, value2) {
	location.href='${ path }/member_servlet/' + value1 + '?pageNum=${ map.pageNum }&no=' + value2 + '&${ searchQuery}';
}

function search() {
    searchForm.action="${path}/member_servlet/member_search.do";
    searchForm.method="post";
    searchForm.submit();
 }

</script>