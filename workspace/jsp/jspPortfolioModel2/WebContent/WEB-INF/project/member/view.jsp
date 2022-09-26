<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/inc_header.jsp" %>
<%@ include file="_inc_top.jsp" %>
<h2>회원상세정보</h2>

<table border="1" align="center" width="80%">
	<tr>
		<td width="150px">아이디</td>
		<td>${ dto.id }</td>
	</tr>
	<tr>
		<td>비밀번호</td>
		<td>${ dto.passwd }</td>
	</tr>
	<tr>
		<td>이름</td>
		<td>${ dto.name }</td>
	</tr>
	<tr>
		<td>생년월일</td>
		<td>${ dto.jumin1 }-${ dto.jumin2 }******</td>
	</tr>
	<tr>
		<td>전화번호</td>
		<td>${ dto.phone1 }-${ dto.phone2 }-${ dto.phone3 }</td>
	</tr>
	<tr>
		<td>이메일</td>
		<td>${ dto.email1 }@${ dto.email2 }</td>
	</tr>
	<tr>
		<td>주소</td>
		<td>(${ dto.postcode }) ${ dto.address } ${ dto.detailAddress } ${ dto.extraAddress }</td>
	</tr>
	<tr>
		<td colspan="2" align="center" style="height: 50px;">
			<button type="button" onclick="move('member_edit.do', '${ dto.no }');">수정</button>
			<button type="button" onclick="move('member_drop.do', '${ dto.no }');">삭제</button>
		</td>
	</tr>
</table>

<table border="0" align="center" width="80%">
<tr>
	<td width="100px">이전회원</td>
	<c:choose>
		<c:when test="${ dto.preNo < 1 }">
			<td>이전회원이 없습니다</td>
		</c:when>
		<c:otherwise>
			<td><a href="#" onclick="move('member_view.do', '${ dto.preNo }')">${ dto.preName }</a></td>
		</c:otherwise>
	</c:choose>
</tr>
<tr>
	<td width="100px">이전회원</td>
	<c:choose>
		<c:when test="${ dto.nxtNo < 1 }">
			<td>다음회원이 없습니다</td>
		</c:when>
		<c:otherwise>
			<td><a href="#" onclick="move('member_view.do', '${ dto.nxtNo }')">${ dto.nxtName }</a></td>
		</c:otherwise>
	</c:choose>
</tr>
</table>

<div style="width: 80%; margin-top: 10px;" align="right">
|
<a href="#" onclick="move('member_regi.do', '');">등록</a>
|
<a href="#" onclick="move('member_list.do', '');">목록</a>
|
</div>

<script>
function move(value1, value2) {
	location.href='${ path }/member_servlet/' + value1 + '?pageNum=${ pageNum }&no=' + value2 + '&${ searchQuery }';
}
</script>