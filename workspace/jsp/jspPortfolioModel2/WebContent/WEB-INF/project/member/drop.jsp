<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/inc_header.jsp" %>

<script>
function validateForm(form) {
	
	if(form.passwd.value == "") {
		alert('비밀번호를 입력하세요');
		form.passwd.focus();
		return false;
	}
}
</script>
<h2>회원삭제</h2>

<form name="DirForm" method="post" action="${ path }/member_servlet/member_dropProc.do?${ searchQuery }" onsubmit="validateForm(this)">
<input type="hidden" name="no" value="${ dto.no }">
<table border="1" align="center" width="80%">
	<tr>
		<td width="150px" align="center">아이디</td>
		<td>${ dto.id }</td>
	</tr>
	<tr>
		<td align="center">비밀번호</td>
		<td><input type="password" name="passwd" value=""></td>
	</tr>
	<tr>
		<td align="center">이름</td>
		<td>${ dto.name }</td>
	</tr>
	<tr>
		<td align="center">생년월일</td>
		<td>${ dto.jumin1 }-${ dto.jumin2 }******
		</td>
	</tr>
	<tr>
		<td align="center">전화번호</td>
		<td>${ dto.phone1 }-${ dto.phone2 }-${ dto.phone3 }</td>
	</tr>
	<tr>
		<td align="center">이메일</td>
		<td>
			${ dto.email1 }@${ dto.email2 }</td>
	</tr>
	<tr>
		<td align="center">주소</td>
		<td>(${ dto.postcode }) ${ dto.address } ${ dto.detailAddress } ${ dto.extraAddress }</td>
	</tr>
	<tr>
		<td colspan="2" align="center" style="height: 50px;">
			<button type="submit">삭제</button>
			<button type="button" onclick="location.href='${ path }/member_servlet/member_view?pageNum=${ pageNum }&no=${ dto.no }&${ searchQuery }'">취소</button>
		</td>
	</tr>
</table>
</form>